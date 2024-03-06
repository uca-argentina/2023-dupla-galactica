Class {
	#name : #BoxesTest,
	#superclass : #TestCase,
	#instVars : [
		'aColorCollection',
		'aCardsCollection'
	],
	#category : #'IngSoft2-Tests'
}

{ #category : #running }
BoxesTest >> setUp [

	super setUp.

	aColorCollection := OrderedCollection with: 'red' with: 'blue'.
	aCardsCollection := (Creator use: (OrderedCollection with:
			           (ObjectProbability
				            using: OverloadCard initializeNew
				            withChanceOf: 100))) create: 4.
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
BoxesTest >> testN001WhenPlayerReachesANoEffectBoxThenCheckThatNoEffectsWereAppliedOnItPositionAndValidPlayersPositions [

	| aLoadedDie aGame aBoxesCollection aBoard |
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 6
			               with: 8
			               with: 5
			               with: 8).
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
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersBox
		equals: (OrderedCollection with: 7 with: 9)
]

{ #category : #tests }
BoxesTest >> testN002WhenPlayerReachesAWormHoleBoxThenCheckThatANegativeEffectWasAppliedOnItPositionAndValidPlayersPositions [

	| aLoadedDie aGame aBoxesCollection aBoard |
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 5
			               with: 8
			               with: 5
			               with: 8).
	aBoxesCollection := (Creator use: (OrderedCollection with:
			                      (ObjectProbability
				                       using: WormHoleBox initializeNew
				                       withChanceOf: 100))) create: 10.
	aBoard := Board with: aBoxesCollection measure: (Parsec worth: 100).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         usingToThrow:
		         (DiceShaker with: (OrderedCollection with: aLoadedDie))
		         winningWhenReach: 1
		         using: aCardsCollection.
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersBox
		equals: (OrderedCollection with: 2 with: 5)
]

{ #category : #tests }
BoxesTest >> testN003WhenPlayerReachesASpeedUpBoxThenCheckThatAPositiveEffectWasAppliedOnItPositionAndValidPlayersPositions [

	| aLoadedDie aGame aBoxesCollection aBoard |
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 8
			               with: 5
			               with: 8).
	aBoxesCollection := (Creator use: (OrderedCollection with:
			                      (ObjectProbability
				                       using: SpeedUpBox initializeNew
				                       withChanceOf: 100))) create: 10.
	aBoard := Board with: aBoxesCollection measure: (Parsec worth: 100).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         usingToThrow:
		         (DiceShaker with: (OrderedCollection with: aLoadedDie))
		         winningWhenReach: 1
		         using: aCardsCollection.
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersBox
		equals: (OrderedCollection with: 6 with: 3)
]

{ #category : #tests }
BoxesTest >> testN004WhenPlayerReachesAMoonWalkBoxThenCheckThatTheEffectWasAppliedOnOtherPlayersPositionsAndValidPlayersPositions [

	| aLoadedDie aGame aBoxesCollection aBoard |
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 8
			               with: 3
			               with: 5
			               with: 8).
	aBoxesCollection := (Creator use: (OrderedCollection with:
			                      (ObjectProbability
				                       using: (MoonWalkBox with: -2)
				                       withChanceOf: 100))) create: 10.
	aBoard := Board with: aBoxesCollection measure: (Parsec worth: 100).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         usingToThrow:
		         (DiceShaker with: (OrderedCollection with: aLoadedDie))
		         winningWhenReach: 1
		         using: aCardsCollection.
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersBox
		equals: (OrderedCollection with: 7 with: 4)
]

{ #category : #tests }
BoxesTest >> testN005WhenPlayerReachesAnAtomicBombBoxThenCheckThatAllPlayersWereMovedToTheBeginningOfTheLap [

	| aLoadedDie aGame aBoxesCollection aBoard |
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 8
			               with: 5
			               with: 8).
	aBoxesCollection := (Creator use:
		                     (OrderedCollection with: (ObjectProbability
				                       using: AtomicBombBox initializeNew
				                       withChanceOf: 100))) create: 10.
	aBoard := Board with: aBoxesCollection measure: (Parsec worth: 100).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         usingToThrow:
		         (DiceShaker with: (OrderedCollection with: aLoadedDie))
		         winningWhenReach: 1
		         using: aCardsCollection.
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersBox
		equals: (OrderedCollection with: 1 with: 1)
]

{ #category : #tests }
BoxesTest >> testN006WhenPlayerReachesAHyperJumpBoxThenCheckThatTheEffectDependingOnAParsecNominalValueWasAppliedOnItPosition [

	| aLoadedDie aGame aBoxesCollection aBoard |
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 3
			               with: 3
			               with: 5
			               with: 8).
	aBoxesCollection := (Creator use:
		                     (OrderedCollection with: (ObjectProbability
				                       using: (HyperJumpBox with:
						                        (OrderedCollection
							                         with: (Parsec worth: 40)
							                         with: (Parsec worth: 30)))
				                       withChanceOf: 100))) create: 10.
	aBoard := Board with: aBoxesCollection measure: (Parsec worth: 100).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         usingToThrow:
		         (DiceShaker with: (OrderedCollection with: aLoadedDie))
		         winningWhenReach: 1
		         using: aCardsCollection.
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersBox
		equals: (OrderedCollection with: 8 with: 7)
]

{ #category : #tests }
BoxesTest >> testN007WhenPlayerReachesAWormHoleBoxInTheFirstLapThenCheckThatTheNegativeEffectCannotSendPlayerToAnOutOfRangeBoardPosition [

	| aLoadedDie aGame aBoxesCollection aBoard |
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 8
			               with: 5
			               with: 8).
	aBoxesCollection := (Creator use: (OrderedCollection with:
			                      (ObjectProbability
				                       using: WormHoleBox initializeNew
				                       withChanceOf: 100))) create: 10.
	aBoard := Board with: aBoxesCollection measure: (Parsec worth: 100).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         usingToThrow:
		         (DiceShaker with: (OrderedCollection with: aLoadedDie))
		         winningWhenReach: 1
		         using: aCardsCollection.
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersBox
		equals: (OrderedCollection with: 1 with: 5)
]

{ #category : #tests }
BoxesTest >> testN008WhenPlayerReachesAMoonWalkBoxThenCheckThatTheEffectCannotSendOtherPlayersToAnOutOfRangeBoardPositionInTheFirstLap [

	| aLoadedDie aGame aBoxesCollection aBoard |
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 3
			               with: 4
			               with: 5
			               with: 8).
	aBoxesCollection := (Creator use: (OrderedCollection with:
			                      (ObjectProbability
				                       using: (MoonWalkBox with: -4)
				                       withChanceOf: 100))) create: 10.
	aBoard := Board with: aBoxesCollection measure: (Parsec worth: 100).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         usingToThrow:
		         (DiceShaker with: (OrderedCollection with: aLoadedDie))
		         winningWhenReach: 1
		         using: aCardsCollection.
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersBox
		equals: (OrderedCollection with: 1 with: 5)
]

{ #category : #tests }
BoxesTest >> testN009WhenPlayerReachesAHyperJumpBoxInTheFirstLapThenCheckThatANegativeEffectCannotSendPlayerToAnOutOfRangeBoardPosition [

	| aLoadedDie aGame aBoxesCollection aBoard |
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 3
			               with: 3
			               with: 5
			               with: 8).
	aBoxesCollection := (Creator use:
		                     (OrderedCollection with: (ObjectProbability
				                       using: (HyperJumpBox with:
						                        (OrderedCollection
							                         with: (Parsec worth: -40)
							                         with: (Parsec worth: -10)))
				                       withChanceOf: 100))) create: 10.
	aBoard := Board with: aBoxesCollection measure: (Parsec worth: 100).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         usingToThrow:
		         (DiceShaker with: (OrderedCollection with: aLoadedDie))
		         winningWhenReach: 1
		         using: aCardsCollection.
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersBox
		equals: (OrderedCollection with: 3 with: 1)
]

{ #category : #tests }
BoxesTest >> testN010WhenPlayerReachesTheGoalButAlsoReachAMoonWalkBoxCheckThatTheEffectMakesItNotWinAndCheckingWinnerFails [

	| aLoadedDie aGame aBoxesCollection aBoard |
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 13
			               with: 8
			               with: 5
			               with: 8).
	aBoxesCollection := (Creator use: (OrderedCollection with:
			                      (ObjectProbability
				                       using: WormHoleBox initializeNew
				                       withChanceOf: 100))) create: 10.
	aBoard := Board with: aBoxesCollection measure: (Parsec worth: 100).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         usingToThrow:
		         (DiceShaker with: (OrderedCollection with: aLoadedDie))
		         winningWhenReach: 1
		         using: aCardsCollection.
	aGame movePlayer.
	self
		should: [ aGame winner ]
		raise: Error
		withMessage: 'There is no winner'
]

{ #category : #tests }
BoxesTest >> testN011CheckHyperJumpBoxMovesTheCorrectAmountOfParsecsWhenThatAreNotEntireValuesThenValuePlayerPositions [

	| aLoadedDie aGame aBoxesCollection aBoard |
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 3
			               with: 3
			               with: 5
			               with: 8).
	aBoxesCollection := (Creator use:
		                     (OrderedCollection with: (ObjectProbability
				                       using:
					                       (HyperJumpBox with: (OrderedCollection
							                         with: (Parsec worth: 45.5)
							                         with: (Parsec worth: 39.4)))
				                       withChanceOf: 100))) create: 10.
	aBoard := Board with: aBoxesCollection measure: (Parsec worth: 100).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         usingToThrow:
		         (DiceShaker with: (OrderedCollection with: aLoadedDie))
		         winningWhenReach: 1
		         using: aCardsCollection.
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersBox
		equals: (OrderedCollection with: 8 with: 7)
]

{ #category : #tests }
BoxesTest >> testR001WhenPlayerReachesARandomCardBoxThenCheckThatPlayerHasOneMoreCardInPosetion [

	| aLoadedDie aGame aBoxesCollection aBoard |
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 6
			               with: 8
			               with: 5
			               with: 8).
	aBoxesCollection := (Creator use:
		                     (OrderedCollection with: (ObjectProbability
				                       using:
					                       (RandomCardBox with:
						                        (OrderedCollection with:
							                         (ObjectProbability
								                          using: OverloadCard initializeNew
								                          withChanceOf: 100)))
				                       withChanceOf: 100))) create: 10.
	aBoard := Board with: aBoxesCollection measure: (Parsec worth: 100).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         usingToThrow:
		         (DiceShaker with: (OrderedCollection with: aLoadedDie))
		         winningWhenReach: 1
		         using: aCardsCollection.
	aGame movePlayer.
	self
		assert: aGame playersCardInPosetion
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
BoxesTest >> testT001CheckHyperJumpBoxMoveTheCorrectAmountOfBoxesWhenTheValuesAreGivenInLightYearsThenValidPositions [

	| aLoadedDie aGame aBoxesCollection aBoard |
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 3
			               with: 3
			               with: 5
			               with: 8).
	aBoxesCollection := (Creator use:
		                     (OrderedCollection with: (ObjectProbability
				                       using:
					                       (HyperJumpBox with: (OrderedCollection
							                         with: (LigthYear worth: 120)
							                         with: (LigthYear worth: 90)))
				                       withChanceOf: 100))) create: 10.
	aBoard := Board with: aBoxesCollection measure: (Parsec worth: 100).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         usingToThrow:
		         (DiceShaker with: (OrderedCollection with: aLoadedDie))
		         winningWhenReach: 1
		         using: aCardsCollection.
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersBox
		equals: (OrderedCollection with: 8 with: 7)
]

{ #category : #tests }
BoxesTest >> testT002CheckHyperJumpBoxMoveTheCorrectAmountOfBoxesWhenTheValuesAreGivenInLightYearsAndParsecsThenValidPositions [

	| aLoadedDie aGame aBoxesCollection aBoard |
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 3
			               with: 3
			               with: 5
			               with: 8).
	aBoxesCollection := (Creator use:
		                     (OrderedCollection with: (ObjectProbability
				                       using:
					                       (HyperJumpBox with: (OrderedCollection
							                         with: (LigthYear worth: 120)
							                         with: (Parsec worth: 30)))
				                       withChanceOf: 100))) create: 10.
	aBoard := Board with: aBoxesCollection measure: (Parsec worth: 100).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         usingToThrow:
		         (DiceShaker with: (OrderedCollection with: aLoadedDie))
		         winningWhenReach: 1
		         using: aCardsCollection.
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersBox
		equals: (OrderedCollection with: 8 with: 7)
]

{ #category : #tests }
BoxesTest >> testT003TryToCreateAHyperJumpBoxWithNoValuesToUseThenFails [

	self
		should: [ 
			(Creator use: (OrderedCollection with: (ObjectProbability
						   using: (HyperJumpBox with: OrderedCollection new)
						   withChanceOf: 100))) create: 10 ]
		raise: Error
		withMessage: 'There are no values to use in the hyper jump box'
]

{ #category : #tests }
BoxesTest >> testT004CheckHyperJumpBoxMoveTheCorrectAmountOfBoxesWhenTheValuesAreGivenInLightYearsAndParsecsAndAlsoTheyAreNegativeThenValidPositions [

	| aLoadedDie aGame aBoxesCollection aBoard |
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 3
			               with: 3
			               with: 5
			               with: 8).
	aBoxesCollection := (Creator use:
		                     (OrderedCollection with: (ObjectProbability
				                       using:
					                       (HyperJumpBox with: (OrderedCollection
							                         with: (LigthYear worth: -60)
							                         with: (Parsec worth: -30)))
				                       withChanceOf: 100))) create: 10.
	aBoard := Board with: aBoxesCollection measure: (Parsec worth: 100).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         usingToThrow:
		         (DiceShaker with: (OrderedCollection with: aLoadedDie))
		         winningWhenReach: 1
		         using: aCardsCollection.
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersBox
		equals: (OrderedCollection with: 2 with: 1)
]

{ #category : #tests }
BoxesTest >> testT005WhenPlayerReachesAHyperJumpBoxThenCheckIfItHasANegativeEffectThatMakesPlayerMoveBackwardMoreThanOneLapAndValidPositions [

	| aLoadedDie aGame aBoxesCollection aBoard |
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 30
			               with: 31
			               with: 5
			               with: 8).
	aBoxesCollection := (Creator use:
		                     (OrderedCollection with: (ObjectProbability
				                       using:
				                       (HyperJumpBox with:
					                        (OrderedCollection with:
						                         (Parsec worth: -220)))
				                       withChanceOf: 100))) create: 10.
	aBoard := Board with: aBoxesCollection measure: (Parsec worth: 100).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         usingToThrow:
		         (DiceShaker with: (OrderedCollection with: aLoadedDie))
		         winningWhenReach: 1
		         using: aCardsCollection.
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersBox
		equals: (OrderedCollection with: 9 with: 10)
]
