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
DuplaGalacticaGame class >> with: aColorCollection and: aDataBoardCollection throwing: aDiceCollection [

	(aDataBoardCollection at: 3) <= 0 ifTrue: [ 
		Error signal: 'Cannot create a game a negative parsec amount' ].
	aColorCollection size <= 0 ifTrue: [ 
		Error signal: 'Cannot create a game with no players' ].
	(aDataBoardCollection at: 2) <= 0 ifTrue: [ 
		Error signal: 'Cannot create a game with that goal laps' ].
	^ self new
		  initializeWith: aColorCollection
		  and: aDataBoardCollection
		  throwing: aDiceCollection
]

{ #category : #Information }
DuplaGalacticaGame >> boxes [

	^ board boxes
]

{ #category : #Initialization }
DuplaGalacticaGame >> createBoxes: aDataBoardCollection [

	| boxes |
	boxes := OrderedCollection new.
	(aDataBoardCollection at: 1) timesRepeat: [ 
		boxes addLast: (self randomBox: aDataBoardCollection) ].
	^ boxes
]

{ #category : #Information }
DuplaGalacticaGame >> goalLaps [

	^ goalLaps
]

{ #category : #Initialization }
DuplaGalacticaGame >> initializeWith: aColorsCollection and: aDataBoardCollection throwing: aDiceCollection [

	players := aColorsCollection collect: [ :color | 
		           Player with: color ].
	board := Board
		         with: (aDataBoardCollection at: 1)
		         effects: (self createBoxes: aDataBoardCollection)
		         measure: (aDataBoardCollection at: 3).
	dice := aDiceCollection.
	turnManager := TurnManager with: (aColorsCollection  size).
	goalLaps := aDataBoardCollection at: 2
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
	(players at: turnManager nextOne) effect: aValue check: board length.
]

{ #category : #Player }
DuplaGalacticaGame >> moveNextPlayer [

	self winnerExists ifTrue: [ ^ self ].
	(players at: turnManager nextOne) move: dice check: board length.
	board effect: (players at: turnManager nextOne) with: self.
	turnManager updateTurn
]

{ #category : #Player }
DuplaGalacticaGame >> moveOthers: aValue [
	players do: [ :player | 
		player color asSymbol == (players at: turnManager nextOne) color asSymbol ifFalse: [ 
			player effect: aValue check: board length] ]
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

{ #category : #Initialization }
DuplaGalacticaGame >> randomBox: aDataBoardCollection [

	| aRandomValue |
	aRandomValue := 100 atRandom.
	^ aRandomValue <= 40
		  ifTrue: [ NoEffectBox new ]
		  ifFalse: [ 
			  aRandomValue <= 60
				  ifTrue: [ WormHoleBox new ]
				  ifFalse: [ 
					  aRandomValue <= 80
						  ifTrue: [ SpeedUpBox new ]
						  ifFalse: [ 
							  aRandomValue <= 90
								  ifTrue: [ MoonWalkBox with: (aDataBoardCollection at: 1) ]
								  ifFalse: [ 
									  aRandomValue <= 98
										  ifTrue: [ HyperJumpBox with: (aDataBoardCollection at: 4) ]
										  ifFalse: [ AtomicBombBox new ] ] ] ] ]
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
