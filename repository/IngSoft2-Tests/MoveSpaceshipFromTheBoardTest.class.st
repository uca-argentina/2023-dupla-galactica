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
	aSpaceship := Spaceship new.
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
	aBoard := Board with: aSpaceship.
	self assert: aBoard positionOfTheSpaceshipFarther identicalTo: 8
]
