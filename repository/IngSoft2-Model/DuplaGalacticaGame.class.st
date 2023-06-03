Class {
	#name : #DuplaGalacticaGame,
	#superclass : #Object,
	#instVars : [
		'players',
		'board',
		'dice',
		'goalLaps',
		'turnManager',
		'lastCardPlay',
		'current',
		'cardsInPosetion',
		'activeCards'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'Instance creation' }
DuplaGalacticaGame class >> with: aColorCollection and: aBoard throwing: aDiceCollection winningWhen: aValue using: aCardDealer [
	
	aColorCollection size <= 0 ifTrue: [ 
		Error signal: 'Cannot create a game with no players' ].
	aValue <= 0 ifTrue: [ 
		Error signal: 'Cannot create a game with that goal laps' ].
	^ self new
		  initializeWith: aColorCollection
		  and: aBoard
		  throwing: aDiceCollection
		  winningWhen: aValue
		  using: aCardDealer
]

{ #category : #Information }
DuplaGalacticaGame >> activeCards [

	^ activeCards
]

{ #category : #Cards }
DuplaGalacticaGame >> addCard: aCard [

	cardsInPosetion addLast: aCard.
]

{ #category : #Cards }
DuplaGalacticaGame >> apply: aCard to: anObjectivePlayer [

	| cardToUse |
	(self verify: aCard owner canUse: aCard) ifFalse: [ ^ self ].
	cardToUse := aCard transformTo: lastCardPlay.
	lastCardPlay := cardToUse.
	cardToUse applyCard: self to: anObjectivePlayer
]

{ #category : #Information }
DuplaGalacticaGame >> boxes [

	^ board boxes
]

{ #category : #Information }
DuplaGalacticaGame >> currentPlayer [

	^ current.
]

{ #category : #Information }
DuplaGalacticaGame >> findPlayer: aPlayer [

	^ players detect: [ :player | player color = aPlayer ]
]

{ #category : #Information }
DuplaGalacticaGame >> goalLaps [

	^ goalLaps
]

{ #category : #Initialization }
DuplaGalacticaGame >> initializeWith: aColorsCollection and: aBoard throwing: aDiceCollection winningWhen: aValue using: aCardDealer [

	players := aColorsCollection collect: [ :color | Player with: color ].
	board := aBoard.
	dice := aDiceCollection.
	turnManager := TurnManager with: aColorsCollection size.
	goalLaps := aValue.
	current := players at: 1.
	cardsInPosetion := OrderedCollection new.
	activeCards := OrderedCollection new.
	aCardDealer dealCards: cardsInPosetion to: aColorsCollection
]

{ #category : #Information }
DuplaGalacticaGame >> lightYears [

	^ board lightYears
]

{ #category : #Player }
DuplaGalacticaGame >> moveAllToTheStart [

	players do: [ :player | player moveToTheBeginning ]
]

{ #category : #Player }
DuplaGalacticaGame >> moveCurrent: aValue [

	self currentPlayer move: aValue andUpdateLap: board boxes size
]

{ #category : #Player }
DuplaGalacticaGame >> moveOthers: aValue [
	
	players do: [ :player | 
		player color == self currentPlayer color ifFalse: [ 
			player move: aValue andUpdateLap: board boxes size ] ]
]

{ #category : #Player }
DuplaGalacticaGame >> movePlayer [

	| aValue |
	aValue := dice size == 1
		          ifTrue: [ dice throw ]
		          ifFalse: [ dice sumNumbers: [ :die | die throw ] ].
	activeCards do: [ :card | (card owner = current color) ifTrue: [aValue:= card applyEffect: aValue ]].
	self winnerExists ifTrue: [ ^ self ].
	self currentPlayer move: aValue andUpdateLap: board boxes size.
	
	board effectAt: self currentPlayer position In: self.
	turnManager goNext.
	current := players at: turnManager current
]

{ #category : #Information }
DuplaGalacticaGame >> parsecs [

	^ board parsecs
]

{ #category : #Information }
DuplaGalacticaGame >> playersCardInPosetion [

	| cardsPerPlayer aValue |
	cardsPerPlayer := OrderedCollection new.
	aValue := 0.
	players do: [ :player | 
		cardsInPosetion do: [ :card | 
			card owner = player color ifTrue: [ aValue := aValue + 1 ] ].
		cardsPerPlayer addLast: aValue.
		aValue := 0 ].
	^ cardsPerPlayer
]

{ #category : #Information }
DuplaGalacticaGame >> playersColors [

	^ players collect: [ :player | player color ]
]

{ #category : #Information }
DuplaGalacticaGame >> playersLaps [

	^ players collect: [ :player | player lap ]
]

{ #category : #Information }
DuplaGalacticaGame >> playersPositions [

	^ players collect: [ :player | player position ]
]

{ #category : #Finalization }
DuplaGalacticaGame >> ranking [

	| ranking |
	ranking := players collect: [ :player | player ].
	ranking sort: [ :player1 :player2 | 
		player1 position + (player1 lap * self boxes size)
		> (player2 position + (player2 lap * self boxes size)) ].
	^ ranking collect: [ :player | player color ]
]

{ #category : #Cards }
DuplaGalacticaGame >> repeatEffectTo: aPlayerColor [

	| lastPosition |
	lastPosition := current position.
	current := self findPlayer: aPlayerColor.
	board effectAt: lastPosition In: self.
	current := players at: turnManager current
]

{ #category : #Cards }
DuplaGalacticaGame >> verify: aPlayerColor canUse: aCard [

	| cardCollection i res |
	i := 1.
	res := false.
	cardCollection := OrderedCollection new.
	cardsInPosetion do: [ :card | 
		(card toString = aCard toString and:
			 (i = 1 and: aPlayerColor = card owner))
			ifTrue: [ 
				i := 2.
				res := true ]
			ifFalse: [ cardCollection addLast: card ] ].
	cardsInPosetion := cardCollection.
	res ifFalse: [ ^ res ].
	aCard isPermanent
		ifTrue: [ 
			aPlayerColor = self currentPlayer color
				ifTrue: [ ^ true ]
				ifFalse: [ ^ false ] ]
		ifFalse: [ ^ true ]
]

{ #category : #Finalization }
DuplaGalacticaGame >> winner [

	self winnerExists
		ifTrue: [ 
			^ (players detect: [ :player | self wins: player ])
				  color ]
		ifFalse: [ Error signal: 'There is no winner' ]
]

{ #category : #Finalization }
DuplaGalacticaGame >> winnerExists [

	^ players anySatisfy: [ :player | self wins: player ]
]

{ #category : #Finalization }
DuplaGalacticaGame >> wins: aPlayer [

	^ aPlayer lap >= self goalLaps
]
