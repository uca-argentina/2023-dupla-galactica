Class {
	#name : #Game,
	#superclass : #Object,
	#instVars : [
		'players',
		'board',
		'dice'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
Game class >> with: aSpaceshipCollection and: aValue throwing: aDiceCollection [ 
	^self new initializeWith: aSpaceshipCollection and: aValue throwing: aDiceCollection.
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

{ #category : #Initialization }
Game >> initializeWith: aColorsCollection and: aValue throwing: aDiceCollection [
	| aPlayerCollection |
	aPlayerCollection := (self createPlayers: aColorsCollection).
	board := Board with: aValue and: aPlayerCollection.
	players := aPlayerCollection.
	dice := aDiceCollection.
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

	^ (aPlayer position > board length or:
		  aPlayer position == board length)
]
