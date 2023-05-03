Class {
	#name : #MoveSpaceshipFromTheBoardTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
MoveSpaceshipFromTheBoardTest >> testA003AskSpaceshipForItsOwnPosition [

	| aSpaceship |
	aSpaceship := Spaceship with: 'red' and: 1.
	self assert: aSpaceship position identicalTo: 0
]

{ #category : #tests }
MoveSpaceshipFromTheBoardTest >> testA004AskSpaceshipForItsOwnPositionAfterMovingIt [

	| aSpaceship |
	aSpaceship := Spaceship with: 'red' and: 1.
	aSpaceship moveOnValue: 8.
	self assert: aSpaceship position identicalTo: 8
]

{ #category : #tests }
MoveSpaceshipFromTheBoardTest >> testA005CreateOneSpaceshipPutItOnTheBoardAndThenAskTheBoardForThePositionOfTheSpaceshipThatHasMovedMore [

	| aSpaceship aBoard |
	aSpaceship := Spaceship with: 'red' and: 1.
	aSpaceship moveOnValue: 8.
	aBoard := Board with: (OrderedCollection with: aSpaceship).
	self assert: aBoard fartherPosition identicalTo: 8
]

{ #category : #tests }
MoveSpaceshipFromTheBoardTest >> testA006CreateTwoSpaceshipsPutThemOnTheBoardAndThenAskTheBoardForThePositionOfTheSpaceshipThatHasMovedMore [

	| aSpaceshipRed aSpaceshipBlue aSpaceshipCollection aBoard |
	aSpaceshipRed := Spaceship with: 'red' and: 1.
	aSpaceshipBlue :=Spaceship with: 'blue' and: 1.
	aSpaceshipRed moveOnValue: 8.
	aSpaceshipBlue moveOnValue: 9.

	aSpaceshipCollection := OrderedCollection
		                        with: aSpaceshipRed
		                        with: aSpaceshipBlue.
	aBoard := Board with: aSpaceshipCollection.
	self assert: aBoard fartherPosition identicalTo: 9
]

{ #category : #tests }
MoveSpaceshipFromTheBoardTest >> testA007CreateABoardWithASpecificSize [

	| aBoard |
	aBoard := Board size: 9.
	self assert: aBoard sizeIs identicalTo: 9
]

{ #category : #tests }
MoveSpaceshipFromTheBoardTest >> testA008CreateABoardWithASpecificSizeAndTwoSpaceships [

	| aSpaceshipRed aSpaceshipBlue aSpaceshipCollection aBoard |
	aSpaceshipRed := Spaceship with: 'red' and: 1.
	aSpaceshipBlue :=Spaceship with: 'blue' and: 1.
	aSpaceshipRed moveOnValue: 8.
	aSpaceshipBlue moveOnValue: 9.

	aSpaceshipCollection := OrderedCollection
		                        with: aSpaceshipRed
		                        with: aSpaceshipBlue.
	aBoard := Board with: 10 and: aSpaceshipCollection.
	self assert: aBoard fartherPosition identicalTo: 9
]
