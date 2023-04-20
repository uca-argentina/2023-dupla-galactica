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
	^(self new) initializeWith:aValue and: aCollectionOfSpaceships.
]

{ #category : #spaceships }
Board >> fartherPosition [

	| maxValue |
	maxValue := 0.
	self spaceships do: [ :spaceship | 
		maxValue := (maxValue max: spaceship position) ].
	^ maxValue
]

{ #category : #endGame }
Board >> finalMessage [

	| color position message |
	message := ''.
	self spaceships do: [ :spaceship | 
		color := spaceship color.
		position := spaceship position.
		message := message , color , ':' , position asString , ' ' ].
	^ message
]

{ #category : #endGame }
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
Board >> initializeWith: aValue and: aCollectionSpaceships [ 
	spaceshipOnBoard:=aCollectionSpaceships.
	sizeOfBoard:=aValue.
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
	self winnerExists ifTrue: [ self finalMessage ] ifFalse: [ self someoneMoves. ]
]

{ #category : #spaceships }
Board >> nextPlayer [
	^ (spaceshipOnBoard detect: [:spaceship | (spaceship turn == 1)]) color.
	 
]

{ #category : #information }
Board >> sizeIs [
	^sizeOfBoard.
]

{ #category : #spaceships }
Board >> someoneMoves [

	spaceshipOnBoard do: [ :spaceship | 
		spaceship someonePlays.
		spaceship verifyTurn: (spaceshipOnBoard size) ]
]

{ #category : #information }
Board >> spaceships [
	^ spaceshipOnBoard.
]

{ #category : #endGame }
Board >> winner [

	self winnerExists
		ifTrue: [ 
			^ (self spaceships detect: [ :spaceship | 
				   self winningCondition: spaceship ]) color ]
		ifFalse: [ ^ 'Nobody' ]
]

{ #category : #endGame }
Board >> winnerExists [

	^ self spaceships anySatisfy: [ :spaceship | 
		  self winningCondition: spaceship ]
]

{ #category : #endGame }
Board >> winningCondition: spaceship [

	^ (spaceship position > self sizeIs or:
		  spaceship position == self sizeIs)
]
