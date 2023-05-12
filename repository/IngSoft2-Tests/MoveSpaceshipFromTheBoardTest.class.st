Class {
	#name : #MoveSpaceshipFromTheBoardTest,
	#superclass : #TestCase,
	#instVars : [
		'aBoxesCollection',
		'aColorCollection'
	],
	#category : #'IngSoft2-Tests'
}

{ #category : #Games }
MoveSpaceshipFromTheBoardTest >> gameWithOneLap: aLoadedDie [

	| aGame |
	aGame := Game
		         with: aColorCollection
		         and: 10
		         throwing: (OrderedCollection with: aLoadedDie)
		         winningWhen: 1
		         effects: aBoxesCollection.

	^ aGame
]

{ #category : #Games }
MoveSpaceshipFromTheBoardTest >> gameWithTwoLaps: aLoadedDie [

	| aGame |
	aGame := Game
		         with: aColorCollection
		         and: 10
		         throwing: (OrderedCollection with: aLoadedDie)
		         winningWhen: 2
		         effects: aBoxesCollection.

	^ aGame
]

{ #category : #running }
MoveSpaceshipFromTheBoardTest >> setUp [

	super setUp.

	aColorCollection := OrderedCollection with: 'red' with: 'blue'.
	aBoxesCollection := OrderedCollection
		                    with: NoEffectBox new
		                    with: NoEffectBox new
		                    with: WormHoleBox new
		                    with: NoEffectBox new
		                    with: NoEffectBox new
		                    with: NoEffectBox new.
	aBoxesCollection addLast: NoEffectBox new.
	aBoxesCollection addLast: NoEffectBox new.
	aBoxesCollection addLast: NoEffectBox new.
	aBoxesCollection addLast: NoEffectBox new
]

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
	aBoard := Board with: 9 and: aSpaceshipCollection effects: aBoxesCollection.
	self assert: aBoard length identicalTo: 9
]

{ #category : #tests }
MoveSpaceshipFromTheBoardTest >> testA009CreateABoardWithNegativeValuesThenInvalid [

	self should: [Board with: -1 and: OrderedCollection new effects: aBoxesCollection.] raise: Error withMessage: 'Cannot create a board with that value'.
]

{ #category : #tests }
MoveSpaceshipFromTheBoardTest >> testM001AskSpaceshipForTheLap [

	| aSpaceship |
	aSpaceship := Spaceship with: 'red'.
	self assert: aSpaceship lap equals: 0
]

{ #category : #tests }
MoveSpaceshipFromTheBoardTest >> testM002MoveSpaceshipOneEntireLapAndThenAskForItsPosition [

	| aLoadedDie aGame |
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 11
			               with: 5
			               with: 7
			               with: 9).
	aGame := self gameWithTwoLaps: aLoadedDie.
	aGame moveNextPlayer.
	self assert: aGame laps equals: (OrderedCollection with: 1 with: 0)
]

{ #category : #tests }
MoveSpaceshipFromTheBoardTest >> testM003MoveTwoSpaceshipOneEntireLapAndThenAskForTheirPosition [

	| aLoadedDie aGame |
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 11
			               with: 15
			               with: 7
			               with: 9).
	aGame := self gameWithTwoLaps: aLoadedDie.
	aGame moveNextPlayer.
	aGame moveNextPlayer.
	self assert: aGame laps equals: (OrderedCollection with: 1 with: 1)
]

{ #category : #tests }
MoveSpaceshipFromTheBoardTest >> testM004MoveSpaceshipTwoEntireLapsAndThenAskForItsPosition [

	| aLoadedDie aGame |
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 11
			               with: 6
			               with: 10
			               with: 9).
	aGame := self gameWithTwoLaps: aLoadedDie.
	aGame moveNextPlayer.
	aGame moveNextPlayer.
	aGame moveNextPlayer.
	self assert: aGame laps equals: (OrderedCollection with: 2 with: 0)
]

{ #category : #tests }
MoveSpaceshipFromTheBoardTest >> testM005MoveSpaceshipTwoEntireLapsInOnlyOneThrow [

	| aLoadedDie aGame |
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 22
			               with: 9
			               with: 7
			               with: 9).
	aGame := self gameWithTwoLaps: aLoadedDie.
	aGame moveNextPlayer.
	self assert: aGame laps equals: (OrderedCollection with: 2 with: 0)
]

{ #category : #tests }
MoveSpaceshipFromTheBoardTest >> testM006MoveSpaceshipToTheLastBox [

	| aLoadedDie aGame |
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 10
			               with: 5
			               with: 1
			               with: 9).
	aGame := self gameWithOneLap: aLoadedDie.
	aGame moveNextPlayer.
	aGame moveNextPlayer.
	aGame moveNextPlayer.
	self assert: aGame laps equals: (OrderedCollection with: 1 with: 0)
]

{ #category : #tests }
MoveSpaceshipFromTheBoardTest >> testM007MoveSpaceshipToTheGoalAndAskForWinner [

	| aLoadedDie aGame |
	
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 10
			               with: 11
			               with: 9
			               with: 6).
	aGame := self gameWithOneLap: aLoadedDie.
	aGame moveNextPlayer.
	aGame moveNextPlayer.
	self assert: aGame winner asSymbol equals: 'blue' asSymbol 
]

{ #category : #tests }
MoveSpaceshipFromTheBoardTest >> testM008MoveSpaceshipALotOfTimesAndVerifyThatItDoesNotMove [

	| aLoadedDie aGame |
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 10
			               with: 1
			               with: 9
			               with: 6).
	aGame:= self gameWithOneLap: aLoadedDie.
	aGame moveNextPlayer.
	aGame moveNextPlayer.
	aGame moveNextPlayer.
	aGame moveNextPlayer.
	self assert: aGame laps  equals: (OrderedCollection with:1 with:0)
]

{ #category : #tests }
MoveSpaceshipFromTheBoardTest >> testM009MoveSpaceshipTwoTimesAndAskForPositions [

	| aLoadedDie aGame |
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 11
			               with: 9
			               with: 6).
	aGame := self gameWithOneLap: aLoadedDie.
	aGame moveNextPlayer.
	aGame moveNextPlayer.
	aGame moveNextPlayer.
	aGame moveNextPlayer.
	self assert: aGame positions  equals: (OrderedCollection with:1 with:1).
	self assert: aGame winner asSymbol equals: 'blue' asSymbol 
]

{ #category : #tests }
MoveSpaceshipFromTheBoardTest >> testO001CreateBoardWithParsecs [

	| aLoadedDie aGame |
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 7
			               with: 8
			               with: 9
			               with: 6).
	aGame := self gameWithOneLap: aLoadedDie.
	self assert: aGame parsecsAmount equals: 100.
]

{ #category : #tests }
MoveSpaceshipFromTheBoardTest >> testO003CheckTheWormHoleEffectWhenHasPassedTheFirstLap [

	| aLoadedDie aGame |
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 8
			               with: 9
			               with: 5
			               with: 6).
	aGame := self gameWithTwoLaps: aLoadedDie.
	aGame moveNextPlayer.
	aGame moveNextPlayer.
	aGame moveNextPlayer.
	self
		assert: aGame positions
		equals: (OrderedCollection with: 9 with: 9)
]
