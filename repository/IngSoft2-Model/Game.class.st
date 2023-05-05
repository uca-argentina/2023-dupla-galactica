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

{ #category : #Initialization }
Game >> addPlayers: aColorsCollection with: aValue [

	| aPlayerCollection aSpaceship |
	aPlayerCollection := OrderedCollection new.
	aColorsCollection do: [ :color | 
		aSpaceship := Spaceship with: color.
		aPlayerCollection addLast: (Player with: aSpaceship) ].
	board := Board with: aValue and: aPlayerCollection.
	players := aPlayerCollection.
]

{ #category : #Information }
Game >> board [

	^ board
]

{ #category : #Information }
Game >> dice [

	^ dice
]

{ #category : #Finalization }
Game >> finalMessagge [

	| color position messagge |
	messagge := ''.
	self players do: [ :player | 
		color := player color.
		position := player position.
		messagge := messagge , color , ':' , position asString , ' ' ].
	^ messagge
]

{ #category : #Finalization }
Game >> finalPositions [

	| positions |
	positions := OrderedCollection new.
	self players do: [ :player | positions addLast: player position ].
	^ positions
]

{ #category : #Initialization }
Game >> initializeWith: aColorsCollection and: aValue throwing: aDiceCollection [
	(self addPlayers: aColorsCollection with: aValue).
	dice := aDiceCollection.
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
Game >> winner [

	self winnerExists
		ifTrue: [ 
			^ (self players detect: [ :player | 
				   self winningCondition: player ]) color ]
		ifFalse: [ ^ 'Nobody' ]
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
