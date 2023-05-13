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
DuplaGalacticaGame class >> with: aColorCollection and: aValue throwing: aDiceCollection winningWhen: laps effects: aBoxCollection [

	^ self new
		  initializeWith: aColorCollection
		  and: aValue
		  throwing: aDiceCollection
		  winningWhen: laps
		  effects: aBoxCollection
]

{ #category : #Information }
DuplaGalacticaGame >> board [

	^ board
]

{ #category : #Initialization }
DuplaGalacticaGame >> createPlayers: aColorsCollection [

	| aPlayerCollection |
	aPlayerCollection := OrderedCollection new.
	aColorsCollection do: [ :color | 
		aPlayerCollection addLast: (Player with: (Spaceship with: color)) ].
	^ aPlayerCollection
]

{ #category : #Information }
DuplaGalacticaGame >> dice [

	^ dice
]

{ #category : #Information }
DuplaGalacticaGame >> goalLaps [

	^ goalLaps
]

{ #category : #Initialization }
DuplaGalacticaGame >> initializeWith: aColorsCollection and: aValue throwing: aDiceCollection winningWhen: laps effects: aBoxCollection [ 
	| aPlayerCollection |
	aPlayerCollection := (self createPlayers: aColorsCollection).
	board := Board with: aValue and: aPlayerCollection effects: aBoxCollection.
	players := aPlayerCollection.
	dice := aDiceCollection.
	goalLaps := laps.
]

{ #category : #Information }
DuplaGalacticaGame >> laps [

	^ self players collect: [ :player | player lap ]
]

{ #category : #Player }
DuplaGalacticaGame >> moveNextPlayer [

	self winnerExists ifFalse: [ self board movePlayer: self dice ]
]

{ #category : #Player }
DuplaGalacticaGame >> nextPlayer [

	^ self board nextOne
]

{ #category : #Information }
DuplaGalacticaGame >> parsecs [

	^ self board parsecs
]

{ #category : #Information }
DuplaGalacticaGame >> players [

	^ players
]

{ #category : #Information }
DuplaGalacticaGame >> positions [

	^ self players collect: [ :player | player spaceship position ]
]

{ #category : #Finalization }
DuplaGalacticaGame >> winner [

	self winnerExists
		ifTrue: [ 
			^ (self players detect: [ :player | self winningCondition: player ])
				  color ]
		ifFalse: [ Error signal: 'There is no winner' ]
]

{ #category : #Finalization }
DuplaGalacticaGame >> winnerExists [

	^ self players anySatisfy: [ :player | self winningCondition: player ]
]

{ #category : #Finalization }
DuplaGalacticaGame >> winningCondition: aPlayer [

	^ aPlayer lap >= self goalLaps
]
