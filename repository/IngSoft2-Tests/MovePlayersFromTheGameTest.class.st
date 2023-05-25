Class {
	#name : #MovePlayersFromTheGameTest,
	#superclass : #TestCase,
	#instVars : [
		'aColorCollection'
	],
	#category : #'IngSoft2-Tests'
}

{ #category : #Games }
MovePlayersFromTheGameTest >> gameWithMoreParsecs: aLoadedDie [ 
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
	aBoard:= Board with: 10 effects: boxes measure: 200.
	aLoadedGame := DuplaGalacticaGame 
		               with: aColorCollection
		               and: aBoard
		               throwing: aLoadedDie 
							winningWhen: 2.
	^ aLoadedGame
]

{ #category : #Games }
MovePlayersFromTheGameTest >> gameWithOneLap: aLoadedDie [

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
		               throwing: aLoadedDie
		               winningWhen: 1.

	^ aGame
]

{ #category : #Games }
MovePlayersFromTheGameTest >> gameWithTwoLaps: aLoadedDie [
	

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
		               throwing: aLoadedDie
							winningWhen: 2.
	^ aLoadedGame
]

{ #category : #running }
MovePlayersFromTheGameTest >> setUp [

	super setUp.

	aColorCollection := OrderedCollection with: 'red' with: 'blue'
]

{ #category : #tests }
MovePlayersFromTheGameTest >> should: anErrorBlock raise: anExceptionClass withMessage: anErrorMessage [

	self
		should: anErrorBlock
		raise: anExceptionClass
		withExceptionDo: [ :error | 
		self assert: error messageText equals: anErrorMessage ]
]

{ #category : #tests }
MovePlayersFromTheGameTest >> testA009CreateABoardWithNegativeLengthThenRaiseAnError [

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
MovePlayersFromTheGameTest >> testM001AskPlayerForTheLapThenValid [

	| aPlayer |
	aPlayer := Player with: 'red'.
	self assert: aPlayer lap equals: 0
]

{ #category : #tests }
MovePlayersFromTheGameTest >> testM002MovePlayerOneEntireLapAndAskForItsPositionThenValid [

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
MovePlayersFromTheGameTest >> testM003MoveTwoPlayerOneEntireLapAndAskForTheirPositionThenValid [

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
MovePlayersFromTheGameTest >> testM004MovePlayerTwoEntireLapsAndAskForItsPositionThenValid [

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
MovePlayersFromTheGameTest >> testM005MovePlayersTwoEntireLapsInOnlyOneThrowThenValid [

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
MovePlayersFromTheGameTest >> testM006MovePlayerToTheLastBox [

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
MovePlayersFromTheGameTest >> testM007MovePlayerToTheGoalAndAskForWinner [

	| aLoadedDie aGame |
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 9
			               with: 11
			               with: 9
			               with: 6).
	aGame := self gameWithOneLap: aLoadedDie.
	aGame moveNextPlayer.
	aGame moveNextPlayer.
	self assert: aGame winner equals: 'blue'
]

{ #category : #tests }
MovePlayersFromTheGameTest >> testM008MovePlayerALotOfTimesAndVerifyThatItDoesNotMoveAfterItWins [

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
MovePlayersFromTheGameTest >> testM009MovePlayersTwoTimesAndAskForTheirPositions [

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
	self assert: aGame winner equals: 'blue'
]

{ #category : #tests }
MovePlayersFromTheGameTest >> testO001CreateBoardWithParsecs [

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
MovePlayersFromTheGameTest >> testO002CreateBoardWithAnotherAmountOfParsecThenValid [

	| aLoadedDie aGame |
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 7
			               with: 8
			               with: 9
			               with: 6).
	aGame := self gameWithMoreParsecs: aLoadedDie.
	self assert: aGame parsecs equals: 200
]

{ #category : #tests }
MovePlayersFromTheGameTest >> testO003CheckTheWormHoleEffectWhenHasPassedTheFirstLap [

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
