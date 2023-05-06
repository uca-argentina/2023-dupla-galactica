Class {
	#name : #MoveSpaceshipFromTheBoardTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
MoveSpaceshipFromTheBoardTest >> should: anErrorBlock raise: anExceptionClass withMessage: anErrorMessage [ 
	self
		should: anErrorBlock
		raise: anExceptionClass 
		withExceptionDo: [ :error|
			self assert: error messageText equals: anErrorMessage ].
]

{ #category : #tests }
MoveSpaceshipFromTheBoardTest >> testA003AskSpaceshipForItsOwnPosition [

	| aSpaceship |
	aSpaceship := Spaceship with: 'red'.
	self assert: aSpaceship position identicalTo: 0
]

{ #category : #tests }
MoveSpaceshipFromTheBoardTest >> testA004AskSpaceshipForItsOwnPositionAfterMovingIt [

	| aSpaceship|
	aSpaceship := Spaceship with: 'red'.
	aSpaceship move: 8 .
	self assert: aSpaceship position identicalTo: 8
]

{ #category : #tests }
MoveSpaceshipFromTheBoardTest >> testA007CreateABoardWithASpecificSize [

	| aBoard aSpaceshipCollection |
	aSpaceshipCollection:= OrderedCollection new.
	aBoard := Board with: 9 and: aSpaceshipCollection.
	self assert: aBoard length identicalTo: 9
]

{ #category : #tests }
MoveSpaceshipFromTheBoardTest >> testA009CreateABoardWithNegativeValuesThenInvalid [

	self should: [Board with: -1 and: OrderedCollection new.] raise: Error withMessage: 'Cannot create a board with that value'.
]

{ #category : #tests }
MoveSpaceshipFromTheBoardTest >> testM001AskSpaceshipForTheLap [

	| aSpaceship |
	aSpaceship := Spaceship with: 'red'.
	self assert: aSpaceship lap equals: 0
]
