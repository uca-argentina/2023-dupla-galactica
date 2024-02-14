Class {
	#name : #CardsTest,
	#superclass : #TestCase,
	#instVars : [
		'aColorCollection'
	],
	#category : #'IngSoft2-Tests'
}

{ #category : #Game }
CardsTest >> createBoard [

	| boxes aBoard |
	boxes := (BoxCreator use: (OrderedCollection with: (BoxProbability using: NoEffectBox initializeNew withChanceOf: 100))) create: 10.
	^ aBoard := Board with: boxes measure: (Parsec worth: 100).
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

	| aGame aLoadedDie aBoard aShaker aCard |
	aBoard := self createBoard.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 2
			               with: 3
			               with: 4).
	aShaker := DiceShaker with: aLoadedDie.
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         usingToThrow: aShaker
		         winningWhenReach: 1
		         using:
		         (CardDealer with: (OrderedCollection with: (CardProbability using: OverloadCard withChanceOf: 100))).
	aCard := (OverloadCard holder: 'red') selectTarget: 'blue'.
	aGame apply: aCard.
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersBox
		equals: (OrderedCollection with: 2 with: 1)
]

{ #category : #tests }
CardsTest >> testQ002WhenPlayerPlaysAnOverloadCardThenCheckThatTheNegativeEffectIsPermanentAndValidPlayersPositions [

	| aGame aLoadedDie aBoard aShaker aCard |
	aBoard := self createBoard.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 2
			               with: 3
			               with: 4).
	aShaker := DiceShaker with: aLoadedDie.
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         usingToThrow: aShaker
		         winningWhenReach: 1
		         using:
		         (CardDealer with: (OrderedCollection with: (CardProbability using: OverloadCard withChanceOf: 100))).
	aCard := (OverloadCard holder: 'red') selectTarget: 'blue'.
	aGame apply: aCard.
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

	| aGame aLoadedDie aBoard aShaker aCard |
	aBoard := self createBoard.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 10
			               with: 3
			               with: 0).
	aShaker := DiceShaker with: aLoadedDie.
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         usingToThrow: aShaker
		         winningWhenReach: 1
		         using:
		        (CardDealer with: (OrderedCollection with: (CardProbability using: OverloadCard withChanceOf: 100))).
	aCard := (OverloadCard holder: 'red') selectTarget: 'blue'.
	aGame apply: aCard.
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersBox
		equals: (OrderedCollection with: 2 with: 9)
]

{ #category : #tests }
CardsTest >> testQ004WhenPlayerPlaysAnOverloadCardThenCheckTheNegativeEffectCannotSendPlayerToAnOutOfRangeBoardPositionAndValidPlayersPositions [

	| aGame aLoadedDie aBoard aShaker aCard |
	aBoard := self createBoard.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 1
			               with: 3
			               with: 4).
	aShaker := DiceShaker with: aLoadedDie.
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         usingToThrow: aShaker
		         winningWhenReach: 1
		         using: (CardDealer with: (OrderedCollection with:
					           (CardProbability using: OverloadCard withChanceOf: 100))).
	aCard := (OverloadCard holder: 'red') selectTarget: 'blue'.
	aGame apply: aCard.
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersBox
		equals: (OrderedCollection with: 2 with: 1)
]

{ #category : #tests }
CardsTest >> testQ005WhenPlayerPlaysASpeedCardThenCheckThePositiveEffectAndValidPlayersPositions [

	| aGame aLoadedDie aBoard aShaker aCard |
	aBoard := self createBoard.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 4
			               with: 3
			               with: 4).
	aShaker := DiceShaker with: aLoadedDie.
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         usingToThrow: aShaker
		         winningWhenReach: 1
		         using:
		         (CardDealer with: (OrderedCollection with: (CardProbability using: SpeedCard withChanceOf: 100))).
	aCard := (SpeedCard holder: 'red') selectTarget: 'red'.
	aGame apply: aCard.
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersBox
		equals: (OrderedCollection with: 3 with: 5)
]

{ #category : #tests }
CardsTest >> testQ006WhenPlayerPlaysASpeedCardThenCheckThatThePositiveEffectIsPermanentAndValidPlayersPositions [

	| aGame aLoadedDie aBoard aShaker aCard |
	aBoard := self createBoard.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 2
			               with: 3
			               with: 5).
	aShaker := DiceShaker with: aLoadedDie.
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         usingToThrow: aShaker
		         winningWhenReach: 1
		         using:
		        ((CardDealer with: (OrderedCollection with: (CardProbability using: SpeedCard withChanceOf: 100)))).
	aCard := (SpeedCard holder: 'red') selectTarget: 'red'.
	aGame apply: aCard.
	aGame movePlayer.
	aGame movePlayer.
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersBox
		equals: (OrderedCollection with: 7 with: 8)
]

