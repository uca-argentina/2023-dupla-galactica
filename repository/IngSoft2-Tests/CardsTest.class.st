Class {
	#name : #CardsTest,
	#superclass : #TestCase,
	#instVars : [
		'aColorCollection'
	],
	#category : #'IngSoft2-Tests'
}

{ #category : #Board }
CardsTest >> createBoard [

	| boxes |
	boxes := (Creator use: (OrderedCollection with:
			           (ObjectProbability
				            using: NoEffectBox initializeNew
				            withChanceOf: 100))) create: 10.
	^ Board with: boxes measure: (Parsec worth: 100)
]

{ #category : #running }
CardsTest >> setUp [

	super setUp.

	aColorCollection := OrderedCollection with: 'red' with: 'blue'.
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

	| aGame aLoadedDie cards |
	cards := (Creator use: (OrderedCollection with:
			           (ObjectProbability
				            using: OverloadCard initializeNew
				            withChanceOf: 100))) create: 4.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 2
			               with: 3
			               with: 4).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: self createBoard
		         usingToThrow:
		         (DiceShaker with: (OrderedCollection with: aLoadedDie))
		         winningWhenReach: 1
		         using: cards.
	aGame
		apply: (Hand of: 'red' with: OverloadCard initializeNew)
		to: 'blue'.
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersBox
		equals: (OrderedCollection with: 2 with: 1)
]

{ #category : #tests }
CardsTest >> testQ002WhenPlayerPlaysAnOverloadCardThenCheckThatTheNegativeEffectIsPermanentAndValidPlayersPositions [

	| aGame aLoadedDie cards |
	cards := (Creator use: (OrderedCollection with:
			           (ObjectProbability
				            using: OverloadCard initializeNew
				            withChanceOf: 100))) create: 4.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 2
			               with: 3
			               with: 4).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: self createBoard
		         usingToThrow:
		         (DiceShaker with: (OrderedCollection with: aLoadedDie))
		         winningWhenReach: 1
		         using: cards.
	aGame
		apply: (Hand of: 'red' with: OverloadCard initializeNew)
		to: 'blue'.
	aGame movePlayer.
	aGame movePlayer.
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersBox
		equals: (OrderedCollection with: 5 with: 3)
]

{ #category : #tests }
CardsTest >> testQ003WhenPlayerPlaysAnOverloadCardThenCheckTheNegativeEffectMakesPlayerGoBackwardLapsAndValidPlayersPositions [

	| aGame aLoadedDie cards |
	cards := (Creator use: (OrderedCollection with:
			           (ObjectProbability
				            using: OverloadCard initializeNew
				            withChanceOf: 100))) create: 4.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 10
			               with: 3
			               with: 4).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: self createBoard
		         usingToThrow:
		         (DiceShaker with: (OrderedCollection with: aLoadedDie))
		         winningWhenReach: 1
		         using: cards.
	aGame
		apply: (Hand of: 'red' with: OverloadCard initializeNew)
		to: 'blue'.
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersBox
		equals: (OrderedCollection with: 2 with: 9)
]

{ #category : #tests }
CardsTest >> testQ004WhenPlayerPlaysAnOverloadCardThenCheckTheNegativeEffectCannotSendPlayerToAnOutOfRangeBoardPositionAndValidPlayersPositions [

	| aGame aLoadedDie cards |
	cards := (Creator use: (OrderedCollection with:
			           (ObjectProbability
				            using: OverloadCard initializeNew
				            withChanceOf: 100))) create: 4.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 1
			               with: 3
			               with: 4).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: self createBoard
		         usingToThrow:
		         (DiceShaker with: (OrderedCollection with: aLoadedDie))
		         winningWhenReach: 1
		         using: cards.
	aGame
		apply: (Hand of: 'red' with: OverloadCard initializeNew)
		to: 'blue'.
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersBox
		equals: (OrderedCollection with: 2 with: 1)
]

{ #category : #tests }
CardsTest >> testQ005WhenPlayerPlaysASpeedCardThenCheckThePositiveEffectAndValidPlayersPositions [

	| aGame aLoadedDie cards |
	cards := (Creator use: (OrderedCollection with:
			           (ObjectProbability
				            using: SpeedCard initializeNew
				            withChanceOf: 100))) create: 4.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 4
			               with: 3
			               with: 4).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: self createBoard
		         usingToThrow:
		         (DiceShaker with: (OrderedCollection with: aLoadedDie))
		         winningWhenReach: 1
		         using: cards.
	aGame apply: (Hand of: 'red' with: SpeedCard initializeNew) to: 'red'.
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersBox
		equals: (OrderedCollection with: 3 with: 5)
]

{ #category : #tests }
CardsTest >> testQ006WhenPlayerPlaysASpeedCardThenCheckThatThePositiveEffectIsPermanentAndValidPlayersPositions [

	| aGame aLoadedDie cards |
	cards := (Creator use: (OrderedCollection with:
			           (ObjectProbability
				            using: SpeedCard initializeNew
				            withChanceOf: 100))) create: 4.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 2
			               with: 3
			               with: 4).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: self createBoard
		         usingToThrow:
		         (DiceShaker with: (OrderedCollection with: aLoadedDie))
		         winningWhenReach: 1
		         using: cards.
	aGame apply: (Hand of: 'red' with: SpeedCard initializeNew) to: 'red'.
	aGame movePlayer.
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersBox
		equals: (OrderedCollection with: 7 with: 3)
]

{ #category : #tests }
CardsTest >> testQ007WhenPlayerPlaysASpeedCardThenCheckThePositiveEffectMakesPlayerGoForwardLapsAndValidPlayersLaps [

	| aGame aLoadedDie cards |
	cards := (Creator use: (OrderedCollection with:
			           (ObjectProbability
				            using: SpeedCard initializeNew
				            withChanceOf: 100))) create: 4.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 9
			               with: 2
			               with: 3
			               with: 4).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: self createBoard
		         usingToThrow:
		         (DiceShaker with: (OrderedCollection with: aLoadedDie))
		         winningWhenReach: 1
		         using: cards.
	aGame apply: (Hand of: 'red' with: SpeedCard initializeNew) to: 'red'.
	aGame movePlayer.
	self
		assert: aGame playersLaps
		equals: (OrderedCollection with: 1 with: 0)
]

{ #category : #tests }
CardsTest >> testQ008WhenPlayerPlaysTwoOverloadCardsThenCheckThatBothEffectsWereAppliedAndValidPlayersPositions [

	| aGame aLoadedDie cards |
	cards := (Creator use: (OrderedCollection with:
			           (ObjectProbability
				            using: OverloadCard initializeNew
				            withChanceOf: 100))) create: 4.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 2
			               with: 3
			               with: 4).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: self createBoard
		         usingToThrow:
		         (DiceShaker with: (OrderedCollection with: aLoadedDie))
		         winningWhenReach: 1
		         using: cards.
	aGame
		apply: (Hand of: 'red' with: OverloadCard initializeNew)
		to: 'blue'.
	aGame
		apply: (Hand of: 'red' with: OverloadCard initializeNew)
		to: 'blue'.
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersBox
		equals: (OrderedCollection with: 2 with: 1)
]

{ #category : #tests }
CardsTest >> testQ009WhenPlayerPlaysAnAccelerationCardThenCheckThatItHasAPositiveEffectOnAllPlayersAndValidPlayersPositions [

	| aGame aLoadedDie cards |
	cards := (Creator use: (OrderedCollection with: (ObjectProbability
				            using: AccelerationCard initializeNew
				            withChanceOf: 100))) create: 4.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 2
			               with: 3
			               with: 4).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: self createBoard
		         usingToThrow:
		         (DiceShaker with: (OrderedCollection with: aLoadedDie))
		         winningWhenReach: 1
		         using: cards.
	aGame
		apply: (Hand of: 'red' with: AccelerationCard initializeNew)
		to: 'everyone'.
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersBox
		equals: (OrderedCollection with: 3 with: 4)
]

{ #category : #tests }
CardsTest >> testQ010WhenPlayerPlaysAnAccelerationCardThenCheckThePositiveEffectMakesPlayerGoForwardLapsAndValidPlayersLaps [

	| aGame aLoadedDie cards |
	cards := (Creator use: (OrderedCollection with: (ObjectProbability
				            using: AccelerationCard initializeNew
				            withChanceOf: 100))) create: 4.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 8
			               with: 9
			               with: 3
			               with: 4).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: self createBoard
		         usingToThrow:
		         (DiceShaker with: (OrderedCollection with: aLoadedDie))
		         winningWhenReach: 1
		         using: cards.
	aGame
		apply: (Hand of: 'red' with: AccelerationCard initializeNew)
		to: 'everyone'.
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersLaps
		equals: (OrderedCollection with: 0 with: 1)
]

{ #category : #tests }
CardsTest >> testQ011WhenPlayerPlaysACancellationCardOnAnOverloadCardThenTheOverloadCardEffectIsCancelledAndValidPlayersPositions [

	| aGame aLoadedDie cards |
	cards := OrderedCollection
		         with: OverloadCard initializeNew
		         with: CancellationCard initializeNew
		         with: OverloadCard initializeNew
		         with: CancellationCard initializeNew.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 2
			               with: 3
			               with: 4).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: self createBoard
		         usingToThrow:
		         (DiceShaker with: (OrderedCollection with: aLoadedDie))
		         winningWhenReach: 1
		         using: cards.
	aGame
		apply: (Hand of: 'red' with: OverloadCard initializeNew)
		to: 'blue'.
	aGame movePlayer.
	aGame movePlayer.
	aGame
		apply: (Hand of: 'blue' with: CancellationCard initializeNew)
		to: (Hand of: 'blue' with: OverloadCard initializeNew).
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersBox
		equals: (OrderedCollection with: 5 with: 5)
]

{ #category : #tests }
CardsTest >> testQ012WhenPlayerPlaysACancellationCardOnASpeedCardAndThereAreTwoActiveSpeedCardsThenOneSpeedCardEffectIsCancelledAndValidPlayersPositions [

	| aGame aLoadedDie cards |
	cards := OrderedCollection
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
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: self createBoard
		         usingToThrow:
		         (DiceShaker with: (OrderedCollection with: aLoadedDie))
		         winningWhenReach: 1
		         using: cards.
	aGame apply: (Hand of: 'red' with: SpeedCard initializeNew) to: 'red'.
	aGame apply: (Hand of: 'red' with: SpeedCard initializeNew) to: 'red'.
	aGame movePlayer.
	aGame movePlayer.
	aGame
		apply: (Hand of: 'blue' with: CancellationCard initializeNew)
		to: (Hand of: 'red' with: SpeedCard initializeNew).
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersBox
		equals: (OrderedCollection with: 8 with: 7)
]

{ #category : #tests }
CardsTest >> testQ013WhenPlayerPlaysTwoCancellationCardsOnTwoActiveSpeedCardsThenTheTwoSpeedCardsEffectsAreCancelledAndValidPlayersPositions [

	| aGame aLoadedDie cards |
	cards := OrderedCollection
		         with: SpeedCard initializeNew
		         with: CancellationCard initializeNew
		         with: SpeedCard initializeNew
		         with: CancellationCard initializeNew.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 2
			               with: 3
			               with: 4).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: self createBoard
		         usingToThrow:
		         (DiceShaker with: (OrderedCollection with: aLoadedDie))
		         winningWhenReach: 1
		         using: cards.
	aGame apply: (Hand of: 'red' with: SpeedCard initializeNew) to: 'red'.
	aGame movePlayer.
	aGame
		apply: (Hand of: 'blue' with: SpeedCard initializeNew)
		to: 'blue'.
	aGame movePlayer.
	aGame
		apply: (Hand of: 'blue' with: CancellationCard initializeNew)
		to: (Hand of: 'red' with: SpeedCard initializeNew).
	aGame
		apply: (Hand of: 'red' with: CancellationCard initializeNew)
		to: (Hand of: 'blue' with: SpeedCard initializeNew).
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersBox
		equals: (OrderedCollection with: 6 with: 8)
]

{ #category : #tests }
CardsTest >> testQ014TryToApplyACancellationCardOnAnOverloadCardWhenThePlayerDoesNotHaveAnyActiveCardsThenFails [

	| aGame aLoadedDie cards |
	cards := (Creator use: (OrderedCollection with: (ObjectProbability
				            using: CancellationCard initializeNew
				            withChanceOf: 100))) create: 4.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 2
			               with: 3
			               with: 4).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: self createBoard
		         usingToThrow:
		         (DiceShaker with: (OrderedCollection with: aLoadedDie))
		         winningWhenReach: 1
		         using: cards.
	self
		should: [ 
			aGame
				apply: (Hand of: 'red' with: CancellationCard initializeNew)
				to: (Hand of: 'red' with: OverloadCard initializeNew) ]
		raise: Error
		withMessage: 'There are no permanent cards'
]

{ #category : #tests }
CardsTest >> testQ015TryToApplyACancellationCardOnASpeedCardWhenThePlayerHasOnlyAnActiveOverloadCardThenFails [

	| aGame aLoadedDie cards |
	cards := OrderedCollection
		         with: OverloadCard initializeNew
		         with: CancellationCard initializeNew
		         with: OverloadCard initializeNew
		         with: CancellationCard initializeNew.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 2
			               with: 3
			               with: 4).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: self createBoard
		         usingToThrow:
		         (DiceShaker with: (OrderedCollection with: aLoadedDie))
		         winningWhenReach: 1
		         using: cards.
	aGame
		apply: (Hand of: 'red' with: OverloadCard initializeNew)
		to: 'blue'.
	self
		should: [ 
			aGame
				apply: (Hand of: 'blue' with: CancellationCard initializeNew)
				to: (Hand of: 'blue' with: SpeedCard initializeNew) ]
		raise: Error
		withMessage:
		'There are no that type of cards activate in this player'
]

{ #category : #tests }
CardsTest >> testQ017WhenPlayerTriesToApplyAPermanentCardAndItIsNotItsTurnThenFails [

	| aGame aLoadedDie cards |
	cards := (Creator use: (OrderedCollection with:
			           (ObjectProbability
				            using: OverloadCard initializeNew
				            withChanceOf: 100))) create: 4.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 2
			               with: 3
			               with: 4).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: self createBoard
		         usingToThrow:
		         (DiceShaker with: (OrderedCollection with: aLoadedDie))
		         winningWhenReach: 1
		         using: cards.
	self
		should: [ 
			aGame
				apply: (Hand of: 'blue' with: OverloadCard initializeNew)
				to: 'red' ]
		raise: Error
		withMessage: 'A permanent card can only be use when it is your turn'
]

{ #category : #tests }
CardsTest >> testQ018WhenPlayerTriesToUseASpeedCardAndItDoesNotHaveThatTypeOfCardInPosetionThenFails [

	| aGame aLoadedDie cards |
	cards := (Creator use: (OrderedCollection with:
			           (ObjectProbability
				            using: OverloadCard initializeNew
				            withChanceOf: 100))) create: 4.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 2
			               with: 3
			               with: 4).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: self createBoard
		         usingToThrow:
		         (DiceShaker with: (OrderedCollection with: aLoadedDie))
		         winningWhenReach: 1
		         using: cards.
	self
		should: [ 
			aGame
				apply: (Hand of: 'red' with: SpeedCard initializeNew)
				to: 'red' ]
		raise: Error
		withMessage: 'The player does not have that card in posetion'
]

{ #category : #tests }
CardsTest >> testQ021TryToApplyACardWhenPlayerDoNotHaveAnyMoreCardsThenFails [

	| aGame aLoadedDie cards |
	cards := (Creator use: (OrderedCollection with:
			           (ObjectProbability
				            using: OverloadCard initializeNew
				            withChanceOf: 100))) create: 4.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 2
			               with: 3
			               with: 4).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: self createBoard
		         usingToThrow:
		         (DiceShaker with: (OrderedCollection with: aLoadedDie))
		         winningWhenReach: 1
		         using: cards.
	aGame
		apply: (Hand of: 'red' with: OverloadCard initializeNew)
		to: 'blue'.
	aGame
		apply: (Hand of: 'red' with: OverloadCard initializeNew)
		to: 'blue'.
	self
		should: [ 
			aGame
				apply: (Hand of: 'red' with: OverloadCard initializeNew)
				to: 'blue' ]
		raise: Error
		withMessage: 'The player does not have that card in posetion'
]

{ #category : #tests }
CardsTest >> testQ026TryToApplyACancellationCardOnANonValidObjectiveThenFails [

	| aGame aLoadedDie cards |
	cards := OrderedCollection
		         with: OverloadCard initializeNew
		         with: CancellationCard initializeNew
		         with: OverloadCard initializeNew
		         with: CancellationCard initializeNew.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 2
			               with: 3
			               with: 4).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: self createBoard
		         usingToThrow:
		         (DiceShaker with: (OrderedCollection with: aLoadedDie))
		         winningWhenReach: 1
		         using: cards.
	aGame
		apply: (Hand of: 'red' with: OverloadCard initializeNew)
		to: 'blue'.
	self
		should: [ 
			aGame
				apply: (Hand of: 'blue' with: CancellationCard initializeNew)
				to: 'blue' ]
		raise: Error
		withMessage:
		'That is not a valid objective'
]

{ #category : #tests }
CardsTest >> testQ029WhenPlayerPlaysARedoCardAndTheLastCardPlayedWasAPermanentCardThenCheckThatTheEffectWasRepeatedAndValidPlayersPositions [

	| aGame aLoadedDie cards |
	cards := OrderedCollection
		         with: OverloadCard initializeNew
		         with: RedoCard initializeNew
		         with: OverloadCard initializeNew
		         with: RedoCard initializeNew.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 2
			               with: 3
			               with: 4).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: self createBoard
		         usingToThrow:
		         (DiceShaker with: (OrderedCollection with: aLoadedDie))
		         winningWhenReach: 1
		         using: cards.
	aGame
		apply: (Hand of: 'red' with: OverloadCard initializeNew)
		to: 'blue'.
	aGame movePlayer.
	aGame movePlayer.
	aGame apply: (Hand of: 'blue' with: RedoCard initializeNew) to: 'red'.
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersBox
		equals: (OrderedCollection with: 3 with: 3)
]

{ #category : #tests }
CardsTest >> testQ030WhenPlayerPlaysARedoCardAndTheLastCardPlayedWasACancellationCardThenCheckThatTheEffectWasRepeated [

	| aGame aLoadedDie cards |
	cards := OrderedCollection
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
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: self createBoard
		         usingToThrow:
		         (DiceShaker with: (OrderedCollection with: aLoadedDie))
		         winningWhenReach: 1
		         using: cards.
	aGame
		apply: (Hand of: 'red' with: OverloadCard initializeNew)
		to: 'blue'.
	aGame movePlayer.
	aGame
		apply: (Hand of: 'blue' with: OverloadCard initializeNew)
		to: 'red'.
	aGame movePlayer.
	aGame
		apply: (Hand of: 'blue' with: CancellationCard initializeNew)
		to: (Hand of: 'blue' with: OverloadCard initializeNew).
	aGame
		apply: (Hand of: 'red' with: RedoCard initializeNew)
		to: (Hand of: 'red' with: OverloadCard initializeNew).
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersBox
		equals: (OrderedCollection with: 5 with: 5)
]

{ #category : #tests }
CardsTest >> testQ033WhenPlayerPlaysARedoCardAndLastCardPlayedWasARedoCardThatRepeatedTheEffectOfAPermanentCardThenRepeatAgainThatEffectAndValidPlayersPositions [

	| aGame aLoadedDie cards |
	cards := OrderedCollection
		         with: AccelerationCard initializeNew
		         with: RedoCard initializeNew
		         with: AccelerationCard initializeNew
		         with: RedoCard initializeNew.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 2
			               with: 3
			               with: 3).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: self createBoard
		         usingToThrow:
		         (DiceShaker with: (OrderedCollection with: aLoadedDie))
		         winningWhenReach: 1
		         using: cards.
	aGame
		apply: (Hand of: 'red' with: AccelerationCard initializeNew)
		to: 'everyone'.
	aGame movePlayer.
	aGame movePlayer.
	aGame
		apply: (Hand of: 'red' with: RedoCard initializeNew)
		to: 'everyone'.
	aGame
		apply: (Hand of: 'blue' with: RedoCard initializeNew)
		to: 'everyone'.
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersBox
		equals: (OrderedCollection with: 9 with: 10)
]

{ #category : #tests }
CardsTest >> testQ034WhenPlayerPlaysARepeatCardAndLastBoxInvokedWasASpeedUpBoxThenCheckThatThisEffectWasRepeatedAndValidPlayersPositions [

	| aGame aLoadedDie cards boxes aBoard |
	cards := (Creator use: (OrderedCollection with:
			           (ObjectProbability
				            using: RepeatCard initializeNew
				            withChanceOf: 100))) create: 4.
	boxes := (Creator use: (OrderedCollection with:
			           (ObjectProbability
				            using: SpeedUpBox initializeNew
				            withChanceOf: 100))) create: 10.
	aBoard := Board with: boxes measure: (Parsec worth: 100).
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 2
			               with: 3
			               with: 4).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         usingToThrow:
		         (DiceShaker with: (OrderedCollection with: aLoadedDie))
		         winningWhenReach: 1
		         using: cards.
	aGame movePlayer.
	aGame movePlayer.
	aGame
		apply: (Hand of: 'red' with: RepeatCard initializeNew)
		to: 'red'.
	self
		assert: aGame playersBox
		equals: (OrderedCollection with: 10 with: 7)
]

{ #category : #tests }
CardsTest >> testQ035WhenPlayerPlaysARepeatCardAndLastBoxInvokedWasAWormHoleBoxThenCheckThatThisEffectWasRepeatedAndValidPlayersPositions [

	| aGame aLoadedDie cards boxes aBoard |
	cards := (Creator use: (OrderedCollection with:
			           (ObjectProbability
				            using: RepeatCard initializeNew
				            withChanceOf: 100))) create: 4.
	boxes := (Creator use: (OrderedCollection with:
			           (ObjectProbability
				            using: WormHoleBox initializeNew
				            withChanceOf: 100))) create: 10.
	aBoard := Board with: boxes measure: (Parsec worth: 100).
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 8
			               with: 9
			               with: 7
			               with: 6).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         usingToThrow:
		         (DiceShaker with: (OrderedCollection with: aLoadedDie))
		         winningWhenReach: 1
		         using: cards.
	aGame movePlayer.
	aGame movePlayer.
	aGame
		apply: (Hand of: 'red' with: RepeatCard initializeNew)
		to: 'blue'.
	self
		assert: aGame playersBox
		equals: (OrderedCollection with: 5 with: 2)
]

{ #category : #tests }
CardsTest >> testQ036WhenPlayerPlaysARepeatCardAndLastBoxInvokedWasAMoonWalkBoxThenCheckThatThisEffectWasRepeatedAndValidPlayersPositions [

	| aGame aLoadedDie cards boxes aBoard |
	cards := (Creator use: (OrderedCollection with:
			           (ObjectProbability
				            using: RepeatCard initializeNew
				            withChanceOf: 100))) create: 4.
	boxes := (Creator use: (OrderedCollection with:
			           (ObjectProbability
				            using: (MoonWalkBox with: -2)
				            withChanceOf: 100))) create: 10.
	aBoard := Board with: boxes measure: (Parsec worth: 100).
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 4
			               with: 5
			               with: 3
			               with: 4).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         usingToThrow:
		         (DiceShaker with: (OrderedCollection with: aLoadedDie))
		         winningWhenReach: 1
		         using: cards.
	aGame movePlayer.
	aGame movePlayer.
	aGame
		apply: (Hand of: 'red' with: RepeatCard initializeNew)
		to: 'red'.
	self
		assert: aGame playersBox
		equals: (OrderedCollection with: 3 with: 4)
]

{ #category : #tests }
CardsTest >> testQ038WhenPlayerPlaysARepeatCardAndLastBoxInvokedWasAHyperJumpBoxThenCheckThatThisEffectWasRepeatedAndValidPlayersPositions [

	| aGame aLoadedDie cards boxes aBoard |
	cards := (Creator use: (OrderedCollection with:
			           (ObjectProbability
				            using: RepeatCard initializeNew
				            withChanceOf: 100))) create: 4.
	boxes := (Creator use: (OrderedCollection with: (ObjectProbability
				            using: (HyperJumpBox with:
						             (OrderedCollection
							              with: (Parsec worth: 40)
							              with: (Parsec worth: 20)))
				            withChanceOf: 100))) create: 10.
	aBoard := Board with: boxes measure: (Parsec worth: 100).
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 2
			               with: 3
			               with: 4).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         usingToThrow:
		         (DiceShaker with: (OrderedCollection with: aLoadedDie))
		         winningWhenReach: 1
		         using: cards.
	aGame movePlayer.
	aGame movePlayer.
	aGame
		apply: (Hand of: 'red' with: RepeatCard initializeNew)
		to: 'red'.
	self
		assert: aGame playersBox
		equals: (OrderedCollection with: 8 with: 7)
]

{ #category : #tests }
CardsTest >> testQ045WhenPlayerPlaysARedoCardAndTheLastCardPlayedWasARepeatCardThenCheckThatTheEffectWasRepeatedAndValidPlayersPositions [

	| aGame aLoadedDie cards boxes aBoard |
	cards := OrderedCollection
		         with: RepeatCard initializeNew
		         with: RedoCard initializeNew
		         with: RepeatCard initializeNew
		         with: RedoCard initializeNew.
	boxes := (Creator use: (OrderedCollection with:
			           (ObjectProbability
				            using: SpeedUpBox initializeNew
				            withChanceOf: 100))) create: 10.
	aBoard := Board with: boxes measure: (Parsec worth: 100).
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 2
			               with: 3
			               with: 4).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         usingToThrow:
		         (DiceShaker with: (OrderedCollection with: aLoadedDie))
		         winningWhenReach: 1
		         using: cards.
	aGame movePlayer.
	aGame
		apply: (Hand of: 'red' with: RepeatCard initializeNew)
		to: 'red'.
	aGame
		apply: (Hand of: 'blue' with: RedoCard initializeNew)
		to: 'blue'.
	self
		assert: aGame playersBox
		equals: (OrderedCollection with: 10 with: 5)
]

{ #category : #tests }
CardsTest >> testQ048WhenPlayerTriesToPlayAnOverloadCardOnAnInvalidObjectiveThenFails [

	| aGame aLoadedDie cards |
	cards := (Creator use: (OrderedCollection with:
			           (ObjectProbability
				            using: OverloadCard initializeNew
				            withChanceOf: 100))) create: 4.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 2
			               with: 3
			               with: 4).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: self createBoard
		         usingToThrow:
		         (DiceShaker with: (OrderedCollection with: aLoadedDie))
		         winningWhenReach: 1
		         using: cards.
	self
		should: [ 
			aGame
				apply: (Hand of: 'red' with: OverloadCard initializeNew)
				to: (Hand of: 'blue' with: OverloadCard initializeNew) ]
		raise: Error
		withMessage: 'That is not a valid objective'
]

{ #category : #tests }
CardsTest >> testQ050WhenPlayerTriesToPlayASpeedCardOnAnInvalidObjectiveThenFails [

	| aGame aLoadedDie cards |
	cards := (Creator use: (OrderedCollection with:
			           (ObjectProbability
				            using: SpeedCard initializeNew
				            withChanceOf: 100))) create: 4.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 2
			               with: 3
			               with: 4).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: self createBoard
		         usingToThrow:
		         (DiceShaker with: (OrderedCollection with: aLoadedDie))
		         winningWhenReach: 1
		         using: cards.
	self
		should: [ 
			aGame
				apply: (Hand of: 'red' with: SpeedCard initializeNew)
				to: (Hand of: 'blue' with: SpeedCard initializeNew) ]
		raise: Error
		withMessage: 'That is not a valid objective'
]

{ #category : #tests }
CardsTest >> testQ051WhenPlayerTriesToPlayARepeatCardOnAnInvalidObjectiveThenFails [

	| aGame aLoadedDie cards |
	cards := (Creator use: (OrderedCollection with:
			           (ObjectProbability
				            using: RepeatCard initializeNew
				            withChanceOf: 100))) create: 4.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 2
			               with: 3
			               with: 4).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: self createBoard
		         usingToThrow:
		         (DiceShaker with: (OrderedCollection with: aLoadedDie))
		         winningWhenReach: 1
		         using: cards.
	self
		should: [ 
			aGame
				apply: (Hand of: 'red' with: RepeatCard initializeNew)
				to: (Hand of: 'blue' with: RepeatCard initializeNew) ]
		raise: Error
		withMessage: 'That is not a valid objective'
]

{ #category : #tests }
CardsTest >> testQ052WhenPlayerTriesToPlayARedoCardAndNoOtherCardsWerePlayedBeforeThenFails [

	| aGame aLoadedDie cards |
	cards := (Creator use: (OrderedCollection with:
			           (ObjectProbability
				            using: RedoCard initializeNew
				            withChanceOf: 100))) create: 4.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 2
			               with: 3
			               with: 4).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: self createBoard
		         usingToThrow:
		         (DiceShaker with: (OrderedCollection with: aLoadedDie))
		         winningWhenReach: 1
		         using: cards.
	self
		should: [ 
			aGame
				apply: (Hand of: 'blue' with: RedoCard initializeNew)
				to: 'red' ]
		raise: Error
		withMessage:
		'Redo card cannot be played because there are no cards that have been played before'
]

{ #category : #tests }
CardsTest >> testQ053WhenPlayerPlaysASpeedBoostCardOnAnOverloadCardThenCheckThatTheOverloadCardEffectWasDuplicatedAndValidPlayersPositions [

	| aGame aLoadedDie cards |
	cards := OrderedCollection
		         with: OverloadCard initializeNew
		         with: SpeedBoostCard initializeNew
		         with: OverloadCard initializeNew
		         with: SpeedBoostCard initializeNew.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 2
			               with: 3
			               with: 4
			               with: 5).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: self createBoard
		         usingToThrow:
		         (DiceShaker with: (OrderedCollection with: aLoadedDie))
		         winningWhenReach: 1
		         using: cards.
	aGame
		apply: (Hand of: 'red' with: OverloadCard initializeNew)
		to: 'blue'.
	aGame movePlayer.
	aGame movePlayer.
	aGame
		apply: (Hand of: 'red' with: SpeedBoostCard initializeNew)
		to: (Hand of: 'blue' with: OverloadCard initializeNew).
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersBox
		equals: (OrderedCollection with: 7 with: 3)
]

{ #category : #tests }
CardsTest >> testQ054WhenPlayerPlaysASpeedBoostCardOnASpeedCardThenCheckThatTheSpeedCardEffectWasDuplicatedAndValidPlayersPositions [

	| aGame aLoadedDie cards |
	cards := OrderedCollection
		         with: SpeedCard initializeNew
		         with: SpeedBoostCard initializeNew
		         with: SpeedCard initializeNew
		         with: SpeedBoostCard initializeNew.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 2
			               with: 3
			               with: 4).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: self createBoard
		         usingToThrow:
		         (DiceShaker with: (OrderedCollection with: aLoadedDie))
		         winningWhenReach: 1
		         using: cards.
	aGame apply: (Hand of: 'red' with: SpeedCard initializeNew) to: 'red'.
	aGame movePlayer.
	aGame movePlayer.
	aGame
		apply: (Hand of: 'red' with: SpeedBoostCard initializeNew)
		to: (Hand of: 'red' with: SpeedCard initializeNew).
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersBox
		equals: (OrderedCollection with: 8 with: 7)
]

{ #category : #tests }
CardsTest >> testQ055WhenPlayerPlaysASpeedBoostCardOnAnAccelerationCardThenCheckThatTheAccelerationCardEffectWasDuplicatedAndValidPlayersPositions [

	| aGame aLoadedDie cards |
	cards := OrderedCollection
		         with: AccelerationCard initializeNew
		         with: SpeedBoostCard initializeNew
		         with: AccelerationCard initializeNew
		         with: SpeedBoostCard initializeNew.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 2
			               with: 3
			               with: 4).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: self createBoard
		         usingToThrow:
		         (DiceShaker with: (OrderedCollection with: aLoadedDie))
		         winningWhenReach: 1
		         using: cards.
	aGame
		apply: (Hand of: 'red' with: AccelerationCard initializeNew)
		to: 'everyone'.
	aGame movePlayer.
	aGame movePlayer.
	aGame
		apply: (Hand of: 'red' with: SpeedBoostCard initializeNew)
		to: (Hand of: 'everyone' with: AccelerationCard initializeNew).
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersBox
		equals: (OrderedCollection with: 8 with: 10)
]

{ #category : #tests }
CardsTest >> testQ056WhenPlayerPlaysACancellationCardOnABoostedPermanentCardThenCheckThatTheEffectIsNoMoreAppliedAndValidPlayersPositions [

	| aGame aLoadedDie cards |
	cards := OrderedCollection
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
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: self createBoard
		         usingToThrow:
		         (DiceShaker with: (OrderedCollection with: aLoadedDie))
		         winningWhenReach: 1
		         using: cards.
	aGame
		apply: (Hand of: 'red' with: OverloadCard initializeNew)
		to: 'blue'.
	aGame
		apply: (Hand of: 'red' with: SpeedBoostCard initializeNew)
		to: (Hand of: 'blue' with: OverloadCard initializeNew).
	aGame movePlayer.
	aGame movePlayer.
	aGame
		apply: (Hand of: 'blue' with: CancellationCard initializeNew)
		to: (Hand of: 'blue' with: OverloadCard initializeNew).
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersBox
		equals: (OrderedCollection with: 4 with: 6)
]

{ #category : #tests }
CardsTest >> testQ059WhenPlayerTriesToPlayASpeedBoostCardOnANonExistentCardThenFails [

	| aGame aLoadedDie cards |
	cards := OrderedCollection
		         with: OverloadCard initializeNew
		         with: SpeedBoostCard initializeNew
		         with: OverloadCard initializeNew
		         with: SpeedBoostCard initializeNew.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 2
			               with: 3
			               with: 4).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: self createBoard
		         usingToThrow:
		         (DiceShaker with: (OrderedCollection with: aLoadedDie))
		         winningWhenReach: 1
		         using: cards.
	aGame
		apply: (Hand of: 'red' with: OverloadCard initializeNew)
		to: 'blue'.
	self
		should: [ 
			aGame
				apply: (Hand of: 'red' with: SpeedBoostCard initializeNew)
				to: (Hand of: 'blue' with: SpeedCard initializeNew) ]
		raise: Error
		withMessage:
		'There are no that type of cards activate in this player'
]

{ #category : #tests }
CardsTest >> testQ060WhenPlayerTriesToPlayASpeedBoostCardAndThereAreNoActivePermanentCardsThenFails [

	| aGame aLoadedDie cards |
	cards := (Creator use: (OrderedCollection with: (ObjectProbability
				            using: SpeedBoostCard initializeNew
				            withChanceOf: 100))) create: 4.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 2
			               with: 3
			               with: 4).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: self createBoard
		         usingToThrow:
		         (DiceShaker with: (OrderedCollection with: aLoadedDie))
		         winningWhenReach: 1
		         using: cards.
	self
		should: [ 
			aGame
				apply: (Hand of: 'red' with: SpeedBoostCard initializeNew)
				to: (Hand of: 'red' with: SpeedCard initializeNew) ]
		raise: Error
		withMessage: 'There are no permanent cards'
]

{ #category : #tests }
CardsTest >> testQ061WhenPlayerPlaysAReversePolarityCardOnASpeedUpBoxThenCheckThatTheBoxAffectOtherPlayersAndValidPlayersPositions [

	| aGame aLoadedDie cards boxes aBoard |
	cards := (Creator use: (OrderedCollection with: (ObjectProbability
				            using: ReversePolarityCard initializeNew
				            withChanceOf: 100))) create: 4.
	boxes := (Creator use: (OrderedCollection with:
			           (ObjectProbability
				            using: SpeedUpBox initializeNew
				            withChanceOf: 100))) create: 10.
	aBoard := Board with: boxes measure: (Parsec worth: 100).
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 1
			               with: 3
			               with: 4).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         usingToThrow:
		         (DiceShaker with: (OrderedCollection with: aLoadedDie))
		         winningWhenReach: 1
		         using: cards.
	aGame
		apply: (Hand of: 'red' with: ReversePolarityCard initializeNew)
		to: 2.
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersBox
		equals: (OrderedCollection with: 2 with: 10)
]
