Class {
	#name : #Board,
	#superclass : #Object,
	#instVars : [
		'spaceshipOnBoard',
		'sizeOfBoard'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
Board class >> size: aSize [ 
	^(self new) initializeWithSizeOf: aSize.
]

{ #category : #'instance creation' }
Board class >> with: aSpaceship [ 
	^(self new) initializeWith: aSpaceship.
]

{ #category : #'instance creation' }
Board class >> with: aValue and: aCollectionOfSpaceships [ 
	^((self new) initializeWithSizeOf:aValue) initializeWith: aCollectionOfSpaceships.
]

{ #category : #spaceships }
Board >> fartherPosition [

	| maxValue  |
	maxValue := 0.
	self spaceships do: [ :spaceship | 
		maxValue := maxValue max: spaceship position ].
	^ maxValue.
]

{ #category : #finalization }
Board >> finalMessage [

	| color position message |
	message := ''.
	self spaceships do: [ :spaceship | 
		color := spaceship color.
		position := spaceship position.
		message:= message, color, ':', position asString, ' '].
	^ message
]

{ #category : #finalization }
Board >> finalPositions [

	self winnerExists
		ifTrue: [ ^ self finalMessage ]
		ifFalse: [ ^ 'the game has not finished yet' ]
]

{ #category : #initialization }
Board >> initializeWith: aSpaceship [ 
	spaceshipOnBoard:=aSpaceship.
]

{ #category : #initialization }
Board >> initializeWithSizeOf: aSize [ 
	sizeOfBoard:=aSize.
]

{ #category : #initialization }
Board >> isCreatedSuccessfully [
	^true.
]

{ #category : #spaceships }
Board >> moveSpaceship: movementValue [

	(spaceshipOnBoard detect: [ :spaceship | spaceship turn == 1 ]) moveOn: movementValue.
	self winnerExists  ifFalse: [ self someoneMoves. ].
]

{ #category : #information }
Board >> nextPlayer [
	^ (self spaceships detect: [:spaceship | (spaceship turn == 1)]) color .
	 
]

{ #category : #information }
Board >> sizeIs [
	^sizeOfBoard.
]

{ #category : #spaceships }
Board >> someoneMoves [
	
	self spaceships do: [ :spaceship | 
		spaceship someonePlays.
		spaceship verifyTurn: (spaceshipOnBoard size) ]
]

{ #category : #information }
Board >> spaceships [
	^ spaceshipOnBoard.
]

{ #category : #finalization }
Board >> winner [

	self winnerExists
		ifTrue: [ 
			^ (self spaceships detect: [ :spaceship | 
				   self winningCondition: spaceship ]) color ]
		ifFalse: [ ^ 'Nobody' ]
]

{ #category : #finalization }
Board >> winnerExists [

	^ self spaceships anySatisfy: [ :spaceship | 
		  self winningCondition: spaceship ]
]

{ #category : #finalization }
Board >> winningCondition: spaceship [

	^ (spaceship position > self sizeIs or:
		  spaceship position == self sizeIs)
]
