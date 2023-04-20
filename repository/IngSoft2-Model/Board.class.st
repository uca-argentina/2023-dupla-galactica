Class {
	#name : #Board,
	#superclass : #Object,
	#instVars : [
		'spaceshipOnBoard',
		'sizeOfBoard'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #initialize }
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

{ #category : #'verifying winner' }
Board >> createFinalMessage [

	| color position message |
	message := ''.
	self spaceshipsOnIt do: [ :spaceship | 
		color := spaceship spaceshipColor.
		position := spaceship position.
		message := message , color , ':' , position asString , ' ' ].
	^ message
]

{ #category : #'spaceships position' }
Board >> fartherPosition [

	| max |
	max := 0.
	self spaceshipsOnIt do: [ :spaceship | 
		max < spaceship position ifTrue: [ max := spaceship position ] ].
	^ max
]

{ #category : #'verifying winner' }
Board >> finalPositionOfSpaceShips [

	self winnerExists
		ifTrue: [ ^ self createFinalMessage ]
		ifFalse: [ ^ 'the game has not finished yet' ]
]

{ #category : #initialization }
Board >> initializeWith: aSpaceship [ 
	spaceshipOnBoard:=aSpaceship.
]

{ #category : #'instance creation' }
Board >> initializeWithSizeOf: aSize [ 
	sizeOfBoard:=aSize.
]

{ #category : #creation }
Board >> isCreatedSuccessfully [
	^true.
]

{ #category : #'spaceships position' }
Board >> moveSpaceship: movementValue [

	(spaceshipOnBoard detect: [ :spaceship | spaceship whichTurn == 1 ]) moveOn: movementValue.
	self winnerExists ifTrue: [ self createFinalMessage ] ifFalse: [ self someoneMoves. ]
]

{ #category : #spaceships }
Board >> nextPlayer [
	^ (spaceshipOnBoard detect: [:spaceship | (spaceship turn == 1)]) spaceshipColor .
	 
]

{ #category : #'spaceships position' }
Board >> positionOfTheFartherSpaceship [
	^ self fartherPosition.
]

{ #category : #size }
Board >> sizeIs [
	^sizeOfBoard.
]

{ #category : #'spaceships turn' }
Board >> someoneMoves [

	spaceshipOnBoard do: [ :spaceship | 
		spaceship someonePlays.
		spaceship verifyTurn: (spaceshipOnBoard size) ]
]

{ #category : #'spaceships position' }
Board >> spaceshipsOnIt [
	^ spaceshipOnBoard.
]

{ #category : #'verifying winner' }
Board >> winner [

	self winnerExists
		ifTrue: [ 
			^ (self spaceshipsOnIt detect: [ :spaceship | 
				   self winningCondition: spaceship ]) spaceshipColor ]
		ifFalse: [ ^ 'Nobody' ]
]

{ #category : #'verifying winner' }
Board >> winnerExists [

	^ self spaceshipsOnIt anySatisfy: [ :spaceship | 
		  self winningCondition: spaceship ]
]

{ #category : #'verifying winner' }
Board >> winningCondition: spaceship [

	^ (spaceship position > self sizeIs or:
		  spaceship position == self sizeIs)
]