{ #category : #tests }
CardsTest >> testQ007WhenPlayerPlaysASpeedCardThenCheckThePositiveEffectMakesPlayerGoForwardLapsAndValidPlayersLaps [

	| aGame aLoadedDie aBoard aShaker aCard |
	aBoard := self createBoard.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 9
			               with: 2
			               with: 3
			               with: 5).
	aShaker := DiceShaker with: aLoadedDie.
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         usingToThrow: aShaker
		         winningWhenReach: 1
		         using:
		         (CardDealer with: (OrderedCollection with: (CardProbability using: SpeedCard withChanceOf: 100))).
	aCard := (SpeedCard holder: 'red') selectTarget: 'red'.
	aGame apply: aCard.
	aGame movePlayer.
	self
		assert: aGame playersLaps
		equals: (OrderedCollection with: 1 with: 0)
]

{ #category : #tests }
CardsTest >> testQ008WhenPlayerPlaysTwoOverloadCardsThenCheckThatBothEffectsWereAppliedAndValidPlayersPositions [

	| aGame aLoadedDie aBoard aShaker aCard |
	aBoard := self createBoard.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 5
			               with: 2
			               with: 3
			               with: 5).
	aShaker := DiceShaker with: aLoadedDie.
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         usingToThrow: aShaker
		         winningWhenReach: 1
		         using:
		         (CardDealer with: (OrderedCollection with: (CardProbability using: OverloadCard withChanceOf: 100))).
	aCard := (OverloadCard holder: 'red') selectTarget: 'red'.
	aGame apply: aCard.
	aCard := (OverloadCard holder: 'red') selectTarget: 'red'.
	aGame apply: aCard.
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersBox
		equals: (OrderedCollection with: 2 with: 3)
]

{ #category : #tests }
CardsTest >> testQ009WhenPlayerPlaysAnAccelerationCardThenCheckThatItHasAPositiveEffectOnAllPlayersAndValidPlayersPositions [

	| aGame aLoadedDie aBoard aShaker aCard |
	aBoard := self createBoard.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 2
			               with: 3
			               with: 4).
	aShaker := DiceShaker with: aLoadedDie.
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         usingToThrow: aShaker
		         winningWhenReach: 1
		         using:
		         (CardDealer with: (OrderedCollection with: (CardProbability using: AccelerationCard withChanceOf: 100))).
	aCard := AccelerationCard holder: 'red'.
	aGame apply: aCard.
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersBox
		equals: (OrderedCollection with: 3 with: 4)
]

{ #category : #tests }
CardsTest >> testQ010WhenPlayerPlaysAnAccelerationCardThenCheckThePositiveEffectMakesPlayerGoForwardLapsAndValidPlayersLaps [

	| aGame aLoadedDie aBoard aShaker aCard |
	aBoard := self createBoard.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 8
			               with: 9
			               with: 3
			               with: 4).
	aShaker := DiceShaker with: aLoadedDie.
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         usingToThrow: aShaker
		         winningWhenReach: 1
		         using:
		          (CardDealer with: (OrderedCollection with: (CardProbability using: AccelerationCard withChanceOf: 100))).
	aCard := (AccelerationCard holder: 'red').
	aGame apply: aCard.
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersLaps
		equals: (OrderedCollection with: 0 with: 1)
]

{ #category : #tests }
CardsTest >> testQ011WhenPlayerPlaysACancellationCardOnAnOverloadCardThenTheOverloadCardEffectIsCancelledAndValidPlayersPositions [

	| aGame aLoadedDie aBoard boxes aShaker aCard |
	boxes := (BoxCreator use: (OrderedCollection with: (BoxProbability
				            using: (RandomCardBox with: (OrderedCollection with:
							              (CardProbability
								               using: CancellationCard
								               withChanceOf: 100)))
				            withChanceOf: 100))) create: 10.
	aBoard := Board with: boxes measure: (Parsec worth: 100).
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 2
			               with: 3
			               with: 4).
	aShaker := DiceShaker with: aLoadedDie.
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         usingToThrow: aShaker
		         winningWhenReach: 1
		         using: (CardDealer with: (OrderedCollection with:
					           (CardProbability using: OverloadCard withChanceOf: 100))).

	aCard := (OverloadCard holder: 'red') selectTarget: 'blue'.
	aGame apply: aCard.
	aGame movePlayer.
	aGame movePlayer.
	aCard := (CancellationCard holder: 'red') selectTarget:
		         (OverloadCard holder: 'blue').
	aGame apply: aCard.

	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersBox
		equals: (OrderedCollection with: 5 with: 5)
]

