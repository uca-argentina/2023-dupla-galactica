Class {
	#name : #DuplaGalacticaGame,
	#superclass : #Object,
	#instVars : [
		'players',
		'board',
		'dice',
		'goalLaps',
		'turnManager'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'Instance creation' }
DuplaGalacticaGame class >> with: aColorCollection and: aBoard throwing: aDiceCollection winningWhen: aValue [

	aColorCollection size <= 0 ifTrue: [ 
		Error signal: 'Cannot create a game with no players' ].
	(aValue) <= 0 ifTrue: [ 
		Error signal: 'Cannot create a game with that goal laps' ].
	^ self new
		  initializeWith: aColorCollection
		  and: aBoard
		  throwing: aDiceCollection
		  winningWhen: aValue.
]

{ #category : #Information }
DuplaGalacticaGame >> boxes [

	^ board boxes
]

{ #category : #Information }
DuplaGalacticaGame >> goalLaps [

	^ goalLaps
]

{ #category : #Initialization }
DuplaGalacticaGame >> initializeWith: aColorsCollection and: aBoard throwing: aDiceCollection winningWhen: aValue [

	players := aColorsCollection collect: [ :color | 
		           Player with: color ].
	board := aBoard.
	dice := aDiceCollection.
	turnManager := TurnManager with: (aColorsCollection  size).
	goalLaps :=  aValue.
]

{ #category : #Information }
DuplaGalacticaGame >> laps [

	^ players collect: [ :player | player lap ]
]

{ #category : #Player }
DuplaGalacticaGame >> moveAllToTheStart [ 
	players do: [:player | player moveToTheBeginning].
]

{ #category : #Player }
DuplaGalacticaGame >> moveNext: aValue [ 
	(players at: turnManager nextOne) move: aValue andCheck: board boxes size.
]

{ #category : #Player }
DuplaGalacticaGame >> moveNextPlayer [

	self winnerExists ifTrue: [ ^ self ].
	(players at: turnManager nextOne) move: (dice sumNumbers: [ :die | die throw ]) andCheck: board boxes size.
	board effect: (players at: turnManager nextOne) with: self.
	turnManager updateTurn
]

{ #category : #Player }
DuplaGalacticaGame >> moveOthers: aValue [
	players do: [ :player | 
		player color asSymbol == (players at: turnManager nextOne) color asSymbol ifFalse: [ 
			player move: aValue andCheck: board boxes size] ]
]

{ #category : #Information }
DuplaGalacticaGame >> nextPlayer [

	^ (players at: (turnManager nextOne)) color.
]

{ #category : #Information }
DuplaGalacticaGame >> parsecs [

	^ board parsecs
]

{ #category : #Information }
DuplaGalacticaGame >> positions [

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

{ #category : #Finalization }
DuplaGalacticaGame >> winner [

	self winnerExists
		ifTrue: [ 
			^ (players detect: [ :player | self winningCondition: player ])
				  color ]
		ifFalse: [ Error signal: 'There is no winner' ]
]

{ #category : #Finalization }
DuplaGalacticaGame >> winnerExists [

	^ players anySatisfy: [ :player | self winningCondition: player ]
]

{ #category : #Finalization }
DuplaGalacticaGame >> winningCondition: aPlayer [

	^ aPlayer lap >= self goalLaps
]
