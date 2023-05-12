Class {
	#name : #Game,
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
Game class >> with: aColorCollection and: aValue throwing: aDiceCollection winningWhen: laps effects: aBoxCollection [
	^self new initializeWith: aColorCollection and: aValue throwing: aDiceCollection winningWhen: laps effects: aBoxCollection.
]

{ #category : #Information }
Game >> board [

	^ board
]

{ #category : #Initialization }
Game >> createPlayers: aColorsCollection [

	| aPlayerCollection|
	aPlayerCollection := OrderedCollection new.
	aColorsCollection do: [ :color | 
		aPlayerCollection addLast: (Player with: (Spaceship with: color)) ].
	^ aPlayerCollection
]

{ #category : #Information }
Game >> dice [

	^ dice
]

{ #category : #Information }
Game >> goalLaps [
	^ goalLaps
]

{ #category : #Initialization }
Game >> initializeWith: aColorsCollection and: aValue throwing: aDiceCollection winningWhen: laps effects: aBoxCollection [ 
	| aPlayerCollection |
	aPlayerCollection := (self createPlayers: aColorsCollection).
	board := Board with: aValue and: aPlayerCollection effects: aBoxCollection.
	players := aPlayerCollection.
	dice := aDiceCollection.
	goalLaps := laps.
]

{ #category : #Player }
Game >> laps [
	|laps|
	laps:=(OrderedCollection new).
	self players do: [ :player | laps addLast: (player lap) ].
	^laps
]

{ #category : #Player }
Game >> moveNextPlayer [
	(self winnerExists) ifFalse: [(self board movePlayer: self dice)].
]

{ #category : #Player }
Game >> nextPlayer [
	^(self board nextPlayer).
]

{ #category : #Information }
Game >> parsecsAmount [
	^self board parsecsAmount.
]

{ #category : #Information }
Game >> players [
	^ players
]

{ #category : #Finalization }
Game >> positions [

	| positions |
	positions := OrderedCollection new.
	self players do: [ :player | positions addLast: player position ].
	^ positions
]

{ #category : #Finalization }
Game >> winner [

	self winnerExists
		ifTrue: [ 
			^ (self players detect: [ :player | 
				   self winningCondition: player ]) color ]
		ifFalse: [ Error signal: 'There is no winner']
]

{ #category : #Finalization }
Game >> winnerExists [

	^ self players anySatisfy: [ :player | 
		  self winningCondition: player ]
]

{ #category : #Finalization }
Game >> winningCondition: aPlayer [

	 ^ ((aPlayer lap == (self goalLaps)) or: (aPlayer lap > (self goalLaps)) ).
]