{ #category : #tests }
CardsTest >> testQ012WhenPlayerPlaysACancellationCardOnASpeedCardAndThereAreTwoActiveSpeedCardsThenOneSpeedCardEffectIsCancelledAndValidPlayersPositions [

	| aGame aLoadedDie aBoard boxes aShaker aCard|
	boxes := (BoxCreator use: (OrderedCollection with: (BoxProbability
				            using:
				            (RandomCardBox with:
					             (OrderedCollection with: (CardProbability using: CancellationCard withChanceOf: 100)))
				            withChanceOf: 100))) create: 10.
	aBoard := Board with: boxes measure: (Parsec worth: 100).
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 2
			               with: 3
			               with: 4).
	aShaker := DiceShaker with: aLoadedDie.
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         usingToThrow: aShaker
		         winningWhenReach: 1
		         using:
		         (CardDealer with: (OrderedCollection with: (CardProbability using: SpeedCard withChanceOf: 100))).
	aCard := (SpeedCard holder: 'red') selectTarget: 'blue'.
	aGame apply: aCard.
	aCard := (SpeedCard holder: 'red') selectTarget: 'blue'.
	aGame apply: aCard.
	aGame movePlayer.
	aGame movePlayer.
	aCard := (CancellationCard holder: 'red') selectTarget:
		              (SpeedCard holder: 'blue').
	aGame apply: aCard.
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersBox
		equals: (OrderedCollection with: 5 with: 10)
]

{ #category : #tests }
CardsTest >> testQ013WhenPlayerPlaysTwoCancellationCardsOnTwoActiveSpeedCardsThenTheTwoSpeedCardsEffectsAreCancelledAndValidPlayersPositions [

	| aGame aLoadedDie aBoard boxes aShaker aCard |
	boxes := (BoxCreator use: (OrderedCollection with: (BoxProbability
				            using:
				            (RandomCardBox with:
					              (OrderedCollection with: (CardProbability using: CancellationCard withChanceOf: 100)))
				            withChanceOf: 100))) create: 10.
	aBoard := Board with: boxes measure: (Parsec worth: 100).
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 2
			               with: 3
			               with: 4).
	aShaker := DiceShaker with: aLoadedDie.
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         usingToThrow: aShaker
		         winningWhenReach: 1
		         using:
		         (CardDealer with: (OrderedCollection with: (CardProbability using: SpeedCard withChanceOf: 100))).
	aCard := (SpeedCard holder: 'red') selectTarget: 'red'.
	aGame apply: aCard.
	aGame movePlayer.
	aCard := (SpeedCard holder: 'blue') selectTarget: 'blue'.
	aGame apply: aCard.
	aGame movePlayer.
	aCard := (CancellationCard holder: 'red') selectTarget: (SpeedCard holder: 'blue').
	aGame apply: aCard.
	aGame movePlayer.
	aCard := (CancellationCard holder: 'blue') selectTarget: (SpeedCard holder: 'red').
	aGame apply: aCard.
	aGame movePlayer.
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersBox
		equals: (OrderedCollection with: 8 with: 10)
]

{ #category : #tests }
CardsTest >> testQ014TryToApplyACancellationCardOnAnOverloadCardWhenThePlayerDoesNotHaveAnyActiveCardsThenFails [

	| aGame aLoadedDie aBoard aShaker aCard |
	aBoard := self createBoard.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 2
			               with: 3
			               with: 4).
	aShaker := DiceShaker with: aLoadedDie.
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         usingToThrow: aShaker
		         winningWhenReach: 1
		         using:
		         (CardDealer with:
			           (OrderedCollection with: (CardProbability using: CancellationCard withChanceOf: 100))).
	aCard := (CancellationCard holder: 'red') selectTarget:
		         (OverloadCard holder: 'red').
	self
		should: [ aGame apply: aCard. ]
		raise: Error
		withMessage: 'There are no permanent cards'
]

{ #category : #tests }
CardsTest >> testQ015TryToApplyACancellationCardOnASpeedCardWhenThePlayerHasOnlyAnActiveOverloadCardThenFails [

	| aGame aLoadedDie aBoard boxes aShaker aCard |
	boxes := (BoxCreator use: (OrderedCollection with: (BoxProbability
				            using:
				            (RandomCardBox with:
					              (OrderedCollection with: (CardProbability using: CancellationCard withChanceOf: 100)))
				            withChanceOf: 100))) create: 10.
	aBoard := Board with: boxes measure: (Parsec worth: 100).
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 2
			               with: 3
			               with: 4).
	aShaker := DiceShaker with: aLoadedDie.
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         usingToThrow: aShaker
		         winningWhenReach: 1
		         using:
		         (CardDealer with: (OrderedCollection with: (CardProbability using: OverloadCard withChanceOf: 100))).
	aCard := (OverloadCard holder: 'red') selectTarget: 'blue'.
	aGame apply: aCard.
	aGame movePlayer.
	aGame movePlayer.
	aCard := (CancellationCard holder: 'red') selectTarget:
		         (SpeedCard holder: 'red').
	self
		should: [ aGame apply: aCard ]
		raise: Error
		withMessage:
		'There are no that type of cards activate in this player or is not a valid objective'
]

