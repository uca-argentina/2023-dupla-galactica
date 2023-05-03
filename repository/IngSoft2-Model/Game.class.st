Class {
	#name : #Game,
	#superclass : #Object,
	#instVars : [
		'diceCollection',
		'boardAtBox',
		'spaceships'
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
	spaceships do: [ :spaceship | 
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

	|aSpaceshipCollection turn|
	turn:=1.
	aSpaceshipCollection := OrderedCollection new.
	aColorsCollection do: [ :color | aSpaceshipCollection addLast: (Spaceship putOn: 0 with:color  and:turn).
		turn:=turn+1 ].
	boardAtBox := Board with: aValue and: aSpaceshipCollection.
	diceCollection := aDiceCollection.
	spaceships := aSpaceshipCollection.
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
			^ (spaceships detect: [ :spaceship | 
				   self winningCondition: spaceship ]) color ]
		ifFalse: [ ^ 'Nobody' ]
]

{ #category : #Finalization }
Game >> winnerExists [

	^ spaceships anySatisfy: [ :spaceship | 
		  self winningCondition: spaceship ]
]

{ #category : #Finalization }
Game >> winningCondition: spaceship [

	^ (spaceship position > boardAtBox sizeIs or:
		  spaceship position == boardAtBox sizeIs)
]
