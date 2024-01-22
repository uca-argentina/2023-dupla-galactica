Class {
	#name : #DuplaGalacticaGame,
	#superclass : #Object,
	#instVars : [
		'players',
		'board',
		'dice',
		'goalLaps',
		'turnManager',
		'current',
		'cardManager',
		'numberOfCards'
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
DuplaGalacticaGame >> addCard: aCard [
	
	cardManager addCard: aCard.
	numberOfCards := numberOfCards +1.
]

{ #category : #Cards }
DuplaGalacticaGame >> apply: aCard to: anObjectivePlayer [

	cardManager apply: aCard to: anObjectivePlayer at: self.
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
	current := players at: turnManager current.
	cardManager := CardManager using: aCardDealer with: aColorsCollection.
	numberOfCards:= (cardManager cardsInPosetion) size.
]

{ #category : #Cards }
DuplaGalacticaGame >> isValidPlayer: objective [

	self playersColors
		detect: [ :color | color = objective ]
		ifFound: [ ^ true ]
		ifNone: [ Error signal: 'That is not a valid objective' ]
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

	(players reject: [ :player | 
		 player color == self currentPlayer color ]) do: [ :player | 
		player move: aValue andUpdateLap: board boxes size ]
]

{ #category : #Player }
DuplaGalacticaGame >> movePlayer [

	| aValue |
	aValue := dice size == 1
		          ifTrue: [ dice throw ]
		          ifFalse: [ dice sumNumbers: [ :die | die throw ] ].
		
	aValue:=aValue+ (cardManager calculateEffectOn: (current color)).
	
	self winnerExists ifTrue: [ ^ self ].
	current move: aValue andUpdateLap: board boxes size.
	board effectAt: current position In: self.
	turnManager goNext.
	current := players at: turnManager current
]

{ #category : #Information }
DuplaGalacticaGame >> numberOfCards [

	^ numberOfCards
]

{ #category : #Information }
DuplaGalacticaGame >> parsecs [

	^ board parsecs
]

{ #category : #Information }
DuplaGalacticaGame >> playersCardInPosetion [

	^ cardManager cardsInPosetionOf: players
]

{ #category : #Information }
DuplaGalacticaGame >> playersColors [

	^ players collect: [ :player | player color ]
]

{ #category : #Information }
DuplaGalacticaGame >> playersLaps [

	^ players collect: [ :player | player position lap ]
]

{ #category : #Information }
DuplaGalacticaGame >> playersPositions [

	^ players collect: [ :player | player position boxNumber ]
]

{ #category : #Finalization }
DuplaGalacticaGame >> ranking [

	| ranking |
	ranking := players collect: [ :player | player ].
	ranking sort: [ :player1 :player2 | 
		player1 position > player2 position ].
	^ ranking collect: [ :player | player color ]
]

{ #category : #Cards }
DuplaGalacticaGame >> repeatEffectTo: aPlayerColor [

	| lastPosition |
	lastPosition := current position.
	current := players detect: [ :player | player color = aPlayerColor].
	board effectAt: lastPosition In: self.
	current := players at: turnManager current
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

	^ aPlayer position lap >= self goalLaps
]