{ #category : #tests }
CardsTest >> testQ017WhenPlayerTriesToApplyAPermanentCardAndItIsNotItsTurnThenFails [

	| aGame aLoadedDie aBoard aShaker aCard |
	aBoard := self createBoard.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 2
			               with: 3
			               with: 4).
	aShaker := DiceShaker with: aLoadedDie.
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         usingToThrow: aShaker
		         winningWhenReach: 1
		         using:
		         (CardDealer with: (OrderedCollection with: (CardProbability using: OverloadCard withChanceOf: 100))).
	aCard := (OverloadCard holder: 'blue') selectTarget: 'red'.
	self
		should: [ aGame apply: aCard ]
		raise: Error
		withMessage: 'A permanent card can only be use when it is your turn'
]

{ #category : #tests }
CardsTest >> testQ018WhenPlayerTriesToUseASpeedCardAndItDoesNotHaveThatTypeOfCardInPosetionThenFails [

	| aGame aLoadedDie aBoard aShaker aCard |
	aBoard := self createBoard.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 2
			               with: 3
			               with: 4).
	aShaker := DiceShaker with: aLoadedDie.
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         usingToThrow: aShaker
		         winningWhenReach: 1
		         using:
		         (CardDealer with: (OrderedCollection with: (CardProbability using: OverloadCard withChanceOf: 100))).
	aCard := (SpeedCard holder: 'red') selectTarget: 'red'.
	self
		should: [ aGame apply: aCard ]
		raise: Error
		withMessage: 'The player does not have that card in posetion'
]

{ #category : #tests }
CardsTest >> testQ019WhenPlayerTriesToUseAnAccelerationCardAndItDoesNotHaveThatTypeOfCardInPosetionThenFails [

	| aGame aLoadedDie aBoard aShaker aCard |
	aBoard := self createBoard.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 2
			               with: 3
			               with: 4).
	aShaker := DiceShaker with: aLoadedDie.
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         usingToThrow: aShaker
		         winningWhenReach: 1
		         using:
		         (CardDealer with: (OrderedCollection with: (CardProbability using: OverloadCard withChanceOf: 100))).
	aCard := (AccelerationCard holder: 'red').

	self
		should: [ aGame apply: aCard ]
		raise: Error
		withMessage: 'The player does not have that card in posetion'
]

{ #category : #tests }
CardsTest >> testQ021TryToApplyACardWhenPlayerDoNotHaveAnyMoreCardsThenFails [

	| aGame aLoadedDie aBoard aShaker aCard |
	aBoard := self createBoard.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 5
			               with: 3
			               with: 4).
	aShaker := DiceShaker with: aLoadedDie.
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         usingToThrow: aShaker
		         winningWhenReach: 1
		         using:
		         (CardDealer with: (OrderedCollection with: (CardProbability using: OverloadCard withChanceOf: 100))).
	aCard := (OverloadCard holder: 'red') selectTarget: 'blue'.
	aGame apply: aCard.
	aCard := (OverloadCard holder: 'red') selectTarget: 'blue'.
	aGame apply: aCard.
	aCard := (OverloadCard holder: 'red') selectTarget: 'blue'.
	self
		should: [ 
			aGame
				apply: aCard]
		raise: Error
		withMessage: 'The player does not have that card in posetion'
]

{ #category : #tests }
CardsTest >> testQ026TryToApplyACancellationCardOnANonValidObjectiveThenFails [

	| aGame aLoadedDie aBoard boxes aShaker aCard |
	boxes := (BoxCreator use: (OrderedCollection with: (BoxProbability using: (RandomCardBox with:  (OrderedCollection with: (CardProbability using: CancellationCard withChanceOf: 100))) withChanceOf: 100))) create: 10.
	aBoard := Board with: boxes measure: (Parsec worth: 100).
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 2
			               with: 3
			               with: 4).
	aShaker := DiceShaker with: aLoadedDie.
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         usingToThrow: aShaker
		         winningWhenReach: 1
		         using:
		         (CardDealer with: (OrderedCollection with: (CardProbability using: OverloadCard withChanceOf: 100))).
	aCard := (OverloadCard holder: 'red') selectTarget: 'blue'.
	aGame apply: aCard.
	aGame movePlayer.
	aGame movePlayer.
	aCard := (CancellationCard holder: 'red') selectTarget: 'blue'.
	self
		should: [ 
			aGame
				apply: aCard ]
		raise: Error
		withMessage: 'There are no that type of cards activate in this player or is not a valid objective'
]

{ #category : #tests }
CardsTest >> testQ029WhenPlayerPlaysARedoCardAndTheLastCardPlayedWasAPermanentCardThenCheckThatTheEffectWasRepeatedAndValidPlayersPositions [

	| aGame aLoadedDie aBoard boxes aShaker aCard |
	boxes := (BoxCreator use: (OrderedCollection with: (BoxProbability
				            using:
				            (RandomCardBox with:
					             (OrderedCollection with: (CardProbability using: RedoCard withChanceOf: 100)))
				            withChanceOf: 100))) create: 10.
	aBoard := Board with: boxes measure: (Parsec worth: 100).
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 4
			               with: 4
			               with: 1
			               with: 1).
	aShaker := DiceShaker with: aLoadedDie.
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         usingToThrow: aShaker
		         winningWhenReach: 1
		         using: (CardDealer  with:
				          (OrderedCollection with: (CardProbability using: OverloadCard withChanceOf: 100))).
	aCard := (OverloadCard  holder: 'red') selectTarget: 'blue'.
	aGame apply: aCard.
	aGame movePlayer.
	aGame movePlayer.
	aCard := (RedoCard  holder: 'red') selectTarget: 'red'.
	aGame apply: aCard.
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersBox
		equals: (OrderedCollection with: 4 with: 2)
]

