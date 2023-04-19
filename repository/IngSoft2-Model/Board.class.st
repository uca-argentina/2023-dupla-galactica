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
Board class >> with: aSpaceship [ 
	^(self new) initializeWith: aSpaceship.
]

{ #category : #initialize }
Board class >> withSizeOf: aSize [ 
	^(self new) initializeWithSizeOf: aSize.
]

{ #category : #'instance creation' }
Board class >> withSizeOf: aValue and: aCollectionOfSpaceships [ 
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

	self winner
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

	(spaceshipOnBoard detect: [ :spaceship | spaceship whichTurn = 1 ]) moveOn: movementValue.
	self winner ifFalse: [ self someoneMoves. ]
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
		spaceship hasPassedATurn.
		spaceship verifyTurn: (spaceshipOnBoard size) ]
]

{ #category : #'spaceships position' }
Board >> spaceshipsOnIt [
	^ spaceshipOnBoard.
]

{ #category : #'verifying winner' }
Board >> whoAchieveTheGoal [

	self winner
		ifTrue: [ 
			^ (self spaceshipsOnIt detect: [ :spaceship | 
				   self winningCondition: spaceship ]) spaceshipColor ]
		ifFalse: [ ^ 'Nobody' ]
]

{ #category : #'verifying winner' }
Board >> winner [

	^ self spaceshipsOnIt anySatisfy: [ :spaceship | 
		  self winningCondition: spaceship ]
]

{ #category : #'verifying winner' }
Board >> winningCondition: spaceship [

	^ (spaceship position > self sizeIs or:
		  spaceship position == self sizeIs)
]
