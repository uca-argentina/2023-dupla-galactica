Class {
	#name : #BoxesTest,
	#superclass : #TestCase,
	#instVars : [
		'aCardsCollection',
		'aColorsCollection'
	],
	#category : #'IngSoft2-Tests'
}

{ #category : #running }
BoxesTest >> setUp [

	super setUp.

	aColorsCollection := OrderedCollection with: 'red' with: 'blue'.
	aCardsCollection := (ObjectCreator use: (OrderedCollection with:
			                      (ObjectProbability
				                       using: OverloadCard initializeNew
				                       withChanceOf: 100))) create: 4
]

{ #category : #tests }
BoxesTest >> should: anErrorBlock raise: anExceptionClass withMessage: anErrorMessage [

	self
		should: anErrorBlock
		raise: anExceptionClass
		withExceptionDo: [ :error | 
		self assert: error messageText equals: anErrorMessage ]
]

{ #category : #tests }
BoxesTest >> testN001WhenPlayerReachesANoEffectBoxThenCheckThatNoEffectsWereAppliedAndValidPlayersPositions [

	| aLoadedDie aDuplaGalacticaGame aBoxesCollection aBoard |
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 6
			               with: 8
			               with: 5
			               with: 8).
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
	aDuplaGalacticaGame movePlayer.
	aDuplaGalacticaGame movePlayer.
	self
		assert: aDuplaGalacticaGame playersBox
		equals: (OrderedCollection with: 7 with: 9)
]

{ #category : #tests }
BoxesTest >> testN002WhenPlayerReachesAWormHoleBoxThenCheckThatANegativeEffectWasAppliedAndValidPlayersPositions [

	| aLoadedDie aDuplaGalacticaGame aBoxesCollection aBoard |
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 5
			               with: 8
			               with: 5
			               with: 8).
	aBoxesCollection := (ObjectCreator use: (OrderedCollection with:
			                      (ObjectProbability
				                       using: WormHoleBox initializeNew
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
	aDuplaGalacticaGame movePlayer.
	aDuplaGalacticaGame movePlayer.
	self
		assert: aDuplaGalacticaGame playersBox
		equals: (OrderedCollection with: 2 with: 5)
]

{ #category : #tests }
BoxesTest >> testN003WhenPlayerReachesASpeedUpBoxThenCheckThatAPositiveEffectWasAppliedAndValidPlayersPositions [

	| aLoadedDie aDuplaGalacticaGame aBoxesCollection aBoard |
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 8
			               with: 5
			               with: 8).
	aBoxesCollection := (ObjectCreator use: (OrderedCollection with:
			                      (ObjectProbability
				                       using: SpeedUpBox initializeNew
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
	aDuplaGalacticaGame movePlayer.
	aDuplaGalacticaGame movePlayer.
	self
		assert: aDuplaGalacticaGame playersBox
		equals: (OrderedCollection with: 6 with: 3)
]

{ #category : #tests }
BoxesTest >> testN004WhenPlayerReachesAMoonWalkBoxThenCheckThatTheEffectWasAppliedOnOtherPlayersAndValidPlayersPositions [

	| aLoadedDie aDuplaGalacticaGame aBoxesCollection aBoard |
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 8
			               with: 3
			               with: 5
			               with: 8).
	aBoxesCollection := (ObjectCreator use: (OrderedCollection with:
			                      (ObjectProbability
				                       using: (MoonWalkBox with: -2)
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
	aDuplaGalacticaGame movePlayer.
	aDuplaGalacticaGame movePlayer.
	self
		assert: aDuplaGalacticaGame playersBox
		equals: (OrderedCollection with: 7 with: 4)
]

{ #category : #tests }
BoxesTest >> testN005WhenPlayerReachesAnAtomicBombBoxThenCheckThatAllPlayersWereMovedToTheBeginningOfTheLapAndValidPlayersPositions [

	| aLoadedDie aDuplaGalacticaGame aBoxesCollection aBoard |
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 8
			               with: 5
			               with: 8).
	aBoxesCollection := (ObjectCreator use:
		                     (OrderedCollection with: (ObjectProbability
				                       using: AtomicBombBox initializeNew
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
	aDuplaGalacticaGame movePlayer.
	aDuplaGalacticaGame movePlayer.
	self
		assert: aDuplaGalacticaGame playersBox
		equals: (OrderedCollection with: 1 with: 1)
]

{ #category : #tests }
BoxesTest >> testN006WhenPlayerReachesAHyperJumpBoxThenCheckThatTheEffectDependingOnAParsecNominalValueWasAppliedAndValidPlayersPositions [

	| aLoadedDie aDuplaGalacticaGame aBoxesCollection aBoard |
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 3
			               with: 3
			               with: 5
			               with: 8).
	aBoxesCollection := (ObjectCreator use:
		                     (OrderedCollection with: (ObjectProbability
				                       using:
					                       (HyperJumpBox with: (OrderedCollection
							                         with: (ParsecMeasure worth: 40)
							                         with: (ParsecMeasure worth: 30)))
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
	aDuplaGalacticaGame movePlayer.
	aDuplaGalacticaGame movePlayer.
	self
		assert: aDuplaGalacticaGame playersBox
		equals: (OrderedCollection with: 8 with: 7)
]

{ #category : #tests }
BoxesTest >> testN007WhenPlayerReachesAWormHoleBoxInTheFirstLapThenCheckThatTheNegativeEffectCannotSendPlayerToAnOutOfRangeBoardPositionAndValidPlayersPositions [

	| aLoadedDie aDuplaGalacticaGame aBoxesCollection aBoard |
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 8
			               with: 5
			               with: 8).
	aBoxesCollection := (ObjectCreator use: (OrderedCollection with:
			                      (ObjectProbability
				                       using: WormHoleBox initializeNew
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
	aDuplaGalacticaGame movePlayer.
	aDuplaGalacticaGame movePlayer.
	self
		assert: aDuplaGalacticaGame playersBox
		equals: (OrderedCollection with: 1 with: 5)
]

{ #category : #tests }
BoxesTest >> testN008WhenPlayerReachesAMoonWalkBoxThenCheckThatTheEffectCannotSendOtherPlayersToAnOutOfRangeBoardPositionInTheFirstLapAndValidPlayersPositions [

	| aLoadedDie aDuplaGalacticaGame aBoxesCollection aBoard |
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 3
			               with: 4
			               with: 5
			               with: 8).
	aBoxesCollection := (ObjectCreator use: (OrderedCollection with:
			                      (ObjectProbability
				                       using: (MoonWalkBox with: -4)
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
	aDuplaGalacticaGame movePlayer.
	aDuplaGalacticaGame movePlayer.
	self
		assert: aDuplaGalacticaGame playersBox
		equals: (OrderedCollection with: 1 with: 5)
]

{ #category : #tests }
BoxesTest >> testN009WhenPlayerReachesAHyperJumpBoxInTheFirstLapThenCheckThatANegativeEffectCannotSendPlayerToAnOutOfRangeBoardPositionAndValidPlayersPositions [

	| aLoadedDie aDuplaGalacticaGame aBoxesCollection aBoard |
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 3
			               with: 3
			               with: 5
			               with: 8).
	aBoxesCollection := (ObjectCreator use:
		                     (OrderedCollection with: (ObjectProbability
				                       using:
					                       (HyperJumpBox with: (OrderedCollection
							                         with: (ParsecMeasure worth: -40)
							                         with: (ParsecMeasure worth: -10)))
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
	aDuplaGalacticaGame movePlayer.
	aDuplaGalacticaGame movePlayer.
	self
		assert: aDuplaGalacticaGame playersBox
		equals: (OrderedCollection with: 3 with: 1)
]

{ #category : #tests }
BoxesTest >> testN010WhenPlayerReachesTheGoalButAlsoReachAMoonWalkBoxThenCheckThatTheEffectMakesItNotWinAndCheckingWinnerFails [

	| aLoadedDie aDuplaGalacticaGame aBoxesCollection aBoard |
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 13
			               with: 8
			               with: 5
			               with: 8).
	aBoxesCollection := (ObjectCreator use: (OrderedCollection with:
			                      (ObjectProbability
				                       using: WormHoleBox initializeNew
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
	aDuplaGalacticaGame movePlayer.
	self
		should: [ aDuplaGalacticaGame winner ]
		raise: Error
		withMessage: 'There is no winner'
]

{ #category : #tests }
BoxesTest >> testN011CheckHyperJumpBoxMovesTheCorrectAmountOfParsecsWhenThatAreNotEntireValuesThenValidPlayersPositions [

	| aLoadedDie aDuplaGalacticaGame aBoxesCollection aBoard |
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 3
			               with: 3
			               with: 5
			               with: 8).
	aBoxesCollection := (ObjectCreator use:
		                     (OrderedCollection with: (ObjectProbability
				                       using:
					                       (HyperJumpBox with: (OrderedCollection
							                         with: (ParsecMeasure worth: 45.5)
							                         with: (ParsecMeasure worth: 39.4)))
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
	aDuplaGalacticaGame movePlayer.
	aDuplaGalacticaGame movePlayer.
	self
		assert: aDuplaGalacticaGame playersBox
		equals: (OrderedCollection with: 8 with: 7)
]

{ #category : #tests }
BoxesTest >> testR001WhenPlayerReachesARandomCardBoxThenCheckThatPlayerHasOneMoreCardInPosetion [

	| aLoadedDie aDuplaGalacticaGame aBoxesCollection aBoard |
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 6
			               with: 8
			               with: 5
			               with: 8).
	aBoxesCollection := (ObjectCreator use:
		                     (OrderedCollection with: (ObjectProbability
				                       using:
					                       (RandomCardBox with:
						                        (OrderedCollection with:
							                         (ObjectProbability
								                          using: OverloadCard initializeNew
								                          withChanceOf: 100)))
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
	aDuplaGalacticaGame movePlayer.
	self
		assert: aDuplaGalacticaGame playersCardInPosetion
		equals: (OrderedCollection with: 3 with: 2)
]

{ #category : #tests }
BoxesTest >> testR003TryToCreateARandomCardBoxWithCardsProbabilitiesLessThan100ThenFails [

	self
		should: [ 
			RandomCardBox with: (OrderedCollection with:
					 (ObjectProbability
						  using: OverloadCard initializeNew
						  withChanceOf: 10)) ]
		raise: Error
		withMessage: 'The sum of probabilities must be 100'
]

{ #category : #tests }
BoxesTest >> testT001CheckHyperJumpBoxMoveTheCorrectAmountOfBoxesWhenTheValuesAreGivenInLightYearsThenValidPlayersPositions [

	| aLoadedDie aDuplaGalacticaGame aBoxesCollection aBoard |
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 3
			               with: 3
			               with: 5
			               with: 8).
	aBoxesCollection := (ObjectCreator use:
		                     (OrderedCollection with: (ObjectProbability
				                       using:
					                       (HyperJumpBox with: (OrderedCollection
							                         with: (LigthYearMeasure worth: 120)
							                         with: (LigthYearMeasure worth: 90)))
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
	aDuplaGalacticaGame movePlayer.
	aDuplaGalacticaGame movePlayer.
	self
		assert: aDuplaGalacticaGame playersBox
		equals: (OrderedCollection with: 8 with: 7)
]

{ #category : #tests }
BoxesTest >> testT002CheckHyperJumpBoxMoveTheCorrectAmountOfBoxesWhenTheValuesAreGivenInLightYearsAndParsecsThenValidPlayersPositions [

	| aLoadedDie aDuplaGalacticaGame aBoxesCollection aBoard |
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 3
			               with: 3
			               with: 5
			               with: 8).
	aBoxesCollection := (ObjectCreator use:
		                     (OrderedCollection with: (ObjectProbability
				                       using:
					                       (HyperJumpBox with: (OrderedCollection
							                         with: (LigthYearMeasure worth: 120)
							                         with: (ParsecMeasure worth: 30)))
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
	aDuplaGalacticaGame movePlayer.
	aDuplaGalacticaGame movePlayer.
	self
		assert: aDuplaGalacticaGame playersBox
		equals: (OrderedCollection with: 8 with: 7)
]

{ #category : #tests }
BoxesTest >> testT003TryToCreateAHyperJumpBoxWithNoValuesToUseThenFails [

	self
		should: [ 
			(ObjectCreator use: (OrderedCollection with: (ObjectProbability
						   using: (HyperJumpBox with: OrderedCollection new)
						   withChanceOf: 100))) create: 10 ]
		raise: Error
		withMessage: 'There are no values to use in the hyper jump box'
]

{ #category : #tests }
BoxesTest >> testT004CheckHyperJumpBoxMoveTheCorrectAmountOfBoxesWhenTheValuesAreGivenInLightYearsAndParsecsAndAlsoTheyAreNegativeThenValidPlayersPositions [

	| aLoadedDie aDuplaGalacticaGame aBoxesCollection aBoard |
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 3
			               with: 3
			               with: 5
			               with: 8).
	aBoxesCollection := (ObjectCreator use:
		                     (OrderedCollection with: (ObjectProbability
				                       using:
					                       (HyperJumpBox with: (OrderedCollection
							                         with: (LigthYearMeasure worth: -60)
							                         with: (ParsecMeasure worth: -30)))
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
	aDuplaGalacticaGame movePlayer.
	aDuplaGalacticaGame movePlayer.
	self
		assert: aDuplaGalacticaGame playersBox
		equals: (OrderedCollection with: 2 with: 1)
]

{ #category : #tests }
BoxesTest >> testT005WhenPlayerReachesAHyperJumpBoxThenCheckIfItHasANegativeEffectThatMakesPlayerMoveBackwardMoreThanOneLapAndValidPlayersPositions [

	| aLoadedDie aDuplaGalacticaGame aBoxesCollection aBoard |
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 30
			               with: 31
			               with: 5
			               with: 8).
	aBoxesCollection := (ObjectCreator use:
		                     (OrderedCollection with: (ObjectProbability
				                       using: (HyperJumpBox with:
						                        (OrderedCollection with:
							                         (ParsecMeasure worth: -220)))
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
	aDuplaGalacticaGame movePlayer.
	aDuplaGalacticaGame movePlayer.
	self
		assert: aDuplaGalacticaGame playersBox
		equals: (OrderedCollection with: 9 with: 10)
]