{ #category : #tests }
CardsTest >> testQ030REVISARESTOYINTENTANDOAPLICARUNAREDODEUNACANCELLATION [

	| aGame aLoadedDie aBoard boxes aShaker aCard |
	boxes := (BoxCreator use: (OrderedCollection with: (BoxProbability
				            using:
				            (RandomCardBox with:
					             (OrderedCollection with: (CardProbability using: RedoCard withChanceOf: 100)))
				            withChanceOf: 100))) create: 10.
	aBoard := Board with: boxes measure: (Parsec worth: 100).
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 4
			               with: 8
			               with: 3
			               with: 4).
	aShaker := DiceShaker with: aLoadedDie.
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         usingToThrow: aShaker
		         winningWhenReach: 1
		         using:
		         (CardDealer with:
			           (OrderedCollection with: (CardProbability using: CancellationCard withChanceOf: 100))).
	aGame movePlayer.
	aGame movePlayer.
	aCard := (CancellationCard holder: 'red') selectTarget:
		         (AccelerationCard holder: 'red').
	self
		should: [ aGame apply: aCard ]
		raise: Error
		withMessage: 'There are no permanent cards'.
			
	aCard := (RedoCard holder: 'red') selectTarget:
		         (AccelerationCard holder: 'red').
	self
		should: [ aGame apply: aCard ]
		raise: Error
		withMessage: 'There are no permanent cards'
]

{ #category : #tests }
CardsTest >> testQ033WhenPlayerPlaysARedoCardAndLastCardPlayedWasARedoCardThatRepeatedTheEffectOfAPermanentCardThenRepeatAgainThatEffectAndValidPlayersPositions [

	| aGame aLoadedDie aBoard boxes aShaker aCard |
	boxes := (BoxCreator use: (OrderedCollection with: (BoxProbability
				            using:
				            (RandomCardBox with:
					             (OrderedCollection with: (CardProbability using: RedoCard withChanceOf: 100)))
				            withChanceOf: 100))) create: 10.
	aBoard := Board with: boxes measure: (Parsec worth: 100).
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 1
			               with: 1
			               with: 1).
	aShaker := DiceShaker with: aLoadedDie.
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         usingToThrow: aShaker
		         winningWhenReach: 1
		         using: (CardDealer with: (OrderedCollection with: (CardProbability using: AccelerationCard withChanceOf: 100))).
	aCard := (AccelerationCard holder: 'red').
	aGame apply: aCard.
	aGame movePlayer.
	aGame movePlayer.
	aGame movePlayer.
	aGame movePlayer.
	aCard := (RedoCard holder: 'red').
	aGame apply: aCard.
	aCard := (RedoCard holder: 'red').
	aGame apply: aCard.
	aGame movePlayer.
	aGame movePlayer.
	
	self
		assert: aGame playersBox
		equals: (OrderedCollection with: 9 with: 9)
]

{ #category : #tests }
CardsTest >> testQ034WhenPlayerPlaysARepeatCardAndLastBoxInvokedWasASpeedUpBoxThenCheckThatThisEffectWasRepeatedAndValidPlayersPositions [

	| aGame aLoadedDie boxes aBoard aShaker aCard |
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 1
			               with: 3
			               with: 4).
	aShaker := DiceShaker with: aLoadedDie.
	boxes := (BoxCreator use: (OrderedCollection with:
			           (BoxProbability using: SpeedUpBox initializeNew withChanceOf: 100))) 
		         create: 10.
	aBoard := Board with: boxes measure: (Parsec worth: 100).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         usingToThrow: aShaker
		         winningWhenReach: 1
		         using:
		         (CardDealer with: (OrderedCollection with: (CardProbability using: RepeatCard withChanceOf: 100))).
	aGame movePlayer.
	aGame movePlayer.
	aCard := (RepeatCard holder: 'red') selectTarget: 'red'.
	aGame apply: aCard.

	self
		assert: aGame playersBox
		equals: (OrderedCollection with: 10 with: 6)
]

