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
		'lastPosition',
		'current'
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

{ #category : #Cards }
DuplaGalacticaGame >> addCard: aCard to: aPlayer [

	(self findPlayer: aPlayer) addCard: aCard.
]

{ #category : #Cards }
DuplaGalacticaGame >> applyCard: aCard from: aSourcePlayer [
	|source2|
	source2 := self findPlayer: aSourcePlayer.
	(source2 has: aCard) ifFalse: [ ^ self ].
	(self player: source2 canPlay: aCard) ifFalse: [ ^ self ].
	aCard applyCards: self.
	(aCard toString) = 'Redo' ifFalse: [ 
		lastCardPlay := aCard ]
]

{ #category : #Information }
DuplaGalacticaGame >> boxes [

	^ board boxes
]

{ #category : #Information }
DuplaGalacticaGame >> currentPlayer [

	^ current.
]

{ #category : #Player }
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
	aCardDealer dealCards: players.
	board := aBoard.
	dice := aDiceCollection.
	turnManager := TurnManager with: aColorsCollection size.
	goalLaps := aValue.
	current:= players at:1.
]

{ #category : #Information }
DuplaGalacticaGame >> lastCardPlay [
	^ lastCardPlay
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
	self winnerExists ifTrue: [ ^ self ].
	self currentPlayer move: aValue andUpdateLap: board boxes size.
	lastPosition := self currentPlayer position.
	board effectAt: self currentPlayer position In: self.
	turnManager goNext.
	current := players at: turnManager current
]

{ #category : #Information }
DuplaGalacticaGame >> parsecs [

	^ board parsecs
]

{ #category : #Cards }
DuplaGalacticaGame >> player: aPlayer canPlay: aCard [

	aCard isPermanent
		ifTrue: [ 
			aPlayer color = self currentPlayer color
				ifTrue: [ ^ true ]
				ifFalse: [ ^ false ] ]
		ifFalse: [ ^ true ]
]

{ #category : #Informatio }
DuplaGalacticaGame >> players [
	^ players
]

{ #category : #Information }
DuplaGalacticaGame >> playersCardInPosetion [

	^ players collect: [ :player | player cardsInPosetion ]
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

{ #category : #Player }
DuplaGalacticaGame >> repeatEffectTo: aPlayer [ 
	current:= aPlayer.
	board effectAt: (lastPosition) In: self.
	current:= players at: turnManager current.
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
