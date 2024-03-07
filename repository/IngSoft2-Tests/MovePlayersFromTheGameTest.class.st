Class {
	#name : #MovePlayersFromTheGameTest,
	#superclass : #TestCase,
	#instVars : [
		'aColorsCollection'
	],
	#category : #'IngSoft2-Tests'
}

{ #category : #Games }
MovePlayersFromTheGameTest >> gameWithMoreParsecs: aLoadedDie [

	| aBoard aDuplaGalacticaGame aCardsCollection aBoxesCollection |
	aCardsCollection := (ObjectCreator use: (OrderedCollection with:
			                      (ObjectProbability
				                       using: OverloadCard initializeNew
				                       withChanceOf: 100))) create: 4.
	aBoxesCollection := (ObjectCreator use: (OrderedCollection with:
			                      (ObjectProbability
				                       using: NoEffectBox initializeNew
				                       withChanceOf: 100))) create: 10.
	aBoard := Board
		          with: aBoxesCollection
		          measure: (ParsecMeasure worth: 200).
	aDuplaGalacticaGame := DuplaGalacticaGameProxy
		                       with: aColorsCollection
		                       and: aBoard
		                       usingToThrow:
		                       (DiceShaker with:
			                        (OrderedCollection with: aLoadedDie))
		                       winningWhenReach: 2
		                       using: aCardsCollection.
	^ aDuplaGalacticaGame
]

{ #category : #Games }
MovePlayersFromTheGameTest >> gameWithOneLap: aLoadedDie [

	| aDuplaGalacticaGame aBoard aCardsCollection aBoxesCollection |
	aCardsCollection := (ObjectCreator use: (OrderedCollection with:
			                      (ObjectProbability
				                       using: OverloadCard initializeNew
				                       withChanceOf: 100))) create: 4.
	aBoxesCollection := (ObjectCreator use: (OrderedCollection with:
			                      (ObjectProbability
				                       using: NoEffectBox initializeNew
				                       withChanceOf: 100))) create: 10.
	aBoard := Board
		          with: aBoxesCollection
		          measure: (ParsecMeasure worth: 100).
	aDuplaGalacticaGame := DuplaGalacticaGameProxy
		                       with: aColorsCollection
		                       and: aBoard
		                       usingToThrow:
		                       (DiceShaker with:
			                        (OrderedCollection with: aLoadedDie))
		                       winningWhenReach: 1
		                       using: aCardsCollection.
	^ aDuplaGalacticaGame
]

{ #category : #Games }
MovePlayersFromTheGameTest >> gameWithTwoLaps: aLoadedDie [

	| aBoard aDuplaGalacticaGame aCardsCollection aBoxesCollection |
	aCardsCollection := (ObjectCreator use: (OrderedCollection with:
			                      (ObjectProbability
				                       using: OverloadCard initializeNew
				                       withChanceOf: 100))) create: 4.
	aBoxesCollection := (ObjectCreator use: (OrderedCollection with:
			                      (ObjectProbability
				                       using: NoEffectBox initializeNew
				                       withChanceOf: 100))) create: 10.
	aBoard := Board
		          with: aBoxesCollection
		          measure: (ParsecMeasure worth: 100).
	aDuplaGalacticaGame := DuplaGalacticaGameProxy
		                       with: aColorsCollection
		                       and: aBoard
		                       usingToThrow:
		                       (DiceShaker with:
			                        (OrderedCollection with: aLoadedDie))
		                       winningWhenReach: 2
		                       using: aCardsCollection.
	^ aDuplaGalacticaGame
]

{ #category : #running }
MovePlayersFromTheGameTest >> setUp [

	super setUp.

	aColorsCollection := OrderedCollection with: 'red' with: 'blue'
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

	| aLoadedDie aDuplaGalacticaGame |
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 11
			               with: 5
			               with: 7
			               with: 9).
	aDuplaGalacticaGame := self gameWithTwoLaps: aLoadedDie.
	aDuplaGalacticaGame movePlayer.
	self assert: aDuplaGalacticaGame playersLaps equals: (OrderedCollection with: 1 with: 0)
]

{ #category : #tests }
MovePlayersFromTheGameTest >> testM003CreateAGameWithTwoGoalLapsThenMovePlayersOneEntireLapAndCheckPlayersLaps [

	| aLoadedDie aDuplaGalacticaGame |
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 11
			               with: 16
			               with: 7
			               with: 9).
	aDuplaGalacticaGame := self gameWithTwoLaps: aLoadedDie.
	aDuplaGalacticaGame movePlayer.
	aDuplaGalacticaGame movePlayer.
	self assert: aDuplaGalacticaGame playersLaps equals: (OrderedCollection with: 1 with: 1)
]

{ #category : #tests }
MovePlayersFromTheGameTest >> testM005CreateAGameWithTwoGoalLapsThenMoveAPlayerTwoEntireLapsInOneThrowAndCheckItWins [

	| aLoadedDie aDuplaGalacticaGame |
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 23
			               with: 9
			               with: 7
			               with: 9).
	aDuplaGalacticaGame := self gameWithTwoLaps: aLoadedDie.
	aDuplaGalacticaGame movePlayer.
	self assert: aDuplaGalacticaGame playersLaps equals: (OrderedCollection with: 2 with: 0).
	self assert: aDuplaGalacticaGame winner equals: 'red'
]

{ #category : #tests }
MovePlayersFromTheGameTest >> testM007CreateAGameWithOneGoalLapThenMoveOnePlayerToTheGoalAndCheckItWins [

	| aLoadedDie aDuplaGalacticaGame |
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 9
			               with: 11
			               with: 9
			               with: 6).
	aDuplaGalacticaGame := self gameWithOneLap: aLoadedDie.
	aDuplaGalacticaGame movePlayer.
	aDuplaGalacticaGame movePlayer.
	self assert: aDuplaGalacticaGame winner equals: 'blue'
]

{ #category : #tests }
MovePlayersFromTheGameTest >> testM008CreateAGameWithOneGoalLapThenMoveOnePlayerToTheGoalAndCheckTheGameHasFinishedSoPlayersDoNotMoveAnyMoreLookingPlayersPositions [

	| aLoadedDie aDuplaGalacticaGame |
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 15
			               with: 3
			               with: 9
			               with: 6).
	aDuplaGalacticaGame := self gameWithOneLap: aLoadedDie.
	aDuplaGalacticaGame movePlayer.
	aDuplaGalacticaGame movePlayer.
	aDuplaGalacticaGame movePlayer.
	aDuplaGalacticaGame movePlayer.
	self assert: aDuplaGalacticaGame playersBox equals: (OrderedCollection with: 6 with: 1)
]

{ #category : #tests }
MovePlayersFromTheGameTest >> testO001CreateAGameWithOneGoalLapAndAParsecsMeasureThenCheckTheParsecsNominalValue [

	| aLoadedDie aDuplaGalacticaGame |
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 7
			               with: 8
			               with: 9
			               with: 6).
	aDuplaGalacticaGame := self gameWithOneLap: aLoadedDie.
	self assert: aDuplaGalacticaGame parsecs nominalValue equals: 100
]

{ #category : #tests }
MovePlayersFromTheGameTest >> testO002CreateAGameWithAMoreParsecsMeasureThenCheckTheParsecsNominalValue [

	| aLoadedDie aDuplaGalacticaGame |
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 7
			               with: 8
			               with: 9
			               with: 6).
	aDuplaGalacticaGame := self gameWithMoreParsecs: aLoadedDie.
	self assert: aDuplaGalacticaGame parsecs nominalValue equals: 200
]
