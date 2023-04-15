Class {
	#name : #MoveSpaceshipFromTheBoardTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
MoveSpaceshipFromTheBoardTest >> testA001CreateBoard [
	| aBoard |
	aBoard := Board new.
	self assert: (aBoard isCreatedSuccessfully).
]

{ #category : #tests }
MoveSpaceshipFromTheBoardTest >> testA002CreateSpaceship [
	| aSpaceship |
	aSpaceship := Spaceship new.
	self assert: (aSpaceship isCreatedSuccessfully).
]

{ #category : #tests }
MoveSpaceshipFromTheBoardTest >> testA003AskSpaceshipForItsOwnPosition [

	| aSpaceship |
	aSpaceship := Spaceship putItOnTheBeginning.
	self assert: aSpaceship whereItIs identicalTo: 0
]

{ #category : #tests }
MoveSpaceshipFromTheBoardTest >> testA004AskSpaceshipForItsOwnPositionAfterMovingIt [

	| aSpaceship |
	aSpaceship := Spaceship putItOnTheBeginning.
	aSpaceship moveOn: 8.
	self assert: aSpaceship whereItIs identicalTo: 8
]

{ #category : #tests }
MoveSpaceshipFromTheBoardTest >> testA005CreateOneSpaceshipPutItOnTheBoardAndThenAskTheBoardForThePositionOfTheSpacecshipThatHasMovedMore [

	| aSpaceship aBoard |
	aSpaceship := Spaceship putItOnTheBeginning.
	aSpaceship moveOn: 8.
	aBoard := Board with: (OrderedCollection with: aSpaceship).
	self assert: aBoard positionOfTheSpaceshipFarther identicalTo: 8
]

{ #category : #tests }
MoveSpaceshipFromTheBoardTest >> testA006CreateTwoSpaceshipsPutThemOnTheBoardAndThenAskTheBoardForThePositionOfTheSpacecshipThatHasMovedMore [

	| aSpaceshipRed aSpaceshipBlue aSpaceshipCollection aBoard |
	aSpaceshipRed := Spaceship putItOnTheBeginning.
	aSpaceshipRed moveOn: 8.
	aSpaceshipBlue := Spaceship putItOnTheBeginning.
	aSpaceshipBlue moveOn: 9.
	
	aSpaceshipCollection := OrderedCollection with: aSpaceshipRed with: aSpaceshipBlue.
	aBoard := Board with: aSpaceshipCollection.
	self assert: aBoard positionOfTheSpaceshipFarther identicalTo: 9
]

{ #category : #tests }
MoveSpaceshipFromTheBoardTest >> testA007CreateABoardWithASpecificSize [

	| aBoard |
	aBoard := Board withSizeOf: 9.
	self assert: aBoard sizeOfItIs identicalTo: 9.
]

{ #category : #tests }
MoveSpaceshipFromTheBoardTest >> testA008CreateABoardWithASpecificSizeAndTwoSpaceships [

| aSpaceshipRed aSpaceshipBlue aSpaceshipCollection aBoard |
	aSpaceshipRed := Spaceship putItOnTheBeginning.
	aSpaceshipRed moveOn: 8.
	aSpaceshipBlue := Spaceship putItOnTheBeginning.
	aSpaceshipBlue moveOn: 9.
	
	aSpaceshipCollection := OrderedCollection with: aSpaceshipRed with: aSpaceshipBlue.
	aBoard := Board withSizeOf: 10 and: aSpaceshipCollection.
	self assert: aBoard positionOfTheSpaceshipFarther identicalTo: 9
]
