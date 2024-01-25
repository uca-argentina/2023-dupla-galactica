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

	| boxes aBoard aLoadedGame aShaker |
	boxes := (BoxCreator use: (OrderedCollection with:
			           (BoxProbability using: NoEffectBox new withChance: 100))) 
		         create: 10.
	aBoard := Board with: boxes measure: (Parsec worth: 200).

	aShaker := DiceShaker withDie: aLoadedDie.
	aLoadedGame := DuplaGalacticaGameProxy
		               with: aColorCollection
		               and: aBoard
		               usingToThrow: aShaker
		               winningWhen: 2
		               using: (CardDealer with: (OrderedCollection with: (CardProbability using: OverloadCard withChance: 100))).
	^ aLoadedGame
]

{ #category : #Games }
MovePlayersFromTheGameTest >> gameWithOneLap: aLoadedDie [

	| aGame boxes aBoard aShaker |
	boxes := (BoxCreator use: (OrderedCollection with:
			           (BoxProbability using: NoEffectBox new withChance: 100))) 
		         create: 10.
	aBoard := Board with: boxes measure: (Parsec worth: 100).

	aShaker := DiceShaker withDie: aLoadedDie.
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         usingToThrow: aShaker
		         winningWhen: 1
		         using: (CardDealer with: (OrderedCollection with: (CardProbability using: OverloadCard withChance: 100))).

	^ aGame
]

{ #category : #Games }
MovePlayersFromTheGameTest >> gameWithTwoLaps: aLoadedDie [

	| boxes aBoard aLoadedGame aShaker |
	boxes := (BoxCreator use: (OrderedCollection with:
			           (BoxProbability using: NoEffectBox new withChance: 100))) 
		         create: 10.
	aBoard := Board with: boxes measure: (Parsec worth: 100).

	aShaker := DiceShaker withDie: aLoadedDie.
	aLoadedGame := DuplaGalacticaGameProxy
		               with: aColorCollection
		               and: aBoard
		               usingToThrow: aShaker
		               winningWhen: 2
		               using: (CardDealer with: (OrderedCollection with: (CardProbability using: OverloadCard withChance: 100))).
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
	aGame movePlayer.
	self assert: aGame playersLaps equals: (OrderedCollection with: 1 with: 0)
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
	aGame movePlayer.
	aGame movePlayer.
	self assert: aGame playersLaps equals: (OrderedCollection with: 1 with: 1)
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
	aGame movePlayer.
	aGame movePlayer.
	aGame movePlayer.
	self assert: aGame playersLaps equals: (OrderedCollection with: 2 with: 0)
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
	aGame movePlayer.
	self assert: aGame playersLaps equals: (OrderedCollection with: 2 with: 0)
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
	aGame movePlayer.
	aGame movePlayer.
	aGame movePlayer.
	self assert: aGame playersLaps equals: (OrderedCollection with: 1 with: 0)
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
	aGame movePlayer.
	aGame movePlayer.
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
	aGame movePlayer.
	aGame movePlayer.
	aGame movePlayer.
	aGame movePlayer.
	self assert: aGame playersLaps equals: (OrderedCollection with: 1 with: 0)
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
	aGame movePlayer.
	aGame movePlayer.
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersBox
		equals: (OrderedCollection with: 2 with: 2).
	self assert: aGame winner equals: 'blue'
]

{ #category : #tests }
MovePlayersFromTheGameTest >> testO001CreateBoardWithParsec [

	| aLoadedDie aGame |
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 7
			               with: 8
			               with: 9
			               with: 6).
	aGame := self gameWithOneLap: aLoadedDie.
	self assert: aGame parsecs nominalValue equals: 100
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
	self assert: aGame parsecs nominalValue equals: 200
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
	aGame movePlayer.
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersBox
		equals: (OrderedCollection with: 4 with: 10)
]
