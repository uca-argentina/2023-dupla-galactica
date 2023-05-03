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

	| aSpaceship aLoadedDie|
	aSpaceship := Spaceship with: 'red' and: 1.
	aLoadedDie := LoadedDie with: (OrderedCollection with: 8).
	aSpaceship moveOn: (OrderedCollection with: aLoadedDie) .
	self assert: aSpaceship position identicalTo: 8
]

{ #category : #tests }
MoveSpaceshipFromTheBoardTest >> testA005CreateOneSpaceshipPutItOnTheBoardAndThenAskTheBoardForThePositionOfTheSpaceshipThatHasMovedMore [

	| aSpaceship aBoard aLoadedDie|
	aSpaceship := Spaceship with: 'red' and: 1.
	aLoadedDie := LoadedDie with: (OrderedCollection with: 8).
	aSpaceship moveOn: (OrderedCollection with: aLoadedDie) .
	aBoard := Board with: 10 and: (OrderedCollection with: aSpaceship) .
	self assert: aBoard fartherPosition identicalTo: 8
]

{ #category : #tests }
MoveSpaceshipFromTheBoardTest >> testA006CreateTwoSpaceshipsPutThemOnTheBoardAndThenAskTheBoardForThePositionOfTheSpaceshipThatHasMovedMore [

	| aSpaceshipRed aSpaceshipBlue aSpaceshipCollection aBoard aLoadedDie |
	aSpaceshipRed := Spaceship with: 'red' and: 1.
	aSpaceshipBlue :=Spaceship with: 'blue' and: 1.
	aLoadedDie := LoadedDie with: (OrderedCollection with: 8 with: 9).
	aSpaceshipRed moveOn: (OrderedCollection with: aLoadedDie) .
	aSpaceshipBlue moveOn: (OrderedCollection with: aLoadedDie).

	aSpaceshipCollection := OrderedCollection
		                        with: aSpaceshipRed
		                        with: aSpaceshipBlue.
	aBoard := Board with: 10 and: aSpaceshipCollection.
	self assert: aBoard fartherPosition identicalTo: 9
]

{ #category : #tests }
MoveSpaceshipFromTheBoardTest >> testA007CreateABoardWithASpecificSize [

	| aBoard aSpaceshipCollection |
	aSpaceshipCollection:= OrderedCollection new.
	aBoard := Board with: 9 and: aSpaceshipCollection.
	self assert: aBoard sizeIs identicalTo: 9
]

{ #category : #tests }
MoveSpaceshipFromTheBoardTest >> testA008CreateABoardWithASpecificSizeAndTwoSpaceships [

	| aSpaceshipRed aSpaceshipBlue aSpaceshipCollection aBoard aLoadedDie|
	aSpaceshipRed := Spaceship with: 'red' and: 1.
	aSpaceshipBlue :=Spaceship with: 'blue' and: 1.
	aLoadedDie := LoadedDie with: (OrderedCollection with: 8 with: 9).
	aSpaceshipRed moveOn: (OrderedCollection with: aLoadedDie) .
	aSpaceshipBlue moveOn: (OrderedCollection with: aLoadedDie).

	aSpaceshipCollection := OrderedCollection
		                        with: aSpaceshipRed
		                        with: aSpaceshipBlue.
	aBoard := Board with: 10 and: aSpaceshipCollection.
	self assert: aBoard fartherPosition identicalTo: 9
]
