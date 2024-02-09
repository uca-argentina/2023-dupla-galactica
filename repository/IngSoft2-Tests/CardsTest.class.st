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
CardsTest >> testQ001VerifyTheCorrectUseOfOverloadCard [

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
CardsTest >> testQ002VerifyTheCorrectUseOfOverloadCardWhenThrowingMoreThanOneTime [

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
CardsTest >> testQ003VerifyTheCorrectUseOfOverloadCardWhenThePlayerHasToGoBackwardsDueToANegativeEffect [

	| aGame aLoadedDie aBoard aShaker aCard |
	aBoard := self createBoard.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 5
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
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersBox
		equals: (OrderedCollection with: 5 with: 2)
]

{ #category : #tests }
CardsTest >> testQ004VerifyTheCorrectUseOfOverloadCardWhenThePlayerHasToGoBackwardsInTheFirstLapDueToANegativeEffect [

	| aGame aLoadedDie aBoard aRedPosition aBluePosition aShaker aCard |
	aRedPosition := (Position atTheBeginning) move: 1.
	aBluePosition := (Position atTheBeginning).
	
	aBoard := self createBoard.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 0
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
		assert: aGame playersPositions 
		equals: (OrderedCollection with: aRedPosition with: aBluePosition)
	
]

{ #category : #tests }
CardsTest >> testQ005VerifyTheCorrectUseOfASpeedCard [

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
CardsTest >> testQ006VerifyTheCorrectUseOfASpeedCardWhenThrowingMoreThanOneTime [

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
CardsTest >> testQ007VerifyTheCorrectUseOfASpeedCardWhenHasToRaiseALap [

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
CardsTest >> testQ008VerifyTheCorrectUseOfPermanentCardsWhenAPlayerHasMoreThanOneActive [

	| aGame aLoadedDie aBoard aShaker aCard aSecondCard |
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
	aSecondCard := (OverloadCard holder: 'red') selectTarget: 'red'.
	aGame apply: aSecondCard.
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersBox
		equals: (OrderedCollection with: 2 with: 3)
]

{ #category : #tests }
CardsTest >> testQ009VerifyTheCorrectUseOfAccelerationCard [

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
	aCard := (AccelerationCard holder: 'red') selectTarget: 'red'.
	aGame apply: aCard.
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersBox
		equals: (OrderedCollection with: 3 with: 4)
]

{ #category : #tests }
CardsTest >> testQ010VerifyTheCorrectUseOfAccelerationCardWhenHasToRaiseALap [

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
		assert: aGame playersBox
		equals: (OrderedCollection with: 10 with: 1)
]

{ #category : #tests }
CardsTest >> testQ011VerifyTheCorrectUseOfCancellationCard [

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
CardsTest >> testQ012VerifyTheCorrectUseOfCancellationCardWhenThePlayerHasMoreThanOneCard [

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
CardsTest >> testQ013VerifyTheCorrectUseOfTwoCancellationCards [

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
CardsTest >> testQ014TryToCancellAPermanentCardWhenThePlayerDoesNotHaveOne [

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
CardsTest >> testQ015TryToCancellAPermanentCardWithATypeOfCardThatIsNotActivate [

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
		         (OverloadCard holder: 'red').
	self
		should: [ aGame apply: aCard ]
		raise: Error
		withMessage:
		'There are no that type of cards activate in this player or is not a valid objective'
]

{ #category : #tests }
CardsTest >> testQ017TryToUseAnOverLoadCardWhenThePlayerDoesNotHaveOne [

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
CardsTest >> testQ018TryToUseASpeedCardWhenThePlayerDoesNotHaveOne [

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
CardsTest >> testQ019TryToUseAnAccelerationCardWhenThePlayerDoesNotHaveOne [

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
CardsTest >> testQ020UseTwoOverLoadCardsFromTheSamePlayerToTheSamePlayer [

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
		         (CardDealer with: (OrderedCollection with: (CardProbability using: OverloadCard withChanceOf: 100))).
	aCard := (OverloadCard holder: 'red') selectTarget: 'blue'.
	aGame apply: aCard.
	aCard := (OverloadCard holder: 'red') selectTarget: 'blue'.
	aGame apply: aCard.

	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersBox
		equals: (OrderedCollection with: 2 with: 1)
]

{ #category : #tests }
CardsTest >> testQ021UseAnOverLoadCardAndThenTryToUseItAgainButItHasGoneAway [

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
CardsTest >> testQ022UseTwoSpeedCardsFromTheSamePlayerToTheSamePlayer [

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
	aCard := (SpeedCard holder: 'red') selectTarget: 'red'.
	aGame apply: aCard.

	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersBox
		equals: (OrderedCollection with: 4 with: 5)
]

{ #category : #tests }
CardsTest >> testQ023UseASpeedCardAndThenTryToUseItAgainButItHasGoneAway [

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
		         (CardDealer with:(OrderedCollection with: (CardProbability using: SpeedCard withChanceOf: 100))).
	aCard := (SpeedCard holder: 'red') selectTarget: 'red'.
	aGame apply: aCard.
	aCard := (SpeedCard holder: 'red') selectTarget: 'red'.
	aGame apply: aCard.
	aCard := (SpeedCard holder: 'red') selectTarget: 'red'.
	self
		should: [ 
			aGame
				apply: aCard]
		raise: Error
		withMessage: 'The player does not have that card in posetion'
]

{ #category : #tests }
CardsTest >> testQ024UseTwoAccelerationCardsFromTheSamePlayer [

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
		         (CardDealer with:
			          (OrderedCollection with: (CardProbability using: AccelerationCard withChanceOf: 100))).
	aCard := (AccelerationCard holder: 'red').
	aGame apply: aCard.
	aCard := (AccelerationCard holder: 'red').
	aGame apply: aCard.
	
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersBox
		equals: (OrderedCollection with: 4 with: 7)
]

{ #category : #tests }
CardsTest >> testQ025UseAnAccelerationCardAnThenTryToUseItAgainButItHasGoneAway [

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
		         (CardDealer with:
			          (OrderedCollection with: (CardProbability using: AccelerationCard withChanceOf: 100))).
	aCard := (AccelerationCard holder: 'red').
	aGame apply: aCard.
	aCard := (AccelerationCard holder: 'red').
	aGame apply: aCard.
	aCard := (AccelerationCard holder: 'red').
	self
		should: [ aGame apply: aCard ]
		raise: Error
		withMessage: 'The player does not have that card in posetion'
]

{ #category : #tests }
CardsTest >> testQ026TryToUseACancellationCardWhenThePlayerDoesNotHaveOne [

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
		         (CardDealer with:(OrderedCollection with: (CardProbability using: OverloadCard withChanceOf: 100))).

	aCard := (OverloadCard holder: 'red') selectTarget: 'blue'.
	aGame apply: aCard.
	aCard := (CancellationCard holder: 'red') selectTarget: 'blue'.
	self
		should: [ 
			aGame
				apply: aCard ]
		raise: Error
		withMessage: 'The player does not have that card in posetion'
]

{ #category : #tests }
CardsTest >> testQ026TryToUseACancellationCardWithANonValidObjective [

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
CardsTest >> testQ027UseTwoCancellationCardsFromTheSamePlayer [

	| aGame aLoadedDie aBoard boxes aShaker aCard |
	boxes := (BoxCreator use: (OrderedCollection with: (BoxProbability
				            using:
				            (RandomCardBox with:
					              (OrderedCollection with: (CardProbability using: CancellationCard withChanceOf: 100)))
				            withChanceOf: 100))) create: 10.
	aBoard := Board with: boxes measure: (Parsec worth: 100).

	aLoadedDie := LoadedDie with:
		              (OrderedCollection with: 1 with: 1 with: 1 with: 1).
	aShaker := DiceShaker with: aLoadedDie.
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         usingToThrow: aShaker
		         winningWhenReach: 2
		         using:
		         (CardDealer with:
			          (OrderedCollection with: (CardProbability using: AccelerationCard withChanceOf: 100))).
	aCard := (AccelerationCard holder: 'red') selectTarget: 'red'.
	aGame apply: aCard.
	aCard := (AccelerationCard holder: 'red').
	aGame apply: aCard.
	aGame movePlayer.
	aGame movePlayer.
	aGame movePlayer.
	aGame movePlayer.
	aCard := (CancellationCard holder: 'red') selectTarget: (AccelerationCard holder: 'red').
	aGame apply: aCard.
	aCard := (CancellationCard holder: 'red') selectTarget: (AccelerationCard holder: 'red').
	aGame apply: aCard.
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersBox
		equals: (OrderedCollection with: 8 with: 8)
]

{ #category : #tests }
CardsTest >> testQ029VerifyTheCorrectUseOfRedoCardWhenLastCardPlayIsAnOverloadCard [

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
CardsTest >> testQ030VerifyTheCorrectUseOfRedoCardWhenLastCardPlayedIsACancellationCard [

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
CardsTest >> testQ031VerifyTheCorrectUseOfRedoCardWhenLastCardPlayedIsASpeedCard [

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
		         using:
		         (CardDealer with: (OrderedCollection with: (CardProbability using: SpeedCard withChanceOf: 100))).
	aCard := (SpeedCard holder: 'red') selectTarget: 'red'.
	aGame apply: aCard.
	aGame movePlayer.
	aGame movePlayer.

	aCard := (RedoCard holder: 'red') selectTarget: 'blue'.
	aGame apply: aCard.

	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersBox
		equals: (OrderedCollection with: 5 with: 4)
]

{ #category : #tests }
CardsTest >> testQ032VerifyTheCorrectUseOfRedoCardWhenLastCardPlayedIsAnAccelerationCard [

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
	
	aCard := (RedoCard holder: 'red').
	aGame apply: aCard.

	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersBox
		equals: (OrderedCollection with: 6 with: 6)
]

{ #category : #tests }
CardsTest >> testQ033VerifyTheCorrectUseOfRedoCardWhenLastCardPlayedIsARedoCard [

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
CardsTest >> testQ034VerifyTheCorrectUseOfRepeatCardWhenLastBoxIsASpeedUpOne [

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
CardsTest >> testQ035VerifyTheCorrectUseOfRepeatCardWhenLastBoxIsAWormHoleOne [

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
CardsTest >> testQ036VerifyTheCorrectUseOfRepeatCardWhenLastBoxIsAMoonWalkOne [

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
CardsTest >> testQ037VerifyTheCorrectUseOfRepeatCardWhenLastBoxIsAnAtomicBombOne [

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
CardsTest >> testQ038VerifyTheCorrectUseOfRepeatCardWhenLastBoxIsHyperJumpOne [

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
CardsTest >> testQ039VerifyThatAccelerationCardCanOnlyBePlayedAtPlayersTurns [

	| aGame aLoadedDie aBoard aShaker |
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
		         (CardDealer with:
			          (OrderedCollection with: (CardProbability using: AccelerationCard withChanceOf: 100))).
	aGame movePlayer.
	self
		should: [ 
			aGame
				apply: (AccelerationCard holder: 'red') ]
		raise: Error
		withMessage:
		'A permanent card can only be use when it is your turn'.
]

{ #category : #tests }
CardsTest >> testQ041VerifyThatSpeedCardCanOnlyBePlayedAtPlayersTurns [

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
	aGame movePlayer.
	aCard := (SpeedCard holder: 'red') selectTarget: 'red'.
	self
		should: [ aGame apply: aCard ]
		raise: Error
		withMessage: 'A permanent card can only be use when it is your turn'
]

{ #category : #tests }
CardsTest >> testQ042VerifyThatCancellationCardCanBePlayWheneverThePlayerWants [

	| aGame aLoadedDie aBoard boxes aShaker aCard |
	boxes := (BoxCreator use: (OrderedCollection with: (BoxProbability
				            using:
				            (RandomCardBox with:
					              (OrderedCollection with: (CardProbability using: CancellationCard withChanceOf: 100)))
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
		         using:
		         (CardDealer with:
			          (OrderedCollection with: (CardProbability using: AccelerationCard withChanceOf: 100))).
	aCard := AccelerationCard holder: 'red'.
	aGame apply: aCard.
	aGame movePlayer.
	aCard := (CancellationCard holder: 'red') selectTarget:
		         (AccelerationCard holder: 'blue').
	aGame apply: aCard.
	aGame movePlayer.

	self
		assert: aGame playersBox
		equals: (OrderedCollection with: 3 with: 2)
]

{ #category : #tests }
CardsTest >> testQ043VerifyThatRedoCardCanBePlayWheneverThePlayerWants [

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
		         using:
		         (CardDealer with:
			          (OrderedCollection with: (CardProbability using: AccelerationCard withChanceOf: 100))).
	aCard := AccelerationCard holder: 'red'.
	aGame apply: aCard.
	aGame movePlayer.
	aCard := RedoCard holder: 'red'.
	aGame apply: aCard.
	aGame movePlayer.

	self
		assert: aGame playersBox
		equals: (OrderedCollection with: 3 with: 4)
]

{ #category : #tests }
CardsTest >> testQ044VerifyThatRepeatCardCanBePlayWheneverThePlayerWants [

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
	aCard := (RepeatCard holder: 'red') selectTarget:  'red'.
	aGame apply: aCard.
	aGame movePlayer.

	self
		assert: aGame playersBox
		equals: (OrderedCollection with: 10 with: 6)
]

{ #category : #tests }
CardsTest >> testQ045VerifyThatRedoCardCanRepeatTheEffectOfTheRepeatCard [

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
CardsTest >> testQ048VerifyThatWhenUsingAnOverloadCardTheObjectiveMustBeAValidPlayer [

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
CardsTest >> testQ050VerifyThatWhenUsingASpeedCardTheObjectiveMustBeAValidPlayer [

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
CardsTest >> testQ051VerifyThatWhenUsingARepeatCardTheObjectiveMustBeAValidPlayer [

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
CardsTest >> testQ052VerifyThatWhenUsingARedoCardACardHasToBeenPlayedBefore [

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
	aCard := (RedoCard holder: 'red') selectTarget:  'pepe'.
	self
		should: [ aGame apply: aCard ]
		raise: Error
		withMessage:
		'Redo card cannot be played because there are no cards that have been played before'
]

{ #category : #tests }
CardsTest >> testQ053VerifyTheCorrectUseOfSpeedBoostCardWithAnOverloadCard [

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
CardsTest >> testQ054VerifyTheCorrectUseOfSpeedBoostCardWithASpeedCard [

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
CardsTest >> testQ055VerifyTheCorrectUseOfSpeedBoostCardWithAnAccelerationCard [

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
CardsTest >> testQ056VerifyTheCorrectUseOfSpeedBoostCardWithAnAccelerationCardWhenThereAreTwoActiveAccelerationCards [

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
			               with: 1
			               with: 1
			               with: 1).
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
		equals: (OrderedCollection with: 8 with: 8)
]

{ #category : #tests }
CardsTest >> testQ057VerifyTheCorrectUseOfTwoSpeedBoostCardsWithAnAccelerationCard [

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
			               with: 1
			               with: 1
			               with: 1).
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
	aCard := (SpeedBoostCard holder: 'blue') selectTarget: (AccelerationCard holder: 'red').
	aGame apply: aCard.
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersBox
		equals: (OrderedCollection with: 8 with: 8)
]

{ #category : #tests }
CardsTest >> testQ058VerifyTheCorrectUseOfTwoSpeedBoostCardsWithTwoAccelerationCards [

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
			               with: 1
			               with: 1
			               with: 1).
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
	aCard := (AccelerationCard holder: 'red').
	aGame apply: aCard.
	aGame movePlayer.
	aGame movePlayer.
	aCard := (SpeedBoostCard holder: 'red') selectTarget: (AccelerationCard holder: 'red').
	aGame apply: aCard.
	aCard := (SpeedBoostCard holder: 'blue') selectTarget: (AccelerationCard holder: 'red').
	aGame apply: aCard.
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersBox
		equals: (OrderedCollection with: 10 with: 10)
]

{ #category : #tests }
CardsTest >> testQ059TryToApplyASpeedBoostCardToAnNonExistentCard [

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
CardsTest >> testQ060VerifyTheCorrectUseOfAReversePolarityCard [

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
