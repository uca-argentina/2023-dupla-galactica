Class {
	#name : #LoadedGame,
	#superclass : #Object,
	#instVars : [
		'board',
		'players',
		'dice',
		'goalLaps'
	],
	#category : #'IngSoft2-Tests'
}

{ #category : #'Instance creation' }
LoadedGame class >> with: aColorCollection and: aValue throwing: aDiceCollection winningWhen: laps effects: aBoxCollection [

	^ self new
		  initializeWith: aColorCollection
		  and: aValue
		  throwing: aDiceCollection
		  winningWhen: laps
		  effects: aBoxCollection
]

{ #category : #Information }
LoadedGame >> board [
	^ board
]

{ #category : #Initialization }
LoadedGame >> createPlayers: aColorsCollection [

	| aPlayerCollection |
	aPlayerCollection := OrderedCollection new.
	aColorsCollection do: [ :color | 
		aPlayerCollection addLast: (Player with: (Spaceship with: color)) ].
	^ aPlayerCollection
]

{ #category : #Information }
LoadedGame >> dice [
	^ dice
]

{ #category : #Information }
LoadedGame >> goalLaps [
	^ goalLaps
]

{ #category : #Initialization }
LoadedGame >> initializeWith: aColorsCollection and: aValue throwing: aDiceCollection winningWhen: laps effects: aBoxCollection [ 
	| aPlayerCollection |
	aPlayerCollection := (self createPlayers: aColorsCollection).
	board := Board with: aValue and: aPlayerCollection effects: aBoxCollection.
	players := aPlayerCollection.
	dice := aDiceCollection.
	goalLaps := laps.
]

{ #category : #Information }
LoadedGame >> laps [

	^ self players collect: [ :player | player lap ]
]

{ #category : #Player }
LoadedGame >> moveNextPlayer [

	self winnerExists ifFalse: [ self board movePlayer: self dice ]
]

{ #category : #Player }
LoadedGame >> nextPlayer [

	^ self board nextOne
]

{ #category : #Information }
LoadedGame >> parsecs [
	^ self board parsecs
]

{ #category : #Information }
LoadedGame >> players [
	^ players
]

{ #category : #Information }
LoadedGame >> positions [

	^ self players collect: [ :player | player spaceship position ]
]

{ #category : #Finalization }
LoadedGame >> winner [

	self winnerExists
		ifTrue: [ 
			^ (self players detect: [ :player | self winningCondition: player ])
				  color ]
		ifFalse: [ Error signal: 'There is no winner' ]
]

{ #category : #Finalization }
LoadedGame >> winnerExists [

	^ self players anySatisfy: [ :player | self winningCondition: player ]
]

{ #category : #Finalization }
LoadedGame >> winningCondition: aPlayer [

	^ aPlayer lap >= self goalLaps
]
