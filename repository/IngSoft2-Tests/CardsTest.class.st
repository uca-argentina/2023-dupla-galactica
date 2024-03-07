Class {
	#name : #CardsTest,
	#superclass : #TestCase,
	#instVars : [
		'aColorsCollection'
	],
	#category : #'IngSoft2-Tests'
}

{ #category : #Board }
CardsTest >> createBoard [

	| aBoxesCollection |
	aBoxesCollection := (ObjectCreator use: (OrderedCollection with:
			           (ObjectProbability
				            using: NoEffectBox initializeNew
				            withChanceOf: 100))) create: 10.
	^ Board with: aBoxesCollection measure: (ParsecMeasure worth: 100)
]

{ #category : #running }
CardsTest >> setUp [

	super setUp.

	aColorsCollection := OrderedCollection with: 'red' with: 'blue'.
]

{ #category : #tests }
CardsTest >> should: anErrorBlock raise: anExceptionClass withMessage: anErrorMessage [

	self
		should: anErrorBlock
		raise: anExceptionClass
		withExceptionDo: [ :error | 
		self assert: error messageText equals: anErrorMessage ]
]

{ #category : #tests }
CardsTest >> testQ001WhenPlayerPlaysAnOverloadCardThenCheckTheNegativeEffectAndValidPlayersPositions [

	| aDuplaGalacticaGame aLoadedDie aCardsCollection |
	aCardsCollection := (ObjectCreator use: (OrderedCollection with:
			                      (ObjectProbability
				                       using: OverloadCard initializeNew
				                       withChanceOf: 100))) create: 4.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 2
			               with: 3
			               with: 4).
	aDuplaGalacticaGame := DuplaGalacticaGameProxy
		                       with: aColorsCollection
		                       and: self createBoard
		                       usingToThrow:
		                       (DiceShaker with:
			                        (OrderedCollection with: aLoadedDie))
		                       winningWhenReach: 1
		                       using: aCardsCollection.
	aDuplaGalacticaGame
		apply: (PlayerHand of: 'red' with: OverloadCard initializeNew)
		to: 'blue'.
	aDuplaGalacticaGame movePlayer.
	aDuplaGalacticaGame movePlayer.
	self
		assert: aDuplaGalacticaGame playersBox
		equals: (OrderedCollection with: 2 with: 1)
]

{ #category : #tests }
CardsTest >> testQ002WhenPlayerPlaysAnOverloadCardThenCheckThatTheNegativeEffectIsPermanentAndValidPlayersPositions [

	| aDuplaGalacticaGame aLoadedDie aCardsCollection |
	aCardsCollection := (ObjectCreator use: (OrderedCollection with:
			                      (ObjectProbability
				                       using: OverloadCard initializeNew
				                       withChanceOf: 100))) create: 4.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 2
			               with: 3
			               with: 4).
	aDuplaGalacticaGame := DuplaGalacticaGameProxy
		                       with: aColorsCollection
		                       and: self createBoard
		                       usingToThrow:
		                       (DiceShaker with:
			                        (OrderedCollection with: aLoadedDie))
		                       winningWhenReach: 1
		                       using: aCardsCollection.
	aDuplaGalacticaGame
		apply: (PlayerHand of: 'red' with: OverloadCard initializeNew)
		to: 'blue'.
	aDuplaGalacticaGame movePlayer.
	aDuplaGalacticaGame movePlayer.
	aDuplaGalacticaGame movePlayer.
	aDuplaGalacticaGame movePlayer.
	self
		assert: aDuplaGalacticaGame playersBox
		equals: (OrderedCollection with: 5 with: 3)
]

{ #category : #tests }
CardsTest >> testQ003WhenPlayerPlaysAnOverloadCardThenCheckTheNegativeEffectMakesPlayerGoBackwardLapsAndValidPlayersPositions [

	| aDuplaGalacticaGame aLoadedDie aCardsCollection |
	aCardsCollection := (ObjectCreator use: (OrderedCollection with:
			                      (ObjectProbability
				                       using: OverloadCard initializeNew
				                       withChanceOf: 100))) create: 4.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 10
			               with: 3
			               with: 4).
	aDuplaGalacticaGame := DuplaGalacticaGameProxy
		                       with: aColorsCollection
		                       and: self createBoard
		                       usingToThrow:
		                       (DiceShaker with:
			                        (OrderedCollection with: aLoadedDie))
		                       winningWhenReach: 1
		                       using: aCardsCollection.
	aDuplaGalacticaGame
		apply: (PlayerHand of: 'red' with: OverloadCard initializeNew)
		to: 'blue'.
	aDuplaGalacticaGame movePlayer.
	aDuplaGalacticaGame movePlayer.
	self
		assert: aDuplaGalacticaGame playersBox
		equals: (OrderedCollection with: 2 with: 9)
]

{ #category : #tests }
CardsTest >> testQ004WhenPlayerPlaysAnOverloadCardThenCheckTheNegativeEffectCannotSendPlayerToAnOutOfRangeBoardPositionAndValidPlayersPositions [

	| aDuplaGalacticaGame aLoadedDie cards |
	cards := (ObjectCreator use: (OrderedCollection with:
			           (ObjectProbability
				            using: OverloadCard initializeNew
				            withChanceOf: 100))) create: 4.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 1
			               with: 3
			               with: 4).
	aDuplaGalacticaGame := DuplaGalacticaGameProxy
		                       with: aColorsCollection
		                       and: self createBoard
		                       usingToThrow:
		                       (DiceShaker with:
			                        (OrderedCollection with: aLoadedDie))
		                       winningWhenReach: 1
		                       using: cards.
	aDuplaGalacticaGame
		apply: (PlayerHand of: 'red' with: OverloadCard initializeNew)
		to: 'blue'.
	aDuplaGalacticaGame movePlayer.
	aDuplaGalacticaGame movePlayer.
	self
		assert: aDuplaGalacticaGame playersBox
		equals: (OrderedCollection with: 2 with: 1)
]

{ #category : #tests }
CardsTest >> testQ005WhenPlayerPlaysASpeedCardThenCheckThePositiveEffectAndValidPlayersPositions [

	| aDuplaGalacticaGame aLoadedDie aCardsCollection |
	aCardsCollection := (ObjectCreator use: (OrderedCollection with:
			                      (ObjectProbability
				                       using: SpeedCard initializeNew
				                       withChanceOf: 100))) create: 4.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 4
			               with: 3
			               with: 4).
	aDuplaGalacticaGame := DuplaGalacticaGameProxy
		                       with: aColorsCollection
		                       and: self createBoard
		                       usingToThrow:
		                       (DiceShaker with:
			                        (OrderedCollection with: aLoadedDie))
		                       winningWhenReach: 1
		                       using: aCardsCollection.
	aDuplaGalacticaGame
		apply: (PlayerHand of: 'red' with: SpeedCard initializeNew)
		to: 'red'.
	aDuplaGalacticaGame movePlayer.
	aDuplaGalacticaGame movePlayer.
	self
		assert: aDuplaGalacticaGame playersBox
		equals: (OrderedCollection with: 3 with: 5)
]

{ #category : #tests }
CardsTest >> testQ006WhenPlayerPlaysASpeedCardThenCheckThatThePositiveEffectIsPermanentAndValidPlayersPositions [

	| aDuplaGalacticaGame aLoadedDie aCardsCollection |
	aCardsCollection := (ObjectCreator use: (OrderedCollection with:
			                      (ObjectProbability
				                       using: SpeedCard initializeNew
				                       withChanceOf: 100))) create: 4.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 2
			               with: 3
			               with: 4).
	aDuplaGalacticaGame := DuplaGalacticaGameProxy
		                       with: aColorsCollection
		                       and: self createBoard
		                       usingToThrow:
		                       (DiceShaker with:
			                        (OrderedCollection with: aLoadedDie))
		                       winningWhenReach: 1
		                       using: aCardsCollection.
	aDuplaGalacticaGame
		apply: (PlayerHand of: 'red' with: SpeedCard initializeNew)
		to: 'red'.
	aDuplaGalacticaGame movePlayer.
	aDuplaGalacticaGame movePlayer.
	aDuplaGalacticaGame movePlayer.
	self
		assert: aDuplaGalacticaGame playersBox
		equals: (OrderedCollection with: 7 with: 3)
]

{ #category : #tests }
CardsTest >> testQ007WhenPlayerPlaysASpeedCardThenCheckThePositiveEffectMakesPlayerGoForwardLapsAndValidPlayersLaps [

	| aDuplaGalacticaGame aLoadedDie aCardsCollection |
	aCardsCollection := (ObjectCreator use: (OrderedCollection with:
			                      (ObjectProbability
				                       using: SpeedCard initializeNew
				                       withChanceOf: 100))) create: 4.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 9
			               with: 2
			               with: 3
			               with: 4).
	aDuplaGalacticaGame := DuplaGalacticaGameProxy
		                       with: aColorsCollection
		                       and: self createBoard
		                       usingToThrow:
		                       (DiceShaker with:
			                        (OrderedCollection with: aLoadedDie))
		                       winningWhenReach: 1
		                       using: aCardsCollection.
	aDuplaGalacticaGame
		apply: (PlayerHand of: 'red' with: SpeedCard initializeNew)
		to: 'red'.
	aDuplaGalacticaGame movePlayer.
	self
		assert: aDuplaGalacticaGame playersLaps
		equals: (OrderedCollection with: 1 with: 0)
]

{ #category : #tests }
CardsTest >> testQ008WhenPlayerPlaysTwoOverloadCardsThenCheckThatBothEffectsWereAppliedAndValidPlayersPositions [

	| aDuplaGalacticaGame aLoadedDie aCardsCollection |
	aCardsCollection := (ObjectCreator use: (OrderedCollection with:
			                      (ObjectProbability
				                       using: OverloadCard initializeNew
				                       withChanceOf: 100))) create: 4.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 2
			               with: 3
			               with: 4).
	aDuplaGalacticaGame := DuplaGalacticaGameProxy
		                       with: aColorsCollection
		                       and: self createBoard
		                       usingToThrow:
		                       (DiceShaker with:
			                        (OrderedCollection with: aLoadedDie))
		                       winningWhenReach: 1
		                       using: aCardsCollection.
	aDuplaGalacticaGame
		apply: (PlayerHand of: 'red' with: OverloadCard initializeNew)
		to: 'blue'.
	aDuplaGalacticaGame
		apply: (PlayerHand of: 'red' with: OverloadCard initializeNew)
		to: 'blue'.
	aDuplaGalacticaGame movePlayer.
	aDuplaGalacticaGame movePlayer.
	self
		assert: aDuplaGalacticaGame playersBox
		equals: (OrderedCollection with: 2 with: 1)
]

{ #category : #tests }
CardsTest >> testQ009WhenPlayerPlaysAnAccelerationCardThenCheckThatItHasAPositiveEffectOnAllPlayersAndValidPlayersPositions [

	| aDuplaGalacticaGame aLoadedDie aCardsCollection |
	aCardsCollection := (ObjectCreator use:
		                     (OrderedCollection with: (ObjectProbability
				                       using: AccelerationCard initializeNew
				                       withChanceOf: 100))) create: 4.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 2
			               with: 3
			               with: 4).
	aDuplaGalacticaGame := DuplaGalacticaGameProxy
		                       with: aColorsCollection
		                       and: self createBoard
		                       usingToThrow:
		                       (DiceShaker with:
			                        (OrderedCollection with: aLoadedDie))
		                       winningWhenReach: 1
		                       using: aCardsCollection.
	aDuplaGalacticaGame
		apply: (PlayerHand of: 'red' with: AccelerationCard initializeNew)
		to: EveryPlayer initializeNew players.
	aDuplaGalacticaGame movePlayer.
	aDuplaGalacticaGame movePlayer.
	self
		assert: aDuplaGalacticaGame playersBox
		equals: (OrderedCollection with: 3 with: 4)
]

{ #category : #tests }
CardsTest >> testQ010WhenPlayerPlaysAnAccelerationCardThenCheckThePositiveEffectMakesPlayerGoForwardLapsAndValidPlayersLaps [

	| aDuplaGalacticaGame aLoadedDie aCardsCollection |
	aCardsCollection := (ObjectCreator use:
		                     (OrderedCollection with: (ObjectProbability
				                       using: AccelerationCard initializeNew
				                       withChanceOf: 100))) create: 4.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 8
			               with: 9
			               with: 3
			               with: 4).
	aDuplaGalacticaGame := DuplaGalacticaGameProxy
		                       with: aColorsCollection
		                       and: self createBoard
		                       usingToThrow:
		                       (DiceShaker with:
			                        (OrderedCollection with: aLoadedDie))
		                       winningWhenReach: 1
		                       using: aCardsCollection.
	aDuplaGalacticaGame
		apply: (PlayerHand of: 'red' with: AccelerationCard initializeNew)
		to: EveryPlayer initializeNew players.
	aDuplaGalacticaGame movePlayer.
	aDuplaGalacticaGame movePlayer.
	self
		assert: aDuplaGalacticaGame playersLaps
		equals: (OrderedCollection with: 0 with: 1)
]

{ #category : #tests }
CardsTest >> testQ011WhenPlayerPlaysACancellationCardOnAnOverloadCardThenTheOverloadCardEffectIsCancelledAndValidPlayersPositions [

	| aDuplaGalacticaGame aLoadedDie aCardsCollection |
	aCardsCollection := OrderedCollection
		                    with: OverloadCard initializeNew
		                    with: CancellationCard initializeNew
		                    with: OverloadCard initializeNew
		                    with: CancellationCard initializeNew.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 2
			               with: 3
			               with: 4).
	aDuplaGalacticaGame := DuplaGalacticaGameProxy
		                       with: aColorsCollection
		                       and: self createBoard
		                       usingToThrow:
		                       (DiceShaker with:
			                        (OrderedCollection with: aLoadedDie))
		                       winningWhenReach: 1
		                       using: aCardsCollection.
	aDuplaGalacticaGame
		apply: (PlayerHand of: 'red' with: OverloadCard initializeNew)
		to: 'blue'.
	aDuplaGalacticaGame movePlayer.
	aDuplaGalacticaGame movePlayer.
	aDuplaGalacticaGame
		apply: (PlayerHand of: 'blue' with: CancellationCard initializeNew)
		to: (PlayerHand of: 'blue' with: OverloadCard initializeNew).
	aDuplaGalacticaGame movePlayer.
	aDuplaGalacticaGame movePlayer.
	self
		assert: aDuplaGalacticaGame playersBox
		equals: (OrderedCollection with: 5 with: 5)
]

{ #category : #tests }
CardsTest >> testQ012WhenPlayerPlaysACancellationCardOnASpeedCardAndThereAreTwoActiveSpeedCardsThenOneSpeedCardEffectIsCancelledAndValidPlayersPositions [

	| aDuplaGalacticaGame aLoadedDie aCardsCollection |
	aCardsCollection := OrderedCollection
		                    with: SpeedCard initializeNew
		                    with: SpeedCard initializeNew
		                    with: CancellationCard initializeNew
		                    with: SpeedCard initializeNew
		                    with: SpeedCard initializeNew
		                    with: CancellationCard initializeNew.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 2
			               with: 3
			               with: 4).
	aDuplaGalacticaGame := DuplaGalacticaGameProxy
		                       with: aColorsCollection
		                       and: self createBoard
		                       usingToThrow:
		                       (DiceShaker with:
			                        (OrderedCollection with: aLoadedDie))
		                       winningWhenReach: 1
		                       using: aCardsCollection.
	aDuplaGalacticaGame
		apply: (PlayerHand of: 'red' with: SpeedCard initializeNew)
		to: 'red'.
	aDuplaGalacticaGame
		apply: (PlayerHand of: 'red' with: SpeedCard initializeNew)
		to: 'red'.
	aDuplaGalacticaGame movePlayer.
	aDuplaGalacticaGame movePlayer.
	aDuplaGalacticaGame
		apply: (PlayerHand of: 'blue' with: CancellationCard initializeNew)
		to: (PlayerHand of: 'red' with: SpeedCard initializeNew).
	aDuplaGalacticaGame movePlayer.
	aDuplaGalacticaGame movePlayer.
	self
		assert: aDuplaGalacticaGame playersBox
		equals: (OrderedCollection with: 8 with: 7)
]

{ #category : #tests }
CardsTest >> testQ013WhenPlayerPlaysTwoCancellationCardsOnTwoActiveSpeedCardsThenTheTwoSpeedCardsEffectsAreCancelledAndValidPlayersPositions [

	| aDuplaGalacticaGame aLoadedDie aCardsCollection |
	aCardsCollection := OrderedCollection
		                    with: SpeedCard initializeNew
		                    with: CancellationCard initializeNew
		                    with: SpeedCard initializeNew
		                    with: CancellationCard initializeNew.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 2
			               with: 3
			               with: 4).
	aDuplaGalacticaGame := DuplaGalacticaGameProxy
		                       with: aColorsCollection
		                       and: self createBoard
		                       usingToThrow:
		                       (DiceShaker with:
			                        (OrderedCollection with: aLoadedDie))
		                       winningWhenReach: 1
		                       using: aCardsCollection.
	aDuplaGalacticaGame
		apply: (PlayerHand of: 'red' with: SpeedCard initializeNew)
		to: 'red'.
	aDuplaGalacticaGame movePlayer.
	aDuplaGalacticaGame
		apply: (PlayerHand of: 'blue' with: SpeedCard initializeNew)
		to: 'blue'.
	aDuplaGalacticaGame movePlayer.
	aDuplaGalacticaGame
		apply: (PlayerHand of: 'blue' with: CancellationCard initializeNew)
		to: (PlayerHand of: 'red' with: SpeedCard initializeNew).
	aDuplaGalacticaGame
		apply: (PlayerHand of: 'red' with: CancellationCard initializeNew)
		to: (PlayerHand of: 'blue' with: SpeedCard initializeNew).
	aDuplaGalacticaGame movePlayer.
	aDuplaGalacticaGame movePlayer.
	self
		assert: aDuplaGalacticaGame playersBox
		equals: (OrderedCollection with: 6 with: 8)
]

{ #category : #tests }
CardsTest >> testQ014TryToApplyACancellationCardOnAnOverloadCardWhenThePlayerDoesNotHaveAnyActiveCardsThenFails [

	| aDuplaGalacticaGame aLoadedDie aCardsCollection |
	aCardsCollection := (ObjectCreator use:
		                     (OrderedCollection with: (ObjectProbability
				                       using: CancellationCard initializeNew
				                       withChanceOf: 100))) create: 4.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 2
			               with: 3
			               with: 4).
	aDuplaGalacticaGame := DuplaGalacticaGameProxy
		                       with: aColorsCollection
		                       and: self createBoard
		                       usingToThrow:
		                       (DiceShaker with:
			                        (OrderedCollection with: aLoadedDie))
		                       winningWhenReach: 1
		                       using: aCardsCollection.
	self
		should: [ 
			aDuplaGalacticaGame
				apply: (PlayerHand of: 'red' with: CancellationCard initializeNew)
				to: (PlayerHand of: 'red' with: OverloadCard initializeNew) ]
		raise: Error
		withMessage: 'There are no permanent cards'
]

{ #category : #tests }
CardsTest >> testQ015TryToApplyACancellationCardOnASpeedCardWhenThePlayerHasOnlyAnActiveOverloadCardThenFails [

	| aDuplaGalacticaGame aLoadedDie aCardsCollection |
	aCardsCollection := OrderedCollection
		                    with: OverloadCard initializeNew
		                    with: CancellationCard initializeNew
		                    with: OverloadCard initializeNew
		                    with: CancellationCard initializeNew.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 2
			               with: 3
			               with: 4).
	aDuplaGalacticaGame := DuplaGalacticaGameProxy
		                       with: aColorsCollection
		                       and: self createBoard
		                       usingToThrow:
		                       (DiceShaker with:
			                        (OrderedCollection with: aLoadedDie))
		                       winningWhenReach: 1
		                       using: aCardsCollection.
	aDuplaGalacticaGame
		apply: (PlayerHand of: 'red' with: OverloadCard initializeNew)
		to: 'blue'.
	self
		should: [ 
			aDuplaGalacticaGame
				apply:
				(PlayerHand of: 'blue' with: CancellationCard initializeNew)
				to: (PlayerHand of: 'blue' with: SpeedCard initializeNew) ]
		raise: Error
		withMessage:
		'There are no that type of cards activate in this player'
]

{ #category : #tests }
CardsTest >> testQ017WhenPlayerTriesToApplyAPermanentCardAndItIsNotItsTurnThenFails [

	| aDuplaGalacticaGame aLoadedDie aCardsCollection |
	aCardsCollection := (ObjectCreator use: (OrderedCollection with:
			                      (ObjectProbability
				                       using: OverloadCard initializeNew
				                       withChanceOf: 100))) create: 4.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 2
			               with: 3
			               with: 4).
	aDuplaGalacticaGame := DuplaGalacticaGameProxy
		                       with: aColorsCollection
		                       and: self createBoard
		                       usingToThrow:
		                       (DiceShaker with:
			                        (OrderedCollection with: aLoadedDie))
		                       winningWhenReach: 1
		                       using: aCardsCollection.
	self
		should: [ 
			aDuplaGalacticaGame
				apply: (PlayerHand of: 'blue' with: OverloadCard initializeNew)
				to: 'red' ]
		raise: Error
		withMessage: 'A permanent card can only be use when it is your turn'
]

{ #category : #tests }
CardsTest >> testQ018WhenPlayerTriesToUseASpeedCardAndItDoesNotHaveThatTypeOfCardInPosetionThenFails [

	| aDuplaGalacticaGame aLoadedDie aCardsCollection |
	aCardsCollection := (ObjectCreator use: (OrderedCollection with:
			                      (ObjectProbability
				                       using: OverloadCard initializeNew
				                       withChanceOf: 100))) create: 4.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 2
			               with: 3
			               with: 4).
	aDuplaGalacticaGame := DuplaGalacticaGameProxy
		                       with: aColorsCollection
		                       and: self createBoard
		                       usingToThrow:
		                       (DiceShaker with:
			                        (OrderedCollection with: aLoadedDie))
		                       winningWhenReach: 1
		                       using: aCardsCollection.
	self
		should: [ 
			aDuplaGalacticaGame
				apply: (PlayerHand of: 'red' with: SpeedCard initializeNew)
				to: 'red' ]
		raise: Error
		withMessage: 'The player does not have that card in posetion'
]

{ #category : #tests }
CardsTest >> testQ021TryToApplyACardWhenPlayerDoNotHaveAnyMoreCardsThenFails [

	| aDuplaGalacticaGame aLoadedDie aCardsCollection |
	aCardsCollection := (ObjectCreator use: (OrderedCollection with:
			                      (ObjectProbability
				                       using: OverloadCard initializeNew
				                       withChanceOf: 100))) create: 4.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 2
			               with: 3
			               with: 4).
	aDuplaGalacticaGame := DuplaGalacticaGameProxy
		                       with: aColorsCollection
		                       and: self createBoard
		                       usingToThrow:
		                       (DiceShaker with:
			                        (OrderedCollection with: aLoadedDie))
		                       winningWhenReach: 1
		                       using: aCardsCollection.
	aDuplaGalacticaGame
		apply: (PlayerHand of: 'red' with: OverloadCard initializeNew)
		to: 'blue'.
	aDuplaGalacticaGame
		apply: (PlayerHand of: 'red' with: OverloadCard initializeNew)
		to: 'blue'.
	self
		should: [ 
			aDuplaGalacticaGame
				apply: (PlayerHand of: 'red' with: OverloadCard initializeNew)
				to: 'blue' ]
		raise: Error
		withMessage: 'The player does not have that card in posetion'
]

{ #category : #tests }
CardsTest >> testQ026TryToApplyACancellationCardOnANonValidObjectiveThenFails [

	| aDuplaGalacticaGame aLoadedDie aCardsCollection |
	aCardsCollection := OrderedCollection
		                    with: OverloadCard initializeNew
		                    with: CancellationCard initializeNew
		                    with: OverloadCard initializeNew
		                    with: CancellationCard initializeNew.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 2
			               with: 3
			               with: 4).
	aDuplaGalacticaGame := DuplaGalacticaGameProxy
		                       with: aColorsCollection
		                       and: self createBoard
		                       usingToThrow:
		                       (DiceShaker with:
			                        (OrderedCollection with: aLoadedDie))
		                       winningWhenReach: 1
		                       using: aCardsCollection.
	aDuplaGalacticaGame
		apply: (PlayerHand of: 'red' with: OverloadCard initializeNew)
		to: 'blue'.
	self
		should: [ 
			aDuplaGalacticaGame
				apply:
				(PlayerHand of: 'blue' with: CancellationCard initializeNew)
				to: 'blue' ]
		raise: Error
		withMessage: 'That is not a valid card objective'
]

{ #category : #tests }
CardsTest >> testQ029WhenPlayerPlaysARedoCardAndTheLastCardPlayedWasAPermanentCardThenCheckThatTheEffectWasRepeatedAndValidPlayersPositions [

	| aDuplaGalacticaGame aLoadedDie aCardsCollection |
	aCardsCollection := OrderedCollection
		                    with: OverloadCard initializeNew
		                    with: RedoCard initializeNew
		                    with: OverloadCard initializeNew
		                    with: RedoCard initializeNew.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 2
			               with: 3
			               with: 4).
	aDuplaGalacticaGame := DuplaGalacticaGameProxy
		                       with: aColorsCollection
		                       and: self createBoard
		                       usingToThrow:
		                       (DiceShaker with:
			                        (OrderedCollection with: aLoadedDie))
		                       winningWhenReach: 1
		                       using: aCardsCollection.
	aDuplaGalacticaGame
		apply: (PlayerHand of: 'red' with: OverloadCard initializeNew)
		to: 'blue'.
	aDuplaGalacticaGame movePlayer.
	aDuplaGalacticaGame movePlayer.
	aDuplaGalacticaGame
		apply: (PlayerHand of: 'blue' with: RedoCard initializeNew)
		to: 'red'.
	aDuplaGalacticaGame movePlayer.
	aDuplaGalacticaGame movePlayer.
	self
		assert: aDuplaGalacticaGame playersBox
		equals: (OrderedCollection with: 3 with: 3)
]

{ #category : #tests }
CardsTest >> testQ030WhenPlayerPlaysARedoCardAndTheLastCardPlayedWasACancellationCardThenCheckThatTheEffectWasRepeated [

	| aDuplaGalacticaGame aLoadedDie aCardsCollection |
	aCardsCollection := OrderedCollection
		                    with: OverloadCard initializeNew
		                    with: RedoCard initializeNew
		                    with: CancellationCard initializeNew
		                    with: OverloadCard initializeNew
		                    with: RedoCard initializeNew
		                    with: CancellationCard initializeNew.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 2
			               with: 3
			               with: 4).
	aDuplaGalacticaGame := DuplaGalacticaGameProxy
		                       with: aColorsCollection
		                       and: self createBoard
		                       usingToThrow:
		                       (DiceShaker with:
			                        (OrderedCollection with: aLoadedDie))
		                       winningWhenReach: 1
		                       using: aCardsCollection.
	aDuplaGalacticaGame
		apply: (PlayerHand of: 'red' with: OverloadCard initializeNew)
		to: 'blue'.
	aDuplaGalacticaGame movePlayer.
	aDuplaGalacticaGame
		apply: (PlayerHand of: 'blue' with: OverloadCard initializeNew)
		to: 'red'.
	aDuplaGalacticaGame movePlayer.
	aDuplaGalacticaGame
		apply: (PlayerHand of: 'blue' with: CancellationCard initializeNew)
		to: (PlayerHand of: 'blue' with: OverloadCard initializeNew).
	aDuplaGalacticaGame
		apply: (PlayerHand of: 'red' with: RedoCard initializeNew)
		to: (PlayerHand of: 'red' with: OverloadCard initializeNew).
	aDuplaGalacticaGame movePlayer.
	aDuplaGalacticaGame movePlayer.
	self
		assert: aDuplaGalacticaGame playersBox
		equals: (OrderedCollection with: 5 with: 5)
]

{ #category : #tests }
CardsTest >> testQ033WhenPlayerPlaysARedoCardAndLastCardPlayedWasARedoCardThatRepeatedTheEffectOfAPermanentCardThenRepeatAgainThatEffectAndValidPlayersPositions [

	| aDuplaGalacticaGame aLoadedDie aCardsCollection |
	aCardsCollection := OrderedCollection
		                    with: AccelerationCard initializeNew
		                    with: RedoCard initializeNew
		                    with: AccelerationCard initializeNew
		                    with: RedoCard initializeNew.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 2
			               with: 3
			               with: 3).
	aDuplaGalacticaGame := DuplaGalacticaGameProxy
		                       with: aColorsCollection
		                       and: self createBoard
		                       usingToThrow:
		                       (DiceShaker with:
			                        (OrderedCollection with: aLoadedDie))
		                       winningWhenReach: 1
		                       using: aCardsCollection.
	aDuplaGalacticaGame
		apply: (PlayerHand of: 'red' with: AccelerationCard initializeNew)
		to: EveryPlayer initializeNew players.
	aDuplaGalacticaGame movePlayer.
	aDuplaGalacticaGame movePlayer.
	aDuplaGalacticaGame
		apply: (PlayerHand of: 'red' with: RedoCard initializeNew)
		to: EveryPlayer initializeNew players.
	aDuplaGalacticaGame
		apply: (PlayerHand of: 'blue' with: RedoCard initializeNew)
		to: EveryPlayer initializeNew players.
	aDuplaGalacticaGame movePlayer.
	aDuplaGalacticaGame movePlayer.
	self
		assert: aDuplaGalacticaGame playersBox
		equals: (OrderedCollection with: 9 with: 10)
]

{ #category : #tests }
CardsTest >> testQ034WhenPlayerPlaysARepeatCardAndLastBoxInvokedWasASpeedUpBoxThenCheckThatThisEffectWasRepeatedAndValidPlayersPositions [

	| aDuplaGalacticaGame aLoadedDie aCardsCollection aBoxesCollection aBoard |
	aCardsCollection := (ObjectCreator use: (OrderedCollection with:
			                      (ObjectProbability
				                       using: RepeatCard initializeNew
				                       withChanceOf: 100))) create: 4.
	aBoxesCollection := (ObjectCreator use: (OrderedCollection with:
			                      (ObjectProbability
				                       using: SpeedUpBox initializeNew
				                       withChanceOf: 100))) create: 10.
	aBoard := Board
		          with: aBoxesCollection
		          measure: (ParsecMeasure worth: 100).
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 2
			               with: 3
			               with: 4).
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
	aDuplaGalacticaGame
		apply: (PlayerHand of: 'red' with: RepeatCard initializeNew)
		to: 'red'.
	self
		assert: aDuplaGalacticaGame playersBox
		equals: (OrderedCollection with: 10 with: 7)
]

{ #category : #tests }
CardsTest >> testQ035WhenPlayerPlaysARepeatCardAndLastBoxInvokedWasAWormHoleBoxThenCheckThatThisEffectWasRepeatedAndValidPlayersPositions [

	| aDuplaGalacticaGame aLoadedDie aCardsCollection aBoxesCollection aBoard |
	aCardsCollection := (ObjectCreator use: (OrderedCollection with:
			                      (ObjectProbability
				                       using: RepeatCard initializeNew
				                       withChanceOf: 100))) create: 4.
	aBoxesCollection := (ObjectCreator use: (OrderedCollection with:
			                      (ObjectProbability
				                       using: WormHoleBox initializeNew
				                       withChanceOf: 100))) create: 10.
	aBoard := Board
		          with: aBoxesCollection
		          measure: (ParsecMeasure worth: 100).
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 8
			               with: 9
			               with: 7
			               with: 6).
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
	aDuplaGalacticaGame
		apply: (PlayerHand of: 'red' with: RepeatCard initializeNew)
		to: 'blue'.
	self
		assert: aDuplaGalacticaGame playersBox
		equals: (OrderedCollection with: 5 with: 2)
]

{ #category : #tests }
CardsTest >> testQ036WhenPlayerPlaysARepeatCardAndLastBoxInvokedWasAMoonWalkBoxThenCheckThatThisEffectWasRepeatedAndValidPlayersPositions [

	| aDuplaGalacticaGame aLoadedDie aCardsCollection aBoxesCollection aBoard |
	aCardsCollection := (ObjectCreator use: (OrderedCollection with:
			                      (ObjectProbability
				                       using: RepeatCard initializeNew
				                       withChanceOf: 100))) create: 4.
	aBoxesCollection := (ObjectCreator use: (OrderedCollection with:
			                      (ObjectProbability
				                       using: (MoonWalkBox with: -2)
				                       withChanceOf: 100))) create: 10.
	aBoard := Board
		          with: aBoxesCollection
		          measure: (ParsecMeasure worth: 100).
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 4
			               with: 5
			               with: 3
			               with: 4).
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
	aDuplaGalacticaGame
		apply: (PlayerHand of: 'red' with: RepeatCard initializeNew)
		to: 'red'.
	self
		assert: aDuplaGalacticaGame playersBox
		equals: (OrderedCollection with: 3 with: 4)
]

{ #category : #tests }
CardsTest >> testQ038WhenPlayerPlaysARepeatCardAndLastBoxInvokedWasAHyperJumpBoxThenCheckThatThisEffectWasRepeatedAndValidPlayersPositions [

	| aDuplaGalacticaGame aLoadedDie aCardsCollection aBoxesCollection aBoard |
	aCardsCollection := (ObjectCreator use: (OrderedCollection with:
			                      (ObjectProbability
				                       using: RepeatCard initializeNew
				                       withChanceOf: 100))) create: 4.
	aBoxesCollection := (ObjectCreator use:
		                     (OrderedCollection with: (ObjectProbability
				                       using:
					                       (HyperJumpBox with: (OrderedCollection
							                         with: (ParsecMeasure worth: 40)
							                         with: (ParsecMeasure worth: 20)))
				                       withChanceOf: 100))) create: 10.
	aBoard := Board
		          with: aBoxesCollection
		          measure: (ParsecMeasure worth: 100).
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 2
			               with: 3
			               with: 4).
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
	aDuplaGalacticaGame
		apply: (PlayerHand of: 'red' with: RepeatCard initializeNew)
		to: 'red'.
	self
		assert: aDuplaGalacticaGame playersBox
		equals: (OrderedCollection with: 8 with: 7)
]

{ #category : #tests }
CardsTest >> testQ045WhenPlayerPlaysARedoCardAndTheLastCardPlayedWasARepeatCardThenCheckThatTheEffectWasRepeatedAndValidPlayersPositions [

	| aDuplaGalacticaGame aLoadedDie aCardsCollection aBoxesCollection aBoard |
	aCardsCollection := OrderedCollection
		                    with: RepeatCard initializeNew
		                    with: RedoCard initializeNew
		                    with: RepeatCard initializeNew
		                    with: RedoCard initializeNew.
	aBoxesCollection := (ObjectCreator use: (OrderedCollection with:
			                      (ObjectProbability
				                       using: SpeedUpBox initializeNew
				                       withChanceOf: 100))) create: 10.
	aBoard := Board
		          with: aBoxesCollection
		          measure: (ParsecMeasure worth: 100).
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 2
			               with: 3
			               with: 4).
	aDuplaGalacticaGame := DuplaGalacticaGameProxy
		                       with: aColorsCollection
		                       and: aBoard
		                       usingToThrow:
		                       (DiceShaker with:
			                        (OrderedCollection with: aLoadedDie))
		                       winningWhenReach: 1
		                       using: aCardsCollection.
	aDuplaGalacticaGame movePlayer.
	aDuplaGalacticaGame
		apply: (PlayerHand of: 'red' with: RepeatCard initializeNew)
		to: 'red'.
	aDuplaGalacticaGame
		apply: (PlayerHand of: 'blue' with: RedoCard initializeNew)
		to: 'blue'.
	self
		assert: aDuplaGalacticaGame playersBox
		equals: (OrderedCollection with: 10 with: 5)
]

{ #category : #tests }
CardsTest >> testQ048WhenPlayerTriesToPlayAnOverloadCardOnAnInvalidObjectiveThenFails [

	| aDuplaGalacticaGame aLoadedDie aCardsCollection |
	aCardsCollection := (ObjectCreator use: (OrderedCollection with:
			                      (ObjectProbability
				                       using: OverloadCard initializeNew
				                       withChanceOf: 100))) create: 4.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 2
			               with: 3
			               with: 4).
	aDuplaGalacticaGame := DuplaGalacticaGameProxy
		                       with: aColorsCollection
		                       and: self createBoard
		                       usingToThrow:
		                       (DiceShaker with:
			                        (OrderedCollection with: aLoadedDie))
		                       winningWhenReach: 1
		                       using: aCardsCollection.
	self
		should: [ 
			aDuplaGalacticaGame
				apply: (PlayerHand of: 'red' with: OverloadCard initializeNew)
				to: (PlayerHand of: 'blue' with: OverloadCard initializeNew) ]
		raise: Error
		withMessage: 'That is not a valid player objective'
]

{ #category : #tests }
CardsTest >> testQ050WhenPlayerTriesToPlayASpeedCardOnAnInvalidObjectiveThenFails [

	| aDuplaGalacticaGame aLoadedDie aCardsCollection |
	aCardsCollection := (ObjectCreator use: (OrderedCollection with:
			                      (ObjectProbability
				                       using: SpeedCard initializeNew
				                       withChanceOf: 100))) create: 4.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 2
			               with: 3
			               with: 4).
	aDuplaGalacticaGame := DuplaGalacticaGameProxy
		                       with: aColorsCollection
		                       and: self createBoard
		                       usingToThrow:
		                       (DiceShaker with:
			                        (OrderedCollection with: aLoadedDie))
		                       winningWhenReach: 1
		                       using: aCardsCollection.
	self
		should: [ 
			aDuplaGalacticaGame
				apply: (PlayerHand of: 'red' with: SpeedCard initializeNew)
				to: (PlayerHand of: 'blue' with: SpeedCard initializeNew) ]
		raise: Error
		withMessage: 'That is not a valid player objective'
]

{ #category : #tests }
CardsTest >> testQ051WhenPlayerTriesToPlayARepeatCardOnAnInvalidObjectiveThenFails [

	| aDuplaGalacticaGame aLoadedDie aCardsCollection |
	aCardsCollection := (ObjectCreator use: (OrderedCollection with:
			                      (ObjectProbability
				                       using: RepeatCard initializeNew
				                       withChanceOf: 100))) create: 4.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 2
			               with: 3
			               with: 4).
	aDuplaGalacticaGame := DuplaGalacticaGameProxy
		                       with: aColorsCollection
		                       and: self createBoard
		                       usingToThrow:
		                       (DiceShaker with:
			                        (OrderedCollection with: aLoadedDie))
		                       winningWhenReach: 1
		                       using: aCardsCollection.
	self
		should: [ 
			aDuplaGalacticaGame
				apply: (PlayerHand of: 'red' with: RepeatCard initializeNew)
				to: (PlayerHand of: 'blue' with: RepeatCard initializeNew) ]
		raise: Error
		withMessage: 'That is not a valid player objective'
]

{ #category : #tests }
CardsTest >> testQ052WhenPlayerTriesToPlayARedoCardAndNoOtherCardsWerePlayedBeforeThenFails [

	| aDuplaGalacticaGame aLoadedDie aCardsCollection |
	aCardsCollection := (ObjectCreator use: (OrderedCollection with:
			                      (ObjectProbability
				                       using: RedoCard initializeNew
				                       withChanceOf: 100))) create: 4.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 2
			               with: 3
			               with: 4).
	aDuplaGalacticaGame := DuplaGalacticaGameProxy
		                       with: aColorsCollection
		                       and: self createBoard
		                       usingToThrow:
		                       (DiceShaker with:
			                        (OrderedCollection with: aLoadedDie))
		                       winningWhenReach: 1
		                       using: aCardsCollection.
	self
		should: [ 
			aDuplaGalacticaGame
				apply: (PlayerHand of: 'blue' with: RedoCard initializeNew)
				to: 'red' ]
		raise: Error
		withMessage:
		'Redo card cannot be played because there are no cards that have been played before'
]

{ #category : #tests }
CardsTest >> testQ053WhenPlayerPlaysASpeedBoostCardOnAnOverloadCardThenCheckThatTheOverloadCardEffectWasDuplicatedAndValidPlayersPositions [

	| aDuplaGalacticaGame aLoadedDie aCardsCollection |
	aCardsCollection := OrderedCollection
		                    with: OverloadCard initializeNew
		                    with: SpeedBoostCard initializeNew
		                    with: OverloadCard initializeNew
		                    with: SpeedBoostCard initializeNew.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 2
			               with: 3
			               with: 4
			               with: 5).
	aDuplaGalacticaGame := DuplaGalacticaGameProxy
		                       with: aColorsCollection
		                       and: self createBoard
		                       usingToThrow:
		                       (DiceShaker with:
			                        (OrderedCollection with: aLoadedDie))
		                       winningWhenReach: 1
		                       using: aCardsCollection.
	aDuplaGalacticaGame
		apply: (PlayerHand of: 'red' with: OverloadCard initializeNew)
		to: 'blue'.
	aDuplaGalacticaGame movePlayer.
	aDuplaGalacticaGame movePlayer.
	aDuplaGalacticaGame
		apply: (PlayerHand of: 'red' with: SpeedBoostCard initializeNew)
		to: (PlayerHand of: 'blue' with: OverloadCard initializeNew).
	aDuplaGalacticaGame movePlayer.
	aDuplaGalacticaGame movePlayer.
	self
		assert: aDuplaGalacticaGame playersBox
		equals: (OrderedCollection with: 7 with: 3)
]

{ #category : #tests }
CardsTest >> testQ054WhenPlayerPlaysASpeedBoostCardOnASpeedCardThenCheckThatTheSpeedCardEffectWasDuplicatedAndValidPlayersPositions [

	| aDuplaGalacticaGame aLoadedDie aCardsCollection |
	aCardsCollection := OrderedCollection
		                    with: SpeedCard initializeNew
		                    with: SpeedBoostCard initializeNew
		                    with: SpeedCard initializeNew
		                    with: SpeedBoostCard initializeNew.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 2
			               with: 3
			               with: 4).
	aDuplaGalacticaGame := DuplaGalacticaGameProxy
		                       with: aColorsCollection
		                       and: self createBoard
		                       usingToThrow:
		                       (DiceShaker with:
			                        (OrderedCollection with: aLoadedDie))
		                       winningWhenReach: 1
		                       using: aCardsCollection.
	aDuplaGalacticaGame
		apply: (PlayerHand of: 'red' with: SpeedCard initializeNew)
		to: 'red'.
	aDuplaGalacticaGame movePlayer.
	aDuplaGalacticaGame movePlayer.
	aDuplaGalacticaGame
		apply: (PlayerHand of: 'red' with: SpeedBoostCard initializeNew)
		to: (PlayerHand of: 'red' with: SpeedCard initializeNew).
	aDuplaGalacticaGame movePlayer.
	aDuplaGalacticaGame movePlayer.
	self
		assert: aDuplaGalacticaGame playersBox
		equals: (OrderedCollection with: 8 with: 7)
]

{ #category : #tests }
CardsTest >> testQ055WhenPlayerPlaysASpeedBoostCardOnAnAccelerationCardThenCheckThatTheAccelerationCardEffectWasDuplicatedAndValidPlayersPositions [

	| aDuplaGalacticaGame aLoadedDie aCardsCollection |
	aCardsCollection := OrderedCollection
		                    with: AccelerationCard initializeNew
		                    with: SpeedBoostCard initializeNew
		                    with: AccelerationCard initializeNew
		                    with: SpeedBoostCard initializeNew.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 2
			               with: 3
			               with: 4).
	aDuplaGalacticaGame := DuplaGalacticaGameProxy
		                       with: aColorsCollection
		                       and: self createBoard
		                       usingToThrow:
		                       (DiceShaker with:
			                        (OrderedCollection with: aLoadedDie))
		                       winningWhenReach: 1
		                       using: aCardsCollection.
	aDuplaGalacticaGame
		apply: (PlayerHand of: 'red' with: AccelerationCard initializeNew)
		to: EveryPlayer initializeNew players.
	aDuplaGalacticaGame movePlayer.
	aDuplaGalacticaGame movePlayer.
	aDuplaGalacticaGame
		apply: (PlayerHand of: 'red' with: SpeedBoostCard initializeNew)
		to: (PlayerHand
				 of: EveryPlayer initializeNew players
				 with: AccelerationCard initializeNew).
	aDuplaGalacticaGame movePlayer.
	aDuplaGalacticaGame movePlayer.
	self
		assert: aDuplaGalacticaGame playersBox
		equals: (OrderedCollection with: 8 with: 10)
]

{ #category : #tests }
CardsTest >> testQ056WhenPlayerPlaysACancellationCardOnABoostedPermanentCardThenCheckThatTheEffectIsNoMoreAppliedAndValidPlayersPositions [

	| aDuplaGalacticaGame aLoadedDie aCardsCollection |
	aCardsCollection := OrderedCollection
		                    with: OverloadCard initializeNew
		                    with: SpeedBoostCard initializeNew
		                    with: CancellationCard initializeNew
		                    with: OverloadCard initializeNew
		                    with: SpeedBoostCard initializeNew
		                    with: CancellationCard initializeNew.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 2
			               with: 5
			               with: 1
			               with: 4).
	aDuplaGalacticaGame := DuplaGalacticaGameProxy
		                       with: aColorsCollection
		                       and: self createBoard
		                       usingToThrow:
		                       (DiceShaker with:
			                        (OrderedCollection with: aLoadedDie))
		                       winningWhenReach: 1
		                       using: aCardsCollection.
	aDuplaGalacticaGame
		apply: (PlayerHand of: 'red' with: OverloadCard initializeNew)
		to: 'blue'.
	aDuplaGalacticaGame
		apply: (PlayerHand of: 'red' with: SpeedBoostCard initializeNew)
		to: (PlayerHand of: 'blue' with: OverloadCard initializeNew).
	aDuplaGalacticaGame movePlayer.
	aDuplaGalacticaGame movePlayer.
	aDuplaGalacticaGame
		apply: (PlayerHand of: 'blue' with: CancellationCard initializeNew)
		to: (PlayerHand of: 'blue' with: OverloadCard initializeNew).
	aDuplaGalacticaGame movePlayer.
	aDuplaGalacticaGame movePlayer.
	self
		assert: aDuplaGalacticaGame playersBox
		equals: (OrderedCollection with: 4 with: 6)
]

{ #category : #tests }
CardsTest >> testQ058WhenPlayerTriesToPlayAnAccelerationCardOnAnInvalidObjectiveThenFails [

	| aDuplaGalacticaGame aLoadedDie aCardsCollection |
	aCardsCollection := (ObjectCreator use:
		                     (OrderedCollection with: (ObjectProbability
				                       using: AccelerationCard initializeNew
				                       withChanceOf: 100))) create: 4.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 2
			               with: 5
			               with: 1
			               with: 4).
	aDuplaGalacticaGame := DuplaGalacticaGameProxy
		                       with: aColorsCollection
		                       and: self createBoard
		                       usingToThrow:
		                       (DiceShaker with:
			                        (OrderedCollection with: aLoadedDie))
		                       winningWhenReach: 1
		                       using: aCardsCollection.
	self
		should: [ 
			aDuplaGalacticaGame
				apply: (PlayerHand of: 'red' with: AccelerationCard initializeNew)
				to: 'blue' ]
		raise: Error
		withMessage: 'That is not a valid objective'
]

{ #category : #tests }
CardsTest >> testQ059WhenPlayerTriesToPlayASpeedBoostCardOnANonExistentCardThenFails [

	| aDuplaGalacticaGame aLoadedDie aCardsCollection |
	aCardsCollection := OrderedCollection
		                    with: OverloadCard initializeNew
		                    with: SpeedBoostCard initializeNew
		                    with: OverloadCard initializeNew
		                    with: SpeedBoostCard initializeNew.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 2
			               with: 3
			               with: 4).
	aDuplaGalacticaGame := DuplaGalacticaGameProxy
		                       with: aColorsCollection
		                       and: self createBoard
		                       usingToThrow:
		                       (DiceShaker with:
			                        (OrderedCollection with: aLoadedDie))
		                       winningWhenReach: 1
		                       using: aCardsCollection.
	aDuplaGalacticaGame
		apply: (PlayerHand of: 'red' with: OverloadCard initializeNew)
		to: 'blue'.
	self
		should: [ 
			aDuplaGalacticaGame
				apply: (PlayerHand of: 'red' with: SpeedBoostCard initializeNew)
				to: (PlayerHand of: 'blue' with: SpeedCard initializeNew) ]
		raise: Error
		withMessage:
		'There are no that type of cards activate in this player'
]

{ #category : #tests }
CardsTest >> testQ060WhenPlayerTriesToPlayASpeedBoostCardAndThereAreNoActivePermanentCardsThenFails [

	| aDuplaGalacticaGame aLoadedDie aCardsCollection |
	aCardsCollection := (ObjectCreator use:
		                     (OrderedCollection with: (ObjectProbability
				                       using: SpeedBoostCard initializeNew
				                       withChanceOf: 100))) create: 4.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 2
			               with: 3
			               with: 4).
	aDuplaGalacticaGame := DuplaGalacticaGameProxy
		                       with: aColorsCollection
		                       and: self createBoard
		                       usingToThrow:
		                       (DiceShaker with:
			                        (OrderedCollection with: aLoadedDie))
		                       winningWhenReach: 1
		                       using: aCardsCollection.
	self
		should: [ 
			aDuplaGalacticaGame
				apply: (PlayerHand of: 'red' with: SpeedBoostCard initializeNew)
				to: (PlayerHand of: 'red' with: SpeedCard initializeNew) ]
		raise: Error
		withMessage: 'There are no permanent cards'
]

{ #category : #tests }
CardsTest >> testQ061WhenPlayerPlaysAReversePolarityCardOnASpeedUpBoxThenCheckThatTheBoxAffectOtherPlayersAndValidPlayersPositions [

	| aDuplaGalacticaGame aLoadedDie aCardsCollection aBoxesCollection aBoard |
	aCardsCollection := (ObjectCreator use:
		                     (OrderedCollection with: (ObjectProbability
				                       using: ReversePolarityCard initializeNew
				                       withChanceOf: 100))) create: 4.
	aBoxesCollection := (ObjectCreator use: (OrderedCollection with:
			                      (ObjectProbability
				                       using: SpeedUpBox initializeNew
				                       withChanceOf: 100))) create: 10.
	aBoard := Board
		          with: aBoxesCollection
		          measure: (ParsecMeasure worth: 100).
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 1
			               with: 3
			               with: 4).
	aDuplaGalacticaGame := DuplaGalacticaGameProxy
		                       with: aColorsCollection
		                       and: aBoard
		                       usingToThrow:
		                       (DiceShaker with:
			                        (OrderedCollection with: aLoadedDie))
		                       winningWhenReach: 1
		                       using: aCardsCollection.
	aDuplaGalacticaGame
		apply:
		(PlayerHand of: 'red' with: ReversePolarityCard initializeNew)
		to: 2.
	aDuplaGalacticaGame movePlayer.
	aDuplaGalacticaGame movePlayer.
	self
		assert: aDuplaGalacticaGame playersBox
		equals: (OrderedCollection with: 2 with: 10)
]

{ #category : #tests }
CardsTest >> testQ062WhenPlayerPlaysAReversePolarityCardOnAWormHoleBoxThenCheckThatTheBoxAffectOtherPlayersAndValidPlayersPositions [

	| aDuplaGalacticaGame aLoadedDie aCardsCollection aBoxesCollection aBoard |
	aCardsCollection := (ObjectCreator use:
		                     (OrderedCollection with: (ObjectProbability
				                       using: ReversePolarityCard initializeNew
				                       withChanceOf: 100))) create: 4.
	aBoxesCollection := (ObjectCreator use: (OrderedCollection with:
			                      (ObjectProbability
				                       using: WormHoleBox initializeNew
				                       withChanceOf: 100))) create: 10.
	aBoard := Board
		          with: aBoxesCollection
		          measure: (ParsecMeasure worth: 100).
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 7
			               with: 8
			               with: 3
			               with: 4).
	aDuplaGalacticaGame := DuplaGalacticaGameProxy
		                       with: aColorsCollection
		                       and: aBoard
		                       usingToThrow:
		                       (DiceShaker with:
			                        (OrderedCollection with: aLoadedDie))
		                       winningWhenReach: 1
		                       using: aCardsCollection.
	aDuplaGalacticaGame
		apply:
		(PlayerHand of: 'red' with: ReversePolarityCard initializeNew)
		to: 9.
	aDuplaGalacticaGame movePlayer.
	aDuplaGalacticaGame movePlayer.
	self
		assert: aDuplaGalacticaGame playersBox
		equals: (OrderedCollection with: 1 with: 9)
]

{ #category : #tests }
CardsTest >> testQ063WhenPlayerPlaysAReversePolarityCardOnAMoonWalkBoxThenCheckThatTheBoxAffectTheCurrentPlayersAndValidPlayersPositions [

	| aDuplaGalacticaGame aLoadedDie aCardsCollection aBoxesCollection aBoard |
	aCardsCollection := (ObjectCreator use:
		                     (OrderedCollection with: (ObjectProbability
				                       using: ReversePolarityCard initializeNew
				                       withChanceOf: 100))) create: 4.
	aBoxesCollection := (ObjectCreator use: (OrderedCollection with:
			                      (ObjectProbability
				                       using: (MoonWalkBox with: -2)
				                       withChanceOf: 100))) create: 10.
	aBoard := Board
		          with: aBoxesCollection
		          measure: (ParsecMeasure worth: 100).
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 5
			               with: 4
			               with: 3
			               with: 2).
	aDuplaGalacticaGame := DuplaGalacticaGameProxy
		                       with: aColorsCollection
		                       and: aBoard
		                       usingToThrow:
		                       (DiceShaker with:
			                        (OrderedCollection with: aLoadedDie))
		                       winningWhenReach: 1
		                       using: aCardsCollection.
	aDuplaGalacticaGame
		apply:
		(PlayerHand of: 'red' with: ReversePolarityCard initializeNew)
		to: 5.
	aDuplaGalacticaGame movePlayer.
	aDuplaGalacticaGame movePlayer.
	self
		assert: aDuplaGalacticaGame playersBox
		equals: (OrderedCollection with: 6 with: 3)
]

{ #category : #tests }
CardsTest >> testQ064WhenPlayerPlaysAReversePolarityCardOnAnAtomicBombBoxThenCheckThatTheBoxDoesNotAffectAnyoneAndValidPlayersPositions [

	| aDuplaGalacticaGame aLoadedDie aCardsCollection aBoxesCollection aBoard |
	aCardsCollection := (ObjectCreator use:
		                     (OrderedCollection with: (ObjectProbability
				                       using: ReversePolarityCard initializeNew
				                       withChanceOf: 100))) create: 4.
	aBoxesCollection := (ObjectCreator use:
		                     (OrderedCollection with: (ObjectProbability
				                       using: AtomicBombBox initializeNew
				                       withChanceOf: 100))) create: 10.
	aBoard := Board
		          with: aBoxesCollection
		          measure: (ParsecMeasure worth: 100).
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 5
			               with: 4
			               with: 3
			               with: 2).
	aDuplaGalacticaGame := DuplaGalacticaGameProxy
		                       with: aColorsCollection
		                       and: aBoard
		                       usingToThrow:
		                       (DiceShaker with:
			                        (OrderedCollection with: aLoadedDie))
		                       winningWhenReach: 1
		                       using: aCardsCollection.
	aDuplaGalacticaGame
		apply:
		(PlayerHand of: 'red' with: ReversePolarityCard initializeNew)
		to: 5.
	aDuplaGalacticaGame movePlayer.
	aDuplaGalacticaGame movePlayer.
	self
		assert: aDuplaGalacticaGame playersBox
		equals: (OrderedCollection with: 1 with: 5)
]

{ #category : #tests }
CardsTest >> testQ065WhenPlayerPlaysAReversePolarityCardOnAHyperJumpBoxThenCheckThatTheBoxAffectOtherPlayersAndValidPlayersPositions [

	| aDuplaGalacticaGame aLoadedDie aCardsCollection aBoxesCollection aBoard |
	aCardsCollection := (ObjectCreator use:
		                     (OrderedCollection with: (ObjectProbability
				                       using: ReversePolarityCard initializeNew
				                       withChanceOf: 100))) create: 4.
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
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 2
			               with: 3
			               with: 4).
	aDuplaGalacticaGame := DuplaGalacticaGameProxy
		                       with: aColorsCollection
		                       and: aBoard
		                       usingToThrow:
		                       (DiceShaker with:
			                        (OrderedCollection with: aLoadedDie))
		                       winningWhenReach: 1
		                       using: aCardsCollection.
	aDuplaGalacticaGame
		apply:
		(PlayerHand of: 'red' with: ReversePolarityCard initializeNew)
		to: 3.
	aDuplaGalacticaGame movePlayer.
	aDuplaGalacticaGame movePlayer.
	self
		assert: aDuplaGalacticaGame playersBox
		equals: (OrderedCollection with: 10 with: 3)
]

{ #category : #tests }
CardsTest >> testQ066WhenPlayerPlaysAReversePolarityCardOnARandomCardBoxThenCheckThatTheBoxAffectOtherPlayersAndValidPlayersCardsInPosition [

	| aDuplaGalacticaGame aLoadedDie aCardsCollection aBoxesCollection aBoard |
	aCardsCollection := (ObjectCreator use:
		                     (OrderedCollection with: (ObjectProbability
				                       using: ReversePolarityCard initializeNew
				                       withChanceOf: 100))) create: 4.
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
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 2
			               with: 3
			               with: 4).
	aDuplaGalacticaGame := DuplaGalacticaGameProxy
		                       with: aColorsCollection
		                       and: aBoard
		                       usingToThrow:
		                       (DiceShaker with:
			                        (OrderedCollection with: aLoadedDie))
		                       winningWhenReach: 1
		                       using: aCardsCollection.
	aDuplaGalacticaGame
		apply:
		(PlayerHand of: 'red' with: ReversePolarityCard initializeNew)
		to: 3.
	aDuplaGalacticaGame movePlayer.
	aDuplaGalacticaGame movePlayer.
	self
		assert: aDuplaGalacticaGame playersCardInPosetion
		equals: (OrderedCollection with: 3 with: 2)
]

{ #category : #tests }
CardsTest >> testQ067WhenPlayerPlaysAReversePolarityCardOnANoEffectBoxThenCheckThatNoEffectsWereAppliedAndValidPlayersPositions [

	| aDuplaGalacticaGame aLoadedDie aCardsCollection aBoxesCollection aBoard |
	aCardsCollection := (ObjectCreator use:
		                     (OrderedCollection with: (ObjectProbability
				                       using: ReversePolarityCard initializeNew
				                       withChanceOf: 100))) create: 4.
	aBoxesCollection := (ObjectCreator use:
		                     (OrderedCollection with: (ObjectProbability
				                       using:
					                       (RandomCardBox with:
						                        (OrderedCollection with:
							                         (ObjectProbability
								                          using: NoEffectBox initializeNew
								                          withChanceOf: 100)))
				                       withChanceOf: 100))) create: 10.
	aBoard := Board
		          with: aBoxesCollection
		          measure: (ParsecMeasure worth: 100).
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 2
			               with: 3
			               with: 4).
	aDuplaGalacticaGame := DuplaGalacticaGameProxy
		                       with: aColorsCollection
		                       and: aBoard
		                       usingToThrow:
		                       (DiceShaker with:
			                        (OrderedCollection with: aLoadedDie))
		                       winningWhenReach: 1
		                       using: aCardsCollection.
	aDuplaGalacticaGame
		apply:
		(PlayerHand of: 'red' with: ReversePolarityCard initializeNew)
		to: 3.
	aDuplaGalacticaGame movePlayer.
	aDuplaGalacticaGame movePlayer.
	self
		assert: aDuplaGalacticaGame playersBox
		equals: (OrderedCollection with: 2 with: 3)
]

{ #category : #tests }
CardsTest >> testQ068WhenPlayerTriesToPlayAReversePolarityCardOnAOutOfRangeBoxThenFails [

	| aDuplaGalacticaGame aLoadedDie aCardsCollection aBoxesCollection aBoard |
	aCardsCollection := (ObjectCreator use:
		                     (OrderedCollection with: (ObjectProbability
				                       using: ReversePolarityCard initializeNew
				                       withChanceOf: 100))) create: 4.
	aBoxesCollection := (ObjectCreator use: (OrderedCollection with:
			                      (ObjectProbability
				                       using: SpeedUpBox initializeNew
				                       withChanceOf: 100))) create: 10.
	aBoard := Board
		          with: aBoxesCollection
		          measure: (ParsecMeasure worth: 100).
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 2
			               with: 3
			               with: 4).
	aDuplaGalacticaGame := DuplaGalacticaGameProxy
		                       with: aColorsCollection
		                       and: aBoard
		                       usingToThrow:
		                       (DiceShaker with:
			                        (OrderedCollection with: aLoadedDie))
		                       winningWhenReach: 1
		                       using: aCardsCollection.
	self
		should: [ 
			aDuplaGalacticaGame
				apply:
				(PlayerHand of: 'red' with: ReversePolarityCard initializeNew)
				to: 11 ]
		raise: Error
		withMessage: 'That is not a valid box number'
]

{ #category : #tests }
CardsTest >> testQ069WhenPlayerPlaysASpeedBoostCardOnAReversePolarityCardThenCheckThatTheBoxPolarityHasChangedAgainThenValidPlayersPositions [

	| aDuplaGalacticaGame aLoadedDie aCardsCollection aBoxesCollection aBoard |
	aCardsCollection := OrderedCollection
		                    with: ReversePolarityCard initializeNew
		                    with: SpeedBoostCard initializeNew
		                    with: ReversePolarityCard initializeNew
		                    with: SpeedBoostCard initializeNew.
	aBoxesCollection := (ObjectCreator use: (OrderedCollection with:
			                      (ObjectProbability
				                       using: SpeedUpBox initializeNew
				                       withChanceOf: 100))) create: 10.
	aBoard := Board
		          with: aBoxesCollection
		          measure: (ParsecMeasure worth: 100).
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 2
			               with: 8
			               with: 3
			               with: 4).
	aDuplaGalacticaGame := DuplaGalacticaGameProxy
		                       with: aColorsCollection
		                       and: aBoard
		                       usingToThrow:
		                       (DiceShaker with:
			                        (OrderedCollection with: aLoadedDie))
		                       winningWhenReach: 1
		                       using: aCardsCollection.
	aDuplaGalacticaGame
		apply:
		(PlayerHand of: 'red' with: ReversePolarityCard initializeNew)
		to: 3.
	aDuplaGalacticaGame movePlayer.
	aDuplaGalacticaGame
		apply: (PlayerHand of: 'red' with: SpeedBoostCard initializeNew)
		to: (PlayerHand of: 3 with: ReversePolarityCard initializeNew).
	aDuplaGalacticaGame movePlayer.
	self
		assert: aDuplaGalacticaGame playersBox
		equals: (OrderedCollection with: 3 with: 7)
]

{ #category : #tests }
CardsTest >> testQ070WhenPlayerPlaysACancellationCardOnAReversePolarityCardThenCheckThatTheBoxPolarityHasChangedAgainAndValidPlayersPositions [

	| aDuplaGalacticaGame aLoadedDie aCardsCollection aBoxesCollection aBoard |
	aCardsCollection := OrderedCollection
		                    with: ReversePolarityCard initializeNew
		                    with: CancellationCard initializeNew
		                    with: ReversePolarityCard initializeNew
		                    with: CancellationCard initializeNew.
	aBoxesCollection := (ObjectCreator use: (OrderedCollection with:
			                      (ObjectProbability
				                       using: SpeedUpBox initializeNew
				                       withChanceOf: 100))) create: 10.
	aBoard := Board
		          with: aBoxesCollection
		          measure: (ParsecMeasure worth: 100).
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 2
			               with: 8
			               with: 3
			               with: 4).
	aDuplaGalacticaGame := DuplaGalacticaGameProxy
		                       with: aColorsCollection
		                       and: aBoard
		                       usingToThrow:
		                       (DiceShaker with:
			                        (OrderedCollection with: aLoadedDie))
		                       winningWhenReach: 1
		                       using: aCardsCollection.
	aDuplaGalacticaGame
		apply:
		(PlayerHand of: 'red' with: ReversePolarityCard initializeNew)
		to: 3.
	aDuplaGalacticaGame movePlayer.
	aDuplaGalacticaGame
		apply: (PlayerHand of: 'red' with: CancellationCard initializeNew)
		to: (PlayerHand of: 3 with: ReversePolarityCard initializeNew).
	aDuplaGalacticaGame movePlayer.
	self
		assert: aDuplaGalacticaGame playersBox
		equals: (OrderedCollection with: 3 with: 7)
]

{ #category : #tests }
CardsTest >> testQ071WhenPlayerPlaysARedoCardAndTheLastCardPlayedWasAReversePolarityCardThenCheckThatTheBoxPolarityHasChangedDueToTheRedoCardAndValidPlayersPositions [

	| aDuplaGalacticaGame aLoadedDie aCardsCollection aBoxesCollection aBoard |
	aCardsCollection := OrderedCollection
		                    with: ReversePolarityCard initializeNew
		                    with: RedoCard initializeNew
		                    with: ReversePolarityCard initializeNew
		                    with: RedoCard initializeNew.
	aBoxesCollection := (ObjectCreator use: (OrderedCollection with:
			                      (ObjectProbability
				                       using: SpeedUpBox initializeNew
				                       withChanceOf: 100))) create: 10.
	aBoard := Board
		          with: aBoxesCollection
		          measure: (ParsecMeasure worth: 100).
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 2
			               with: 1
			               with: 3
			               with: 4).
	aDuplaGalacticaGame := DuplaGalacticaGameProxy
		                       with: aColorsCollection
		                       and: aBoard
		                       usingToThrow:
		                       (DiceShaker with:
			                        (OrderedCollection with: aLoadedDie))
		                       winningWhenReach: 1
		                       using: aCardsCollection.
	aDuplaGalacticaGame
		apply:
		(PlayerHand of: 'red' with: ReversePolarityCard initializeNew)
		to: 3.
	aDuplaGalacticaGame
		apply:
		(PlayerHand of: 'red' with: RedoCard initializeNew)
		to: 6.
	aDuplaGalacticaGame movePlayer.
	aDuplaGalacticaGame movePlayer.
	self
		assert: aDuplaGalacticaGame playersBox
		equals: (OrderedCollection with: 7 with: 6)
]

{ #category : #tests }
CardsTest >> testQ072WhenPlayerPlaysARepeatCardAndTheLastBoxInvokedHasBeenAffectedByAReversePolarityCardThenCheckThatTheEffectReversedWasRepeatedAndValidPlayersPositions [

	| aDuplaGalacticaGame aLoadedDie aCardsCollection aBoxesCollection aBoard |
	aCardsCollection := OrderedCollection
		                    with: ReversePolarityCard initializeNew
		                    with: RepeatCard initializeNew
		                    with: ReversePolarityCard initializeNew
		                    with: RepeatCard initializeNew.
	aBoxesCollection := (ObjectCreator use: (OrderedCollection with:
			                      (ObjectProbability
				                       using: SpeedUpBox initializeNew
				                       withChanceOf: 100))) create: 10.
	aBoard := Board
		          with: aBoxesCollection
		          measure: (ParsecMeasure worth: 100).
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 2
			               with: 1
			               with: 3
			               with: 4).
	aDuplaGalacticaGame := DuplaGalacticaGameProxy
		                       with: aColorsCollection
		                       and: aBoard
		                       usingToThrow:
		                       (DiceShaker with:
			                        (OrderedCollection with: aLoadedDie))
		                       winningWhenReach: 1
		                       using: aCardsCollection.
	aDuplaGalacticaGame
		apply:
		(PlayerHand of: 'red' with: ReversePolarityCard initializeNew)
		to: 3.
	aDuplaGalacticaGame movePlayer.
	aDuplaGalacticaGame
		apply: (PlayerHand of: 'red' with: RepeatCard initializeNew)
		to: 'blue'.
	self
		assert: aDuplaGalacticaGame playersBox
		equals: (OrderedCollection with: 7 with: 5)
]

{ #category : #tests }
CardsTest >> testQ073WhenPlayerPlaysTwoReversePolarityCardsOnTheSameBoxThenCheckThatTheEffectWasNotReversedAndValidPlayersPositions [

	| aDuplaGalacticaGame aLoadedDie aCardsCollection aBoxesCollection aBoard |
	aCardsCollection := (ObjectCreator use:
		                     (OrderedCollection with: (ObjectProbability
				                       using: ReversePolarityCard initializeNew
				                       withChanceOf: 100))) create: 4.
	aBoxesCollection := (ObjectCreator use: (OrderedCollection with:
			                      (ObjectProbability
				                       using: SpeedUpBox initializeNew
				                       withChanceOf: 100))) create: 10.
	aBoard := Board
		          with: aBoxesCollection
		          measure: (ParsecMeasure worth: 100).
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 2
			               with: 1
			               with: 3
			               with: 4).
	aDuplaGalacticaGame := DuplaGalacticaGameProxy
		                       with: aColorsCollection
		                       and: aBoard
		                       usingToThrow:
		                       (DiceShaker with:
			                        (OrderedCollection with: aLoadedDie))
		                       winningWhenReach: 1
		                       using: aCardsCollection.
	aDuplaGalacticaGame
		apply:
		(PlayerHand of: 'red' with: ReversePolarityCard initializeNew)
		to: 3.
	aDuplaGalacticaGame
		apply:
		(PlayerHand of: 'red' with: ReversePolarityCard initializeNew)
		to: 3.
	aDuplaGalacticaGame movePlayer.
	self
		assert: aDuplaGalacticaGame playersBox
		equals: (OrderedCollection with: 7 with: 1)
]
