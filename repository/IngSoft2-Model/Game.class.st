Class {
	#name : #Game,
	#superclass : #Object,
	#instVars : [
		'diceCollection',
		'boardAtBox',
		'players'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
Game class >> with: aSpaceshipCollection and: aValue throwing: aDiceCollection [ 
	^self new initializeWith: aSpaceshipCollection and: aValue throwing: aDiceCollection.
]

{ #category : #Information }
Game >> board [

	^ boardAtBox
]

{ #category : #Information }
Game >> dice [
	^(diceCollection).
]

{ #category : #Finalization }
Game >> finalMessagge [

	| color position messagge |
	messagge := ''.
	players do: [ :spaceship | 
		color := spaceship color.
		position := spaceship position.
		messagge := messagge , color , ':' , position asString , ' ' ].
	^ messagge
]

{ #category : #Finalization }
Game >> finalPositions [
	self winnerExists
		ifTrue: [ ^ self finalMessagge  ]
		ifFalse: [ ^ 'the game has not finished yet' ]
]

{ #category : #Initialization }
Game >> initializeWith: aColorsCollection and: aValue throwing: aDiceCollection [

	| aSpaceship aPlayerCollection|
	aPlayerCollection  := OrderedCollection new.
	aColorsCollection do: [ :color |
		aSpaceship:= Spaceship with: color.
		aPlayerCollection  addLast: (Player with: aSpaceship).].
	boardAtBox := Board with: aValue and: aPlayerCollection.
	diceCollection := aDiceCollection.
	players := aPlayerCollection.
]

{ #category : #Player }
Game >> moveNextPlayer [
	
	(self board movePlayer: self dice)
]

{ #category : #Player }
Game >> nextPlayer [
	^(self board nextPlayer).
]

{ #category : #Finalization }
Game >> winner [

	self winnerExists
		ifTrue: [ 
			^ (players detect: [ :spaceship | 
				   self winningCondition: spaceship ]) color ]
		ifFalse: [ ^ 'Nobody' ]
]

{ #category : #Finalization }
Game >> winnerExists [

	^ players anySatisfy: [ :spaceship | 
		  self winningCondition: spaceship ]
]

{ #category : #Finalization }
Game >> winningCondition: spaceship [

	^ (spaceship position > boardAtBox length or:
		  spaceship position == boardAtBox length)
]