{ #category : #tests }
CardsTest >> testQ035WhenPlayerPlaysARepeatCardAndLastBoxInvokedWasAWormHoleBoxThenCheckThatThisEffectWasRepeatedAndValidPlayersPositions [

	| aGame aLoadedDie boxes aBoard aShaker aCard |
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 4
			               with: 9
			               with: 3
			               with: 4).
	aShaker := DiceShaker with: aLoadedDie.
	boxes := (BoxCreator use: (OrderedCollection with:
			           (BoxProbability using: WormHoleBox initializeNew withChanceOf: 100))) 
		         create: 10.
	aBoard := Board with: boxes measure: (Parsec worth: 100).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         usingToThrow: aShaker
		         winningWhenReach: 1
		         using:
		         (CardDealer with: (OrderedCollection with: (CardProbability using: RepeatCard withChanceOf: 100))).

	aGame movePlayer.
	aGame movePlayer.
	aCard := (RepeatCard holder: 'red') selectTarget: 'blue'.
	aGame apply: aCard.

	self
		assert: aGame playersBox
		equals: (OrderedCollection with: 1 with: 2)
]

{ #category : #tests }
CardsTest >> testQ036WhenPlayerPlaysARepeatCardAndLastBoxInvokedWasAMoonWalkBoxThenCheckThatThisEffectWasRepeatedAndValidPlayersPositions [

	| aGame aLoadedDie boxes aBoard aShaker aCard |
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 4
			               with: 5
			               with: 3
			               with: 4).
	aShaker := DiceShaker with: aLoadedDie.
	boxes := (BoxCreator use: (OrderedCollection with:
			           (BoxProbability
				            using: (MoonWalkBox with: -2)
				            withChanceOf: 100))) create: 10.
	aBoard := Board with: boxes measure: (Parsec worth: 100).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         usingToThrow: aShaker
		         winningWhenReach: 1
		         using:
		         (CardDealer with: (OrderedCollection with: (CardProbability using: RepeatCard withChanceOf: 100))).


	aGame movePlayer.
	aGame movePlayer.
	aCard := (RepeatCard holder: 'red') selectTarget: 'red'.
	aGame apply: aCard.

	self
		assert: aGame playersBox
		equals: (OrderedCollection with: 3 with: 4)
]

{ #category : #tests }
CardsTest >> testQ037WhenPlayerPlaysARepeatCardAndLastBoxInvokedWasAnAtomicBombBoxThenCheckThatThisEffectWasRepeatedAndValidPlayersPositions [

	| aGame aLoadedDie boxes aBoard aShaker aCard |
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 4
			               with: 5
			               with: 3
			               with: 4).
	aShaker := DiceShaker with: aLoadedDie.
	boxes := (BoxCreator use: (OrderedCollection with:
			           (BoxProbability using: AtomicBombBox initializeNew withChanceOf: 100))) 
		         create: 10.
	aBoard := Board with: boxes measure: (Parsec worth: 100).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         usingToThrow: aShaker
		         winningWhenReach: 1
		         using:
		         (CardDealer with: (OrderedCollection with: (CardProbability using: RepeatCard withChanceOf: 100))).


	aGame movePlayer.
	aGame movePlayer.
	aCard := (RepeatCard holder: 'red') selectTarget: 'red'.
	aGame apply: aCard.


	self
		assert: aGame playersBox
		equals: (OrderedCollection with: 1 with: 1)
]

{ #category : #tests }
CardsTest >> testQ038WhenPlayerPlaysARepeatCardAndLastBoxInvokedWasAHyperJumpBoxThenCheckThatThisEffectWasRepeatedAndValidPlayersPositions [

	| aGame aLoadedDie boxes aBoard aShaker aCard |
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 5
			               with: 3
			               with: 4).
	aShaker := DiceShaker with: aLoadedDie.
	boxes := (BoxCreator use: (OrderedCollection with: (BoxProbability
				            using:
				            (HyperJumpBox with:
					             (OrderedCollection with: (Parsec worth: 40)))
				            withChanceOf: 100))) create: 10.
	aBoard := Board with: boxes measure: (Parsec worth: 100).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         usingToThrow: aShaker
		         winningWhenReach: 1
		         using:
		         (CardDealer with: (OrderedCollection with: (CardProbability using: RepeatCard withChanceOf: 100))).


	aGame movePlayer.
	aGame movePlayer.
	aCard := (RepeatCard holder: 'red') selectTarget: 'red'.
	aGame apply: aCard.


	self
		assert: aGame playersBox
		equals: (OrderedCollection with: 10 with: 10)
]

{ #category : #tests }
CardsTest >> testQ045WhenPlayerPlaysARedoCardAndTheLastCardPlayedWasARepeatCardThenCheckThatTheEffectWasRepeatedAndValidPlayersPositions [

	| aGame aLoadedDie boxes aBoard aShaker aCard |
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 1
			               with: 3
			               with: 4).
	aShaker := DiceShaker with: aLoadedDie.
	boxes := (BoxCreator use: (OrderedCollection with: (BoxProbability
				            using:
				            (RandomCardBox with:
					             (OrderedCollection with: (CardProbability using: RedoCard withChanceOf: 100)))
				            withChanceOf: 100))) create: 10.
	aBoard := Board with: boxes measure: (Parsec worth: 100).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         usingToThrow: aShaker
		         winningWhenReach: 1
		         using: (CardDealer with: (OrderedCollection with: (CardProbability using: RepeatCard withChanceOf: 100))).
					
	aGame movePlayer.
	aCard := (RepeatCard holder: 'red') selectTarget:  'red'.
	aGame apply: aCard.
	aCard := (RedoCard holder: 'red') selectTarget:  'blue'.
	aGame apply: aCard.
	aGame movePlayer.

	self
		assert: aGame playersCardInPosetion
		equals: (OrderedCollection with: 2 with: 4)
]

