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

{ #category : #tests }
MoveSpaceshipFromTheBoardTest >> testM002MoveSpaceshipOneEntireLapAndThenAskForItsPosition [

	| aColorCollection aLoadedDie aGame |
	aColorCollection := OrderedCollection with: 'red'.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 8
			               with: 5
			               with: 7
			               with: 9).
	aGame := Game
		         with: aColorCollection
		         and: 7
		         throwing: (OrderedCollection with: aLoadedDie)
					winningWhen: 1.
	aGame moveNextPlayer.
	self assert: aGame laps equals: (OrderedCollection with: 1) 
]

{ #category : #tests }
MoveSpaceshipFromTheBoardTest >> testM003MoveTwoSpaceshipOneEntireLapAndThenAskForTheirPosition [

	| aColorCollection aLoadedDie aGame |
	aColorCollection := OrderedCollection with: 'red' with:'blue'.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 8
			               with: 9
			               with: 7
			               with: 9).
	aGame := Game
		         with: aColorCollection
		         and: 7
		         throwing: (OrderedCollection with: aLoadedDie)
					winningWhen: 2.
	aGame moveNextPlayer.
	aGame moveNextPlayer.
	self assert: aGame laps equals: (OrderedCollection with: 1 with: 1) 
]

{ #category : #tests }
MoveSpaceshipFromTheBoardTest >> testM004MoveSpaceshipTwoEntireLapsAndThenAskForItsPosition [

	| aColorCollection aLoadedDie aGame |
	aColorCollection := OrderedCollection with: 'red'.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 10
			               with: 21
			               with: 7
			               with: 9).
	aGame := Game
		         with: aColorCollection
		         and: 10
		         throwing: (OrderedCollection with: aLoadedDie)
					winningWhen: 4.
	aGame moveNextPlayer.
	aGame moveNextPlayer.
	self assert: aGame laps equals: (OrderedCollection with: 3)
]

{ #category : #tests }
MoveSpaceshipFromTheBoardTest >> testM005MoveSpaceshipTwoEntireLapsInOnlyOneThrow [

	| aColorCollection aLoadedDie aGame |
	aColorCollection := OrderedCollection with: 'red'.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 15
			               with: 9
			               with: 7
			               with: 9).
	aGame := Game
		         with: aColorCollection
		         and: 7
		         throwing: (OrderedCollection with: aLoadedDie)
					winningWhen: 1.
	aGame moveNextPlayer.
	self assert: aGame laps equals: (OrderedCollection with: 2)
]

{ #category : #tests }
MoveSpaceshipFromTheBoardTest >> testM006MoveSpaceshipToTheLastBox [

	| aColorCollection aLoadedDie aGame |
	aColorCollection := OrderedCollection with: 'red'.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 10
			               with: 1
			               with: 7
			               with: 9).
	aGame := Game
		         with: aColorCollection
		         and: 10
		         throwing: (OrderedCollection with: aLoadedDie)
					winningWhen: 1.
	aGame moveNextPlayer.
	aGame moveNextPlayer.
	self assert: aGame laps equals: (OrderedCollection with: 1)
]

{ #category : #tests }
MoveSpaceshipFromTheBoardTest >> testM007MoveSpaceshipToTheGoalAndAskForWinner [

	| aColorCollection aLoadedDie aGame |
	aColorCollection := OrderedCollection with: 'red'.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 10
			               with: 11
			               with: 9
			               with: 6).
	aGame := Game
		         with: aColorCollection
		         and: 10
		         throwing: (OrderedCollection with: aLoadedDie)
					winningWhen: 2.
	aGame moveNextPlayer.
	aGame moveNextPlayer.
	self assert: aGame winner asSymbol equals: 'red' asSymbol 
]

{ #category : #tests }
MoveSpaceshipFromTheBoardTest >> testM008MoveSpaceshipALotOfTimesAndVerifyThatItDoesNotMove [

	| aColorCollection aLoadedDie aGame |
	aColorCollection := OrderedCollection with: 'red'.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 10
			               with: 1
			               with: 9
			               with: 6).
	aGame := Game
		         with: aColorCollection
		         and: 10
		         throwing: (OrderedCollection with: aLoadedDie)
					winningWhen: 1.
	aGame moveNextPlayer.
	aGame moveNextPlayer.
	aGame moveNextPlayer.
	aGame moveNextPlayer.
	self assert: aGame laps  equals: (OrderedCollection with:1)
]

{ #category : #tests }
MoveSpaceshipFromTheBoardTest >> testM009MoveSpaceshipTwoTimesAndAskForPositions [

	| aColorCollection aLoadedDie aGame |
	aColorCollection := OrderedCollection with: 'red' with:'blue'.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 11
			               with: 9
			               with: 6).
	aGame := Game
		         with: aColorCollection
		         and: 10
		         throwing: (OrderedCollection with: aLoadedDie)
					winningWhen: 1.
	aGame moveNextPlayer.
	aGame moveNextPlayer.
	aGame moveNextPlayer.
	aGame moveNextPlayer.
	self assert: aGame positions  equals: (OrderedCollection with:1 with:1).
	self assert: aGame winner asSymbol equals: 'blue' asSymbol 
]

{ #category : #tests }
MoveSpaceshipFromTheBoardTest >> testO001CreateBoardWithParsecs [

	| aColorCollection aLoadedDie aGame |
	aColorCollection := OrderedCollection with: 'red' with: 'blue'.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 7
			               with: 8
			               with: 9
			               with: 6).
	aGame := Game
		         with: aColorCollection
		         and: 7
		         throwing: (OrderedCollection with: aLoadedDie)
		         winningWhen: 1.
	self
		assert: aGame parsecsAmount equals: 100.
]

{ #category : #tests }
MoveSpaceshipFromTheBoardTest >> testO002CreateBoardWithBoxes [

	| aColorCollection aLoadedDie aGame |
	aColorCollection := OrderedCollection with: 'red' with: 'blue'.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 2
			               with: 4
			               with: 5
			               with: 6).
	aGame := Game
		         with: aColorCollection
		         and: 10
		         throwing: (OrderedCollection with: aLoadedDie)
		         winningWhen: 3.
	aGame moveNextPlayer.
	aGame moveNextPlayer.
	self
		assert: aGame positions equals: (OrderedCollection  with: 6 with: 4).
]

{ #category : #tests }
MoveSpaceshipFromTheBoardTest >> testO003CheckTheWormHoleEffectWhenHasPassedTheFirstLap [

	| aColorCollection aLoadedDie aGame |
	aColorCollection := OrderedCollection with: 'red' with: 'blue'.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 8
			               with: 9
			               with: 5
			               with: 6).
	aGame := Game
		         with: aColorCollection
		         and: 10
		         throwing: (OrderedCollection with: aLoadedDie)
		         winningWhen: 3.
	aGame moveNextPlayer.
	aGame moveNextPlayer.
	aGame moveNextPlayer.
	self
		assert: aGame positions equals: (OrderedCollection  with: 9 with: 9).
]
