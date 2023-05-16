Class {
	#name : #DuplaGalacticaGame,
	#superclass : #Object,
	#instVars : [
		'players',
		'board',
		'dice',
		'goalLaps'
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
		           Player with: (Spaceship with: color) ].
	board := Board
		         with: (aDataBoardCollection at: 1)
		         and: players
		         effects: (self createBoxes: aDataBoardCollection)
		         measure: (aDataBoardCollection at: 3).
	dice := aDiceCollection.
	goalLaps := aDataBoardCollection at: 2
]

{ #category : #Information }
DuplaGalacticaGame >> laps [

	^ players collect: [ :player | player lap ]
]

{ #category : #Player }
DuplaGalacticaGame >> moveNextPlayer [

	self winnerExists ifFalse: [ board movePlayer: dice ]
]

{ #category : #Information }
DuplaGalacticaGame >> nextPlayer [

	^ board nextOne color
]

{ #category : #Information }
DuplaGalacticaGame >> parsecs [

	^ board parsecs
]

{ #category : #Information }
DuplaGalacticaGame >> positions [

	^ players collect: [ :player | player spaceship position ]
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
		player1 spaceship position + (player1 lap * self boxes size)
		> (player2 spaceship position + (player2 lap * self boxes size)) ].
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
