Class {
	#name : #MoveSpaceshipFromTheBoardTest,
	#superclass : #TestCase,
	#instVars : [
		'aColorCollection'
	],
	#category : #'IngSoft2-Tests'
}

{ #category : #Games }
MoveSpaceshipFromTheBoardTest >> gameWithOneLap: aLoadedDie [

	| aGame boxes aBoard |
	boxes := OrderedCollection
		         with: NoEffectBox new
		         with: SpeedUpBox new
		         with: WormHoleBox new
		         with: NoEffectBox new
		         with: (MoonWalkBox with: 10)
		         with: (HyperJumpBox with: (OrderedCollection
					           with: 20
					           with: 40
					           with: 30
					           with: -10
					           with: 50)).
	boxes addLast: NoEffectBox new.
	boxes addLast: AtomicBombBox new.
	boxes addLast: NoEffectBox new.
	boxes addLast: NoEffectBox new.
	aBoard := Board with: 10 effects: boxes measure: 100.
	aGame := DuplaGalacticaGame
		               with: aColorCollection
		               and: aBoard
		               throwing: (OrderedCollection with: aLoadedDie)
		               winningWhen: 1.

	^ aGame
]

{ #category : #Games }
MoveSpaceshipFromTheBoardTest >> gameWithTwoLaps: aLoadedDie [
	

	| boxes aBoard aLoadedGame|
	boxes:= OrderedCollection
		         with: NoEffectBox new
		         with: SpeedUpBox new
		         with: WormHoleBox new
		         with: NoEffectBox new
		         with: (MoonWalkBox with: 10)
		         with: (HyperJumpBox with: (OrderedCollection
					           with: 20
					           with: 40
					           with: 30
					           with: -10
					           with: 50)).
	boxes addLast: NoEffectBox new.
	boxes addLast: AtomicBombBox new.
	boxes addLast: NoEffectBox new.
	boxes addLast: NoEffectBox new.
	aBoard:= Board with: 10 effects: boxes measure: 100.
	aLoadedGame := DuplaGalacticaGame 
		               with: aColorCollection
		               and: aBoard
		               throwing: (OrderedCollection with: aLoadedDie)
							winningWhen: 2.
	^ aLoadedGame
]

{ #category : #running }
MoveSpaceshipFromTheBoardTest >> setUp [

	super setUp.

	aColorCollection := OrderedCollection with: 'red' with: 'blue'
]

{ #category : #tests }
MoveSpaceshipFromTheBoardTest >> should: anErrorBlock raise: anExceptionClass withMessage: anErrorMessage [

	self
		should: anErrorBlock
		raise: anExceptionClass
		withExceptionDo: [ :error | 
		self assert: error messageText equals: anErrorMessage ]
]

{ #category : #tests }
MoveSpaceshipFromTheBoardTest >> testA009CreateABoardWithNegativeValuesThenInvalid [

	self
		should: [ 
			Board
				with: -1
				effects: OrderedCollection new
				measure: 100 ]
		raise: Error
		withMessage: 'Cannot create a board with that value'
]

{ #category : #tests }
MoveSpaceshipFromTheBoardTest >> testM001AskPlayerForTheLap [

	| aPlayer |
	aPlayer := Player with: 'red'.
	self assert: aPlayer lap equals: 0
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
			               with: 16
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
			               with: 10
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
			               with: 23
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
			               with: 9
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
	aGame := self gameWithOneLap: aLoadedDie.
	aGame moveNextPlayer.
	aGame moveNextPlayer.
	aGame moveNextPlayer.
	aGame moveNextPlayer.
	self assert: aGame laps equals: (OrderedCollection with: 1 with: 0)
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
	self
		assert: aGame positions
		equals: (OrderedCollection with: 6 with: 6).
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
	self assert: aGame parsecs equals: 100
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
		equals: (OrderedCollection with: 4 with: 10)
]