{ #category : #tests }
CardsTest >> testQ048WhenPlayerTriesToPlayAnOverloadCardOnAnInvalidObjectiveThenFails [

	| aGame aLoadedDie aBoard aShaker aCard |
	aBoard := self createBoard.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 2
			               with: 3
			               with: 4).
	aShaker := DiceShaker with: aLoadedDie.
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         usingToThrow: aShaker
		         winningWhenReach: 1
		         using:
		         (CardDealer with: (OrderedCollection with: (CardProbability using: OverloadCard withChanceOf: 100))).
	aCard := (OverloadCard holder: 'red') selectTarget:
		         (AccelerationCard holder: 'blue').
	self
		should: [ aGame apply: aCard ]
		raise: Error
		withMessage: 'That is not a valid objective'
]

{ #category : #tests }
CardsTest >> testQ050WhenPlayerTriesToPlayASpeedCardOnAnInvalidObjectiveThenFails [

	| aGame aLoadedDie aBoard aShaker aCard |
	aBoard := self createBoard.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 2
			               with: 3
			               with: 4).
	aShaker := DiceShaker with: aLoadedDie.
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         usingToThrow: aShaker
		         winningWhenReach: 1
		         using:
		         (CardDealer with: (OrderedCollection with: (CardProbability using: SpeedCard withChanceOf: 100))).
	aCard := (SpeedCard holder: 'red') selectTarget:  (AccelerationCard holder: 'blue').
	self
		should: [ 
			aGame
				apply: aCard]
		raise: Error
		withMessage: 'That is not a valid objective'
]

{ #category : #tests }
CardsTest >> testQ051WhenPlayerTriesToPlayARepeatCardOnAnInvalidObjectiveThenFails [

	| aGame aLoadedDie aBoard aShaker aCard |
	aBoard := self createBoard.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 2
			               with: 3
			               with: 4).
	aShaker := DiceShaker with: aLoadedDie.
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         usingToThrow: aShaker
		         winningWhenReach: 1
		         using:
		         (CardDealer with: (OrderedCollection with: (CardProbability using: RepeatCard withChanceOf: 100))).
	aCard := (RepeatCard holder: 'red') selectTarget: 'pepe'.
	self
		should: [ 
		aGame apply:aCard ]
		raise: Error
		withMessage: 'That is not a valid objective'
]

{ #category : #tests }
CardsTest >> testQ052WhenPlayerTriesToPlayARedoCardAndNoOtherCardsWerePlayedBeforeThenFails [

	| aGame aLoadedDie aBoard aShaker aCard |
	aBoard := self createBoard.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 2
			               with: 3
			               with: 4).
	aShaker := DiceShaker with: aLoadedDie.
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         usingToThrow: aShaker
		         winningWhenReach: 1
		         using:
		         (CardDealer with: (OrderedCollection with: (CardProbability using: RedoCard withChanceOf: 100))).
	aCard := (RedoCard holder: 'red') selectTarget:  'blue'.
	self
		should: [ aGame apply: aCard ]
		raise: Error
		withMessage:
		'Redo card cannot be played because there are no cards that have been played before'
]

{ #category : #tests }
CardsTest >> testQ053WhenPlayerPlaysASpeedBoostCardOnAnOverloadCardThenCheckThatTheOverloadCardEffectWasDuplicatedAndValidPlayersPositions [

	| boxes aGame aLoadedDie aBoard aShaker aCard |
	boxes := (BoxCreator use: (OrderedCollection with: (BoxProbability
				            using: (RandomCardBox with: (OrderedCollection with:
							              (CardProbability
								               using: SpeedBoostCard
								               withChanceOf: 100)))
				            withChanceOf: 100))) create: 10.
	aBoard := Board with: boxes measure: (Parsec worth: 100).
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 2
			               with: 3
			               with: 2
			               with: 3).
	aShaker := DiceShaker with: aLoadedDie.
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         usingToThrow: aShaker
		         winningWhenReach: 2
		         using: (CardDealer with: (OrderedCollection with:
					           (CardProbability using: OverloadCard withChanceOf: 100))).
	aCard := (OverloadCard holder: 'red') selectTarget: 'blue'.
	aGame apply: aCard.
	aGame movePlayer.
	aGame movePlayer.
	aCard := (SpeedBoostCard holder: 'red') selectTarget:
		         (OverloadCard holder: 'blue').
	aGame apply: aCard.
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersBox
		equals: (OrderedCollection with: 5 with: 1)
]

