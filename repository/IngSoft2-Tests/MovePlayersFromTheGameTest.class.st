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

	| aBoard aLoadedGame aCardsCollection aBoxesCollection |
	aCardsCollection := (Creator use: (OrderedCollection with:
			                      (ObjectProbability
				                       using: OverloadCard initializeNew
				                       withChanceOf: 100))) create: 4.
	aBoxesCollection := (Creator use: (OrderedCollection with:
			                      (ObjectProbability
				                       using: NoEffectBox initializeNew
				                       withChanceOf: 100))) create: 10.
	aBoard := Board with: aBoxesCollection measure: (Parsec worth: 200).
	aLoadedGame := DuplaGalacticaGameProxy
		               with: aColorCollection
		               and: aBoard
		               usingToThrow:
		               (DiceShaker with:
			                (OrderedCollection with: aLoadedDie))
		               winningWhenReach: 2
		               using: aCardsCollection.
	^ aLoadedGame
]

{ #category : #Games }
MovePlayersFromTheGameTest >> gameWithOneLap: aLoadedDie [

	| aGame aBoard aCardsCollection aBoxesCollection |
	aCardsCollection := (Creator use: (OrderedCollection with:
			                      (ObjectProbability
				                       using: OverloadCard initializeNew
				                       withChanceOf: 100))) create: 4.
	aBoxesCollection := (Creator use: (OrderedCollection with:
			                      (ObjectProbability
				                       using: NoEffectBox initializeNew
				                       withChanceOf: 100))) create: 10.
	aBoard := Board with: aBoxesCollection measure: (Parsec worth: 100).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         usingToThrow:
		         (DiceShaker with: (OrderedCollection with: aLoadedDie))
		         winningWhenReach: 1
		         using: aCardsCollection.
	^ aGame
]

{ #category : #Games }
MovePlayersFromTheGameTest >> gameWithTwoLaps: aLoadedDie [

	| aBoard aLoadedGame aCardsCollection aBoxesCollection |
	aCardsCollection := (Creator use: (OrderedCollection with:
			                      (ObjectProbability
				                       using: OverloadCard initializeNew
				                       withChanceOf: 100))) create: 4.
	aBoxesCollection := (Creator use: (OrderedCollection with:
			                      (ObjectProbability
				                       using: NoEffectBox initializeNew
				                       withChanceOf: 100))) create: 10.
	aBoard := Board with: aBoxesCollection measure: (Parsec worth: 100).
	aLoadedGame := DuplaGalacticaGameProxy
		               with: aColorCollection
		               and: aBoard
		               usingToThrow:
		               (DiceShaker with:
			                (OrderedCollection with: aLoadedDie))
		               winningWhenReach: 2
		               using: aCardsCollection.
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
MovePlayersFromTheGameTest >> testM001CreateAPlayerThenCheckItsLapNumber [

	| aPlayer |
	aPlayer := Player with: 'red'.
	self assert: aPlayer lap equals: 0
]

{ #category : #tests }
MovePlayersFromTheGameTest >> testM002CreateAGameWithTwoGoalLapsThenMoveAPlayerOneEntireLapAndCheckPlayersLaps [

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
MovePlayersFromTheGameTest >> testM003CreateAGameWithTwoGoalLapsThenMovePlayersOneEntireLapAndCheckPlayersLaps [

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
MovePlayersFromTheGameTest >> testM005CreateAGameWithTwoGoalLapsThenMoveAPlayerTwoEntireLapsInOneThrowAndCheckItWins [

	| aLoadedDie aGame |
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 23
			               with: 9
			               with: 7
			               with: 9).
	aGame := self gameWithTwoLaps: aLoadedDie.
	aGame movePlayer.
	self assert: aGame playersLaps equals: (OrderedCollection with: 2 with: 0).
	self assert: aGame winner equals: 'red'
]

{ #category : #tests }
MovePlayersFromTheGameTest >> testM007CreateAGameWithOneGoalLapThenMoveOnePlayerToTheGoalAndCheckItWins [

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
MovePlayersFromTheGameTest >> testM008CreateAGameWithOneGoalLapThenMoveOnePlayerToTheGoalAndCheckTheGameHasFinishedSoPlayersDoNotMoveAnyMoreLookingPlayersPositions [

	| aLoadedDie aGame |
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 15
			               with: 3
			               with: 9
			               with: 6).
	aGame := self gameWithOneLap: aLoadedDie.
	aGame movePlayer.
	aGame movePlayer.
	aGame movePlayer.
	aGame movePlayer.
	self assert: aGame playersBox equals: (OrderedCollection with: 6 with: 1)
]

{ #category : #tests }
MovePlayersFromTheGameTest >> testO001CreateAGameWithOneGoalLapAndAParsecsMeasureThenCheckTheParsecsNominalValue [

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
MovePlayersFromTheGameTest >> testO002CreateAGameWithAMoreParsecsMeasureThenCheckTheParsecsNominalValue [

	| aLoadedDie aGame |
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 7
			               with: 8
			               with: 9
			               with: 6).
	aGame := self gameWithMoreParsecs: aLoadedDie.
	self assert: aGame parsecs nominalValue equals: 200
]
