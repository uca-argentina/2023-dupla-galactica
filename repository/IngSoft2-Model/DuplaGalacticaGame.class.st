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

{ #category : #'instance creation' }
DuplaGalacticaGame class >> with: aColorCollection and: aValue throwing: aDiceCollection winningWhen: laps [
	(aColorCollection size <= 0) ifTrue:[Error signal: 'Cannot create a game with no players'].
	(laps <= 0) ifTrue:[Error signal: 'Cannot create a game with that goal laps'].
	^ self new
		  initializeWith: aColorCollection
		  and: aValue
		  throwing: aDiceCollection
		  winningWhen: laps
]

{ #category : #Information }
DuplaGalacticaGame >> boxes [
	^board boxes.
]

{ #category : #Initialization }
DuplaGalacticaGame >> createBoxes: aValue measure: aParsecs [ 
	|boxes|
	boxes:= OrderedCollection new.
	1 to: aValue do: [ :i | boxes addLast: (self randomBox: aValue measure: aParsecs) ].
	^boxes
]

{ #category : #Initialization }
DuplaGalacticaGame >> createRandomHyperJump: aValue with: parsecs [ 
	|values|
	values:= OrderedCollection new.
	1 to: (aValue atRandom) do: [:i | (2 atRandom)==1 ifTrue:[values addLast: (parsecs atRandom)] ifFalse:[values addLast: ((parsecs atRandom)*(-1))]].
	^ (HyperJumpBox with: values).
]

{ #category : #Information }
DuplaGalacticaGame >> goalLaps [

	^ goalLaps
]

{ #category : #Initialization }
DuplaGalacticaGame >> initializeWith: aColorsCollection and: aValue throwing: aDiceCollection winningWhen: laps [
	players := aColorsCollection collect: [ :color | Player with: (Spaceship with: color) ].
	board := Board with: aValue and: players effects: (self createBoxes: aValue measure: 100).
	dice := aDiceCollection.
	goalLaps := laps
]

{ #category : #Information }
DuplaGalacticaGame >> laps [

	^ players collect: [ :player | player lap ]
]

{ #category : #Player }
DuplaGalacticaGame >> moveNextPlayer [

	self winnerExists ifFalse: [ board movePlayer:  dice ]
]

{ #category : #Player }
DuplaGalacticaGame >> nextPlayer [

	^ ( board nextOne) color.
]

{ #category : #Information }
DuplaGalacticaGame >> parsecs [

	^  board parsecs
]

{ #category : #Information }
DuplaGalacticaGame >> positions [

	^ players collect: [ :player | player spaceship position ]
]

{ #category : #Initialization }
DuplaGalacticaGame >> randomBox: aValue measure: parsecs [

	| aRandomValue |
	aRandomValue := 100 atRandom.
	^ (aRandomValue <= 40
		       ifTrue: [ NoEffectBox new ]
		       ifFalse: [ 
			       aRandomValue <= 60
				       ifTrue: [ WormHoleBox new ]
				       ifFalse: [ 
					       aRandomValue <= 80
						       ifTrue: [ SpeedUpBox new ]
						       ifFalse: [ 
							       aRandomValue <= 90
								       ifTrue: [ MoonWalkBox with: (aValue atRandom * -1) ]
								       ifFalse: [ 
									       aRandomValue <= 98
										       ifTrue: [ 
										       self createRandomHyperJump: aValue with: parsecs ]
										       ifFalse: [ AtomicBombBox new ] ] ] ] ]).
]

{ #category : #Finalization }
DuplaGalacticaGame >> ranking [

	| ranking |
	ranking := OrderedCollection new.
	players do: [ :player | ranking addLast: player ].
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