{ #category : #tests }
CardsTest >> testQ054WhenPlayerPlaysASpeedBoostCardOnASpeedCardThenCheckThatTheSpeedCardEffectWasDuplicatedAndValidPlayersPositions [

	| boxes aGame aLoadedDie aBoard aShaker aCard |
	boxes := (BoxCreator use: (OrderedCollection with: (BoxProbability
				            using: (RandomCardBox with: (OrderedCollection with:
							              (CardProbability
								               using: SpeedBoostCard
								               withChanceOf: 100)))
				            withChanceOf: 100))) create: 10.
	aBoard := Board with: boxes measure: (Parsec worth: 100).
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 2
			               with: 3
			               with: 2
			               with: 3).
	aShaker := DiceShaker with: aLoadedDie.
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         usingToThrow: aShaker
		         winningWhenReach: 2
		         using: (CardDealer with: (OrderedCollection with:
					           (CardProbability using: SpeedCard withChanceOf: 100))).
	aCard := (SpeedCard holder: 'red') selectTarget: 'red'.
	aGame apply: aCard.
	aGame movePlayer.
	aGame movePlayer.
	aCard := (SpeedBoostCard holder: 'red') selectTarget:
		         (SpeedCard holder: 'red').
	aGame apply: aCard.
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersBox
		equals: (OrderedCollection with: 8 with: 7)
]

{ #category : #tests }
CardsTest >> testQ055WhenPlayerPlaysASpeedBoostCardOnAnAccelerationCardThenCheckThatTheAccelerationCardEffectWasDuplicatedAndValidPlayersPositions [

	| boxes aGame aLoadedDie aBoard aShaker aCard |
	boxes := (BoxCreator use: (OrderedCollection with: (BoxProbability
				            using: (RandomCardBox with: (OrderedCollection with:
							              (CardProbability
								               using: SpeedBoostCard
								               withChanceOf: 100)))
				            withChanceOf: 100))) create: 10.
	aBoard := Board with: boxes measure: (Parsec worth: 100).
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 2
			               with: 3
			               with: 4).
	aShaker := DiceShaker with: aLoadedDie.
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         usingToThrow: aShaker
		         winningWhenReach: 2
		         using: (CardDealer with: (OrderedCollection with:
					           (CardProbability using: AccelerationCard withChanceOf: 100))).
	aCard := (AccelerationCard holder: 'red').
	aGame apply: aCard.
	aGame movePlayer.
	aGame movePlayer.
	aCard := (SpeedBoostCard holder: 'red') selectTarget: (AccelerationCard holder: 'red').
	aGame apply: aCard.
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersBox
		equals: (OrderedCollection with: 8 with: 10)
]

{ #category : #tests }
CardsTest >> testQ059WhenPlayerTriesToPlayASpeedBoostCardOnANonExistentCardThenFails [

	| boxes aGame aLoadedDie aBoard aShaker aCard |
	boxes := (BoxCreator use: (OrderedCollection with: (BoxProbability
				            using: (RandomCardBox with: (OrderedCollection with:
							              (CardProbability
								               using: SpeedBoostCard
								               withChanceOf: 100)))
				            withChanceOf: 100))) create: 10.
	aBoard := Board with: boxes measure: (Parsec worth: 100).
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 2
			               with: 3
			               with: 2
			               with: 3).
	aShaker := DiceShaker with: aLoadedDie.
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         usingToThrow: aShaker
		         winningWhenReach: 2
		         using: (CardDealer with: (OrderedCollection with:
					           (CardProbability using: OverloadCard withChanceOf: 100))).
	aCard := (OverloadCard  holder: 'red') selectTarget: 'blue'.
	aGame apply: aCard. 
	aGame movePlayer.
	aCard := (SpeedBoostCard holder: 'red') selectTarget:
		         (OverloadCard holder: 'red').
self
		should: [ 
			aGame
				apply: aCard ]
		raise: Error
		withMessage: 'There are no that type of cards activate in this player or is not a valid objective'
]

{ #category : #tests }
CardsTest >> testQ060WhenPlayerPlaysAReversePolarityCardOnASpeedUpBoxThenCheckThatTheBoxAffectOtherPlayersAndValidPlayersPositions [

	| aLoadedDie aGame boxes aBoard aShaker aCard |
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 1
			               with: 1
			               with: 1).
	boxes := (BoxCreator use:
		          (OrderedCollection with:  (BoxProbability using: SpeedUpBox initializeNew withChanceOf: 100)))
		         create: 10.
	aBoard := Board with: boxes measure: (Parsec worth: 100).
	aShaker := DiceShaker with: aLoadedDie.
	
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         usingToThrow: aShaker
		         winningWhenReach: 2
		         using: (CardDealer with: (OrderedCollection with: (CardProbability using: ReversePolarityCard withChanceOf: 100))).
	aCard := (ReversePolarityCard holder: 'red') selectTarget: 2.
	aGame apply: aCard.
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersBox
		equals: (OrderedCollection with:2  with: 10)
]
