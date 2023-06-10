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
	boxes := (BoxCreator use: (OrderedCollection with: (BoxProbability using: NoEffectBox new withChance: 100))) create: 10.
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

	| aGame aLoadedDie aBoard|
	aBoard := self createBoard.
	aLoadedDie:= LoadedDie with: (OrderedCollection
				           with: 1
				           with: 2
				           with: 3
				           with: 4).
	aGame := DuplaGalacticaGameProxy
		           with: aColorCollection
		           and: aBoard
		           throwing: aLoadedDie
		           winningWhen: 1
		           using: (LoadedCardDealer with: (OrderedCollection with: (OverloadCard owner: 'red' number: 1))).
	aGame apply: (OverloadCard owner: 'red' number: 1) to: 'blue'.
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersPositions
		equals: (OrderedCollection with: 2 with: 1)
]

{ #category : #tests }
CardsTest >> testQ002VerifyTheCorrectUseOfOverloadCardWhenThrowingMoreThanOneTime [

	| aGame aLoadedDie aBoard |
	aBoard := self createBoard.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 2
			               with: 3
			               with: 4).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         throwing: aLoadedDie
		         winningWhen: 1
		         using:
		         (LoadedCardDealer with:
			          (OrderedCollection with: (OverloadCard owner: 'red' number: 1))).
	aGame apply: (OverloadCard owner: 'red' number: 1) to: 'blue'.
	aGame movePlayer.
	aGame movePlayer.
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersPositions
		equals: (OrderedCollection with: 5 with: 3)
]

{ #category : #tests }
CardsTest >> testQ003VerifyTheCorrectUseOfOverloadCardWhenThePlayerHasToGoBackwardsDueToANegativeEffect [

	| aGame aLoadedDie aBoard |
	aBoard := self createBoard.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 5
			               with: 3
			               with: 0).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         throwing: aLoadedDie
		         winningWhen: 1
		         using:
		         (LoadedCardDealer with:
			          (OrderedCollection with: (OverloadCard owner: 'red' number: 1))).
	aGame apply: (OverloadCard owner: 'red' number: 1) to: 'blue'.
	aGame movePlayer.
	aGame movePlayer.
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersPositions
		equals: (OrderedCollection with: 5 with: 2)
]

{ #category : #tests }
CardsTest >> testQ004VerifyTheCorrectUseOfOverloadCardWhenThePlayerHasToGoBackwardsInTheFirstLapDueToANegativeEffect [

	| aGame aLoadedDie aBoard |
	aBoard := self createBoard.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 0
			               with: 3
			               with: 4).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         throwing: aLoadedDie
		         winningWhen: 1
		         using:
		         (LoadedCardDealer with:
			          (OrderedCollection with: (OverloadCard owner: 'red' number: 1))).
	aGame apply: (OverloadCard owner: 'red' number: 1) to: 'blue'.
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersPositions
		equals: (OrderedCollection with: 2 with: 1)
]

{ #category : #tests }
CardsTest >> testQ005VerifyTheCorrectUseOfASpeedCard [

	| aGame aLoadedDie aBoard |
	aBoard := self createBoard.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 4
			               with: 3
			               with: 4).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         throwing: aLoadedDie
		         winningWhen: 1
		         using:
		         (LoadedCardDealer with:
			          (OrderedCollection with: (SpeedCard owner: 'red' number: 1))).
	aGame apply: (SpeedCard owner: 'red' number: 1) to: 'red'.
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersPositions
		equals: (OrderedCollection with: 3 with: 5)
]

{ #category : #tests }
CardsTest >> testQ006VerifyTheCorrectUseOfASpeedCardWhenThrowingMoreThanOneTime [

	| aGame aLoadedDie aBoard |
	aBoard := self createBoard.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 2
			               with: 3
			               with: 5).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         throwing: aLoadedDie
		         winningWhen: 1
		         using:
		         (LoadedCardDealer with:
			          (OrderedCollection with: (SpeedCard owner: 'red' number: 1))).
	aGame apply: (SpeedCard owner: 'red' number: 1) to: 'red'.
	aGame movePlayer.
	aGame movePlayer.
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersPositions
		equals: (OrderedCollection with: 7 with: 8)
]

{ #category : #tests }
CardsTest >> testQ007VerifyTheCorrectUseOfASpeedCardWhenHasToRaiseALap [

	| aGame aLoadedDie aBoard |
	aBoard := self createBoard.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 9
			               with: 2
			               with: 3
			               with: 5).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         throwing: aLoadedDie
		         winningWhen: 1
		         using:
		         (LoadedCardDealer with:
			          (OrderedCollection with: (SpeedCard owner: 'red' number: 1))).
	aGame apply: (SpeedCard owner: 'red' number: 1) to: 'red'.
	aGame movePlayer.
	self
		assert: aGame playersLaps
		equals: (OrderedCollection with: 1 with: 0)
]

{ #category : #tests }
CardsTest >> testQ008VerifyTheCorrectUseOfPermanentCardsWhenAPlayerHasMoreThanOneActive [

	| aGame aLoadedDie aBoard |
	aBoard := self createBoard.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 5
			               with: 2
			               with: 3
			               with: 5).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         throwing: aLoadedDie
		         winningWhen: 1
		         using: (LoadedCardDealer with: (OrderedCollection
					           with: (SpeedCard owner: 'red' number: 1)
					           with: (OverloadCard owner: 'red' number: 2))).

	aGame apply: (SpeedCard owner: 'red' number: 1) to: 'red'.
	aGame apply: (OverloadCard owner: 'red' number: 2) to: 'red'.
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersPositions
		equals: (OrderedCollection with: 5 with: 3)
]

{ #category : #tests }
CardsTest >> testQ009VerifyTheCorrectUseOfAccelerationCard [

	| aGame aLoadedDie aBoard |
	aBoard := self createBoard.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 2
			               with: 3
			               with: 4).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         throwing: aLoadedDie
		         winningWhen: 1
		         using:
		         (LoadedCardDealer with:
			          (OrderedCollection with: (AccelerationCard owner: 'red' number: 1))).
	aGame apply: (AccelerationCard owner: 'red' number: 1) to: 'all'.
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersPositions
		equals: (OrderedCollection with: 3 with: 4)
]

{ #category : #tests }
CardsTest >> testQ010VerifyTheCorrectUseOfAccelerationCardWhenHasToRaiseALap [

	| aGame aLoadedDie aBoard |
	aBoard := self createBoard.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 8
			               with: 9
			               with: 3
			               with: 4).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         throwing: aLoadedDie
		         winningWhen: 1
		         using:
		         (LoadedCardDealer with:
			          (OrderedCollection with: (AccelerationCard owner: 'red' number: 1))).
	aGame apply: (AccelerationCard owner: 'red' number: 1) to: 'all'.
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersPositions
		equals: (OrderedCollection with: 10 with: 1)
]

{ #category : #tests }
CardsTest >> testQ011VerifyTheCorrectUseOfCancellationCard [

	| aGame aLoadedDie aBoard |
	aBoard := self createBoard.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 2
			               with: 3
			               with: 4).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         throwing: aLoadedDie
		         winningWhen: 1
		         using: (LoadedCardDealer with: (OrderedCollection
					           with: (CancellationCard owner: 'red' number: 1)
					           with: (OverloadCard owner: 'red' number: 2))).

	aGame apply: (OverloadCard owner: 'red' number: 2) to: 'blue'.
	aGame movePlayer.
	aGame movePlayer.
	aGame
		apply: (CancellationCard owner: 'red' number: 1) to: (OverloadCard owner: 'blue' number: 2).
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersPositions
		equals: (OrderedCollection with: 5 with: 5)
]

{ #category : #tests }
CardsTest >> testQ012VerifyTheCorrectUseOfCancellationCardWhenThePlayerHasMoreThanOneCard [

	| aGame aLoadedDie aBoard |
	aBoard := self createBoard.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 2
			               with: 3
			               with: 4).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         throwing: aLoadedDie
		         winningWhen: 1
		         using: (LoadedCardDealer with: (OrderedCollection
					           with: (SpeedCard owner: 'red' number: 1)
					           with: (OverloadCard owner: 'red' number: 2)
					           with: (CancellationCard owner: 'blue' number: 3))).
	aGame apply: (OverloadCard owner: 'red' number: 2) to: 'blue'.
	aGame apply: (SpeedCard owner: 'red' number: 1) to: 'blue'.
	aGame movePlayer.
	aGame movePlayer.
	aGame
		apply: (CancellationCard owner: 'blue' number: 3) to: (SpeedCard owner: 'blue' number: 1).
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersPositions
		equals: (OrderedCollection with: 5 with: 4)
]

{ #category : #tests }
CardsTest >> testQ013VerifyTheCorrectUseOfTwoCancellationCards [

	| aGame aLoadedDie aBoard |
	aBoard := self createBoard.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 2
			               with: 3
			               with: 4).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         throwing: aLoadedDie
		         winningWhen: 1
		         using: (LoadedCardDealer with: (OrderedCollection
					           with: (CancellationCard owner: 'red' number: 1)
					           with: (OverloadCard owner: 'red' number: 2)
					           with: (CancellationCard owner: 'blue' number: 3)
					           with: (SpeedCard owner: 'blue' number: 4))).
	aGame apply: (OverloadCard owner: 'red' number: 2) to: 'blue'.
	aGame movePlayer.
	aGame apply: (SpeedCard owner: 'blue' number: 4) to: 'blue'.
	aGame movePlayer.
	aGame
		apply: (CancellationCard owner: 'red' number: 1)
		to: (SpeedCard owner: 'blue' number: 4).
	aGame movePlayer.
	aGame movePlayer.
	aGame
		apply: (CancellationCard owner: 'blue' number: 3)
		to: (OverloadCard owner: 'blue' number: 2).
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersPositions
		equals: (OrderedCollection with: 6 with: 6)
]

{ #category : #tests }
CardsTest >> testQ014TryToCancellAPermanentCardWhenThePlayerDoesNotHaveOne [

	| aGame aLoadedDie aBoard |
	aBoard := self createBoard.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 2
			               with: 3
			               with: 4).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         throwing: aLoadedDie
		         winningWhen: 1
		         using:
		         (LoadedCardDealer with:
			          (OrderedCollection with: (CancellationCard owner: 'red' number: 1))).
	self
		should: [ 
			aGame
				apply: (CancellationCard owner: 'red' number: 1)
				to: (OverloadCard owner: 'red' number: 2) ]
		raise: Error
		withMessage: 'There are no permanent cards'
]

{ #category : #tests }
CardsTest >> testQ015TryToCancellAPermanentCardWithATypeOfCardThatIsNotActivate [

	| aGame aLoadedDie aBoard |
	aBoard := self createBoard.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 2
			               with: 3
			               with: 4).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         throwing: aLoadedDie
		         winningWhen: 1
		         using: (LoadedCardDealer with:
				          (OrderedCollection
					           with: (CancellationCard owner: 'red' number: 1)
					           with: (OverloadCard owner: 'red' number: 2))).
	aGame apply: (OverloadCard owner: 'red' number: 2) to: 'blue'.

	self
		should: [ 
			aGame
				apply: (CancellationCard owner: 'red' number: 1) to: (OverloadCard owner: 'red' number: 2) ]
		raise: Error
		withMessage:
		'There are no that type of cards activate in this player'
]

{ #category : #tests }
CardsTest >> testQ017TryToUseAnOverLoadCardWhenThePlayerDoesNotHaveOne [

	| aGame aLoadedDie aBoard |
	aBoard := self createBoard.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 2
			               with: 3
			               with: 4).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         throwing: aLoadedDie
		         winningWhen: 1
		         using:
		         (LoadedCardDealer with:
			          (OrderedCollection with: (OverloadCard owner: 'red' number: 1))).
	aGame apply: (OverloadCard owner: 'blue' number: 1) to: 'red'.

	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersPositions
		equals: (OrderedCollection with: 2 with: 3)
]

{ #category : #tests }
CardsTest >> testQ018TryToUseASpeedCardWhenThePlayerDoesNotHaveOne [

	| aGame aLoadedDie aBoard |
	aBoard := self createBoard.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 2
			               with: 3
			               with: 4).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         throwing: aLoadedDie
		         winningWhen: 1
		         using:
		         (LoadedCardDealer with:
			          (OrderedCollection with: (SpeedCard owner: 'red' number: 1))).
	aGame apply: (SpeedCard owner: 'blue' number: 1) to: 'blue'.
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersPositions
		equals: (OrderedCollection with: 2 with: 3)
]

{ #category : #tests }
CardsTest >> testQ019TryToUseAnAccelerationCardWhenThePlayerDoesNotHaveOne [

	| aGame aLoadedDie aBoard |
	aBoard := self createBoard.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 2
			               with: 3
			               with: 4).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         throwing: aLoadedDie
		         winningWhen: 1
		         using:
		         (LoadedCardDealer with:
			          (OrderedCollection with: (AccelerationCard owner: 'red' number: 1))).
	aGame apply: (AccelerationCard owner: 'blue' number: 1) to: 'all'.

	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersPositions
		equals: (OrderedCollection with: 2 with: 3)
]

{ #category : #tests }
CardsTest >> testQ020UseTwoOverLoadCardsFromTheSamePlayerToTheSamePlayer [

	| aGame aLoadedDie aBoard |
	aBoard := self createBoard.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 4
			               with: 3
			               with: 4).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         throwing: aLoadedDie
		         winningWhen: 1
		         using: (LoadedCardDealer with:
				          (OrderedCollection
					           with: (OverloadCard owner: 'red' number: 1)
					           with: (OverloadCard owner: 'red' number: 2))).
	aGame apply: (OverloadCard owner: 'red' number: 1) to: 'blue'.
	aGame apply: (OverloadCard owner: 'red' number: 2) to: 'blue'.

	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersPositions
		equals: (OrderedCollection with: 2 with: 1)
]

{ #category : #tests }
CardsTest >> testQ021UseAnOverLoadCardAndThenTryToUseItAgainButItHasGoneAway [

	| aGame aLoadedDie aBoard |
	aBoard := self createBoard.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 4
			               with: 3
			               with: 4).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         throwing: aLoadedDie
		         winningWhen: 1
		         using:
		         (LoadedCardDealer with:
			          (OrderedCollection with: (OverloadCard owner: 'red' number: 1))).
	aGame apply: (OverloadCard owner: 'red' number: 1) to: 'blue'.
	aGame apply: (OverloadCard owner: 'red' number: 1) to: 'blue'.
	
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersPositions
		equals: (OrderedCollection with: 2 with: 3)
]

{ #category : #tests }
CardsTest >> testQ022UseTwoSpeedCardsFromTheSamePlayerToTheSamePlayer [

	| aGame aLoadedDie aBoard |
	aBoard := self createBoard.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 4
			               with: 3
			               with: 4).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         throwing: aLoadedDie
		         winningWhen: 1
		         using: (LoadedCardDealer with:
				          (OrderedCollection
					           with:( SpeedCard owner: 'red' number: 1)
					           with: (SpeedCard owner: 'red' number: 2))).
	aGame apply: (SpeedCard owner: 'red' number: 1) to: 'red'.
	aGame apply: (SpeedCard owner: 'red' number: 2) to: 'red'.

	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersPositions
		equals: (OrderedCollection with: 4 with: 5)
]

{ #category : #tests }
CardsTest >> testQ023UseASpeedCardAndThenTryToUseItAgainButItHasGoneAway [

	| aGame aLoadedDie aBoard |
	aBoard := self createBoard.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 4
			               with: 3
			               with: 4).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         throwing: aLoadedDie
		         winningWhen: 1
		         using:
		         (LoadedCardDealer with:
			          (OrderedCollection with: (SpeedCard owner: 'red' number: 1))).
	aGame apply: (SpeedCard owner: 'red' number: 1) to: 'red'.
	aGame apply: (SpeedCard owner: 'red' number: 1) to: 'red'.

	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersPositions
		equals: (OrderedCollection with: 3 with: 5)
]

{ #category : #tests }
CardsTest >> testQ024UseTwoAccelerationCardsFromTheSamePlayer [

	| aGame aLoadedDie aBoard |
	aBoard := self createBoard.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 4
			               with: 3
			               with: 4).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         throwing: aLoadedDie
		         winningWhen: 1
		         using: (LoadedCardDealer with: (OrderedCollection
					           with: (AccelerationCard owner: 'red' number: 1)
					           with: (AccelerationCard owner: 'red' number: 2))).
	aGame apply: (AccelerationCard owner: 'red' number: 1) to: 'all'.
	aGame apply: (AccelerationCard owner: 'red' number: 2) to: 'all'.
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersPositions
		equals: (OrderedCollection with: 4 with: 7)
]

{ #category : #tests }
CardsTest >> testQ025UseAnAccelerationCardAnThenTryToUseItAgainButItHasGoneAway [

	| aGame aLoadedDie aBoard |
	aBoard := self createBoard.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 4
			               with: 3
			               with: 4).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         throwing: aLoadedDie
		         winningWhen: 1
		         using: (LoadedCardDealer with:
				          (OrderedCollection with: (AccelerationCard owner: 'red' number: 1))).
	aGame apply: (AccelerationCard owner: 'red' number: 1) to: 'all'.
	aGame apply: (AccelerationCard owner: 'red' number: 1) to: 'all'.
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersPositions
		equals: (OrderedCollection with: 3 with: 6)
]

{ #category : #tests }
CardsTest >> testQ026TryToUseACancellationCardWhenThePlayerDoesNotHaveOne [

	| aGame aLoadedDie aBoard |
	aBoard := self createBoard.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 2
			               with: 3
			               with: 4).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         throwing: aLoadedDie
		         winningWhen: 1
		         using:
		         (LoadedCardDealer with:
			          (OrderedCollection with: (OverloadCard owner: 'red' number: 1))).

	aGame apply: (OverloadCard owner: 'red' number: 1) to: 'blue'.
	aGame
		apply: (CancellationCard owner: 'red' number: 2)
		to: (OverloadCard owner: 'blue' number: 1).

	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersPositions
		equals: (OrderedCollection with: 2 with: 1)
]

{ #category : #tests }
CardsTest >> testQ027UseTwoCancellationCardsFromTheSamePlayer [

	| aGame aLoadedDie aBoard |
	aBoard := self createBoard.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 4
			               with: 3
			               with: 4).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         throwing: aLoadedDie
		         winningWhen: 1
		         using: (LoadedCardDealer with: (OrderedCollection
					           with: (AccelerationCard owner: 'red' number: 1)
					           with: (AccelerationCard owner: 'red' number: 2)
					           with: (CancellationCard owner: 'blue' number: 3)
					           with: (CancellationCard owner: 'blue' number: 4))).
	aGame apply: (AccelerationCard owner: 'red' number: 1) to: 'all'.
	aGame apply: (AccelerationCard owner: 'red' number: 2) to: 'all'.
	aGame
		apply: (CancellationCard owner: 'blue' number: 3)
		to: (AccelerationCard owner: 'red' number: 1).
		aGame
		apply: (CancellationCard owner: 'blue' number: 4)
		to: (AccelerationCard owner: 'red' number: 2).
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersPositions
		equals: (OrderedCollection with: 2 with: 7)
]

{ #category : #tests }
CardsTest >> testQ028UseCancellationCardAnThenTryToUseItAgainButItHasGoneAway [

	| aGame aLoadedDie aBoard |
	aBoard := self createBoard.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 4
			               with: 3
			               with: 4).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         throwing: aLoadedDie
		         winningWhen: 1
		         using: (LoadedCardDealer with: (OrderedCollection
					           with: (AccelerationCard owner: 'red' number: 1)
					           with: (AccelerationCard owner: 'red' number: 2)
					           with: (CancellationCard owner: 'blue' number: 3))).

	aGame apply: (AccelerationCard owner: 'red' number: 1) to: 'all'.
	aGame apply: (AccelerationCard owner: 'red' number: 2) to: 'all'.
		aGame
		apply: (CancellationCard owner: 'blue' number: 3)
		to: (AccelerationCard owner: 'red' number: 1).
		aGame
		apply: (CancellationCard owner: 'blue' number: 3)
		to: (AccelerationCard owner: 'red' number: 2).
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersPositions
		equals: (OrderedCollection with: 3 with: 7)
]

{ #category : #tests }
CardsTest >> testQ029VerifyTheCorrectUseOfRedoCardWhenLastCardPlayIsAnOverloadCard [

	| aGame aLoadedDie aBoard |
	aBoard := self createBoard.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 4
			               with: 8
			               with: 3
			               with: 4).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         throwing: aLoadedDie
		         winningWhen: 1
		         using: (LoadedCardDealer with:
				          (OrderedCollection
					           with: (OverloadCard owner: 'red' number: 1)
					           with: (RedoCard owner: 'red' number: 2))).
	aGame apply: (OverloadCard owner: 'red' number: 1) to: 'blue'.
	aGame apply: (RedoCard owner: 'red' number: 2) to: 'red'.
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersPositions
		equals: (OrderedCollection with: 3 with: 7)
]

{ #category : #tests }
CardsTest >> testQ030VerifyTheCorrectUseOfRedoCardWhenLastCardPlayedIsACancellationCard [

	| aGame aLoadedDie aBoard |
	aBoard := self createBoard.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 4
			               with: 8
			               with: 3
			               with: 4).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         throwing: aLoadedDie
		         winningWhen: 1
		         using: (LoadedCardDealer with: (OrderedCollection
					           with: (AccelerationCard owner: 'red' number: 1)
					           with: (CancellationCard owner: 'red' number: 2)
					           with: (RedoCard owner: 'blue' number: 3))).
	aGame apply: (AccelerationCard owner: 'red' number: 1) to: 'all'.
	aGame
		apply: (CancellationCard owner: 'red' number: 2)
		to: (AccelerationCard owner: 'blue' number: 1).
	aGame
		apply: (RedoCard owner: 'blue' number: 3)
		to: (AccelerationCard owner: 'red' number: 1).

	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersPositions
		equals: (OrderedCollection with: 5 with: 9)
]

{ #category : #tests }
CardsTest >> testQ031VerifyTheCorrectUseOfRedoCardWhenLastCardPlayedIsASpeedCard [

	| aGame aLoadedDie aBoard |
	aBoard := self createBoard.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 4
			               with: 8
			               with: 3
			               with: 4).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         throwing: aLoadedDie
		         winningWhen: 1
		         using: (LoadedCardDealer with:
				          (OrderedCollection
					           with: (SpeedCard owner: 'red' number: 1)
					           with: (RedoCard owner: 'red' number: 2))).
	aGame apply: (SpeedCard owner: 'red' number: 1 ) to: 'red'.
	aGame apply: (RedoCard owner: 'red' number: 2) to: 'blue'.

	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersPositions
		equals: (OrderedCollection with: 6 with: 10)
]

{ #category : #tests }
CardsTest >> testQ032VerifyTheCorrectUseOfRedoCardWhenLastCardPlayedIsAnAccelerationCard [

	| aGame aLoadedDie aBoard |
	aBoard := self createBoard.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 4
			               with: 8
			               with: 3
			               with: 4).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         throwing: aLoadedDie
		         winningWhen: 1
		         using: (LoadedCardDealer with: (OrderedCollection
					           with: (AccelerationCard owner: 'red' number: 1)
					           with: (RedoCard owner: 'red' number: 2))).
	aGame apply: (AccelerationCard owner: 'red' number: 1) to: 'all'.
	aGame apply: (RedoCard owner: 'red' number: 2) to: 'all'.

	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersPositions
		equals: (OrderedCollection with: 7 with: 1)
]

{ #category : #tests }
CardsTest >> testQ033VerifyTheCorrectUseOfRedoCardWhenLastCardPlayedIsARedoCard [

	| aGame aLoadedDie aBoard |
	aBoard := self createBoard.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 4
			               with: 8
			               with: 3
			               with: 4).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         throwing: aLoadedDie
		         winningWhen: 1
		         using: (LoadedCardDealer with: (OrderedCollection
					           with: (AccelerationCard owner: 'red' number: 1)
					           with: (RedoCard owner: 'red' number: 2)
					           with: (RedoCard owner: 'blue' number: 3))).
	aGame apply: (AccelerationCard owner: 'red' number: 1) to: 'all'.
	aGame apply: (RedoCard owner: 'red' number: 2) to: 'all'.
	aGame apply: (RedoCard owner: 'blue' number: 3) to: 'all'.
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersPositions
		equals: (OrderedCollection with: 8 with: 2)
]

{ #category : #tests }
CardsTest >> testQ034VerifyTheCorrectUseOfRepeatCardWhenLastBoxIsASpeedUpOne [

	| aGame aLoadedDie boxes aBoard |
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 1
			               with: 3
			               with: 4).
	boxes := (BoxCreator use: (OrderedCollection with: (BoxProbability using: SpeedUpBox new withChance: 100))) create: 10.
	aBoard := Board with: boxes measure: (Parsec worth: 100).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         throwing: aLoadedDie
		         winningWhen: 1
		         using:
		         (LoadedCardDealer with:
			          (OrderedCollection with: (RepeatCard owner: 'red' number: 1))).
	aGame movePlayer.
	aGame movePlayer.
	aGame apply: (RepeatCard owner: 'red' number: 1) to: 'red'.

	self
		assert: aGame playersPositions
		equals: (OrderedCollection with: 10 with: 6)
]

{ #category : #tests }
CardsTest >> testQ035VerifyTheCorrectUseOfRepeatCardWhenLastBoxIsAWormHoleOne [

	| aGame aLoadedDie boxes aBoard |
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 4
			               with: 9
			               with: 3
			               with: 4).
	boxes := (BoxCreator use:
		          (OrderedCollection with: (BoxProbability using: WormHoleBox new withChance: 100))) 
		         create: 10.
	aBoard := Board with: boxes measure: (Parsec worth: 100).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         throwing: aLoadedDie
		         winningWhen: 1
		         using:
		         (LoadedCardDealer with:
			          (OrderedCollection with: (RepeatCard owner: 'red' number: 1))).

	aGame movePlayer.
	aGame movePlayer.
	aGame apply: (RepeatCard owner: 'red' number: 1) to: 'blue'.

	self
		assert: aGame playersPositions
		equals: (OrderedCollection with: 1 with: 2)
]

{ #category : #tests }
CardsTest >> testQ036VerifyTheCorrectUseOfRepeatCardWhenLastBoxIsAMoonWalkOne [

	| aGame aLoadedDie boxes aBoard |
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 4
			               with: 5
			               with: 3
			               with: 4).
	boxes := (BoxCreator use: (OrderedCollection with:
			           (BoxProbability
				            using: (MoonWalkBox with: -2)
				            withChance: 100))) create: 10.
	aBoard := Board with: boxes measure: (Parsec worth: 100).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         throwing: aLoadedDie
		         winningWhen: 1
		         using: (LoadedCardDealer with:
				          (OrderedCollection with:
					           (RepeatCard owner: 'red' number: 1))).


	aGame movePlayer.
	aGame movePlayer.
	aGame apply: (RepeatCard owner: 'red' number: 1) to: 'red'.

	self
		assert: aGame playersPositions
		equals: (OrderedCollection with: 3 with: 4)
]

{ #category : #tests }
CardsTest >> testQ037VerifyTheCorrectUseOfRepeatCardWhenLastBoxIsAnAtomicBombOne [

	| aGame aLoadedDie boxes aBoard |
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 4
			               with: 5
			               with: 3
			               with: 4).
	boxes := (BoxCreator use: (OrderedCollection with: (BoxProbability using: AtomicBombBox new withChance: 100))) create: 10.
	aBoard := Board with: boxes measure: (Parsec worth: 100).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         throwing: aLoadedDie
		         winningWhen: 1
		         using:
		         (LoadedCardDealer with:
			          (OrderedCollection with: (RepeatCard owner: 'red' number: 1))).


	aGame movePlayer.
	aGame movePlayer.
	aGame apply: (RepeatCard owner: 'red' number: 1) to: 'red'.


	self
		assert: aGame playersPositions
		equals: (OrderedCollection with: 1 with: 1)
]

{ #category : #tests }
CardsTest >> testQ038VerifyTheCorrectUseOfRepeatCardWhenLastBoxIsHyperJumpOne [

	| aGame aLoadedDie boxes aBoard |
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 5
			               with: 3
			               with: 4).
	boxes := (BoxCreator use: (OrderedCollection with: (BoxProbability
				            using:
				            (HyperJumpBox with:
					             (OrderedCollection with: (Parsec worth: 40)))
				            withChance: 100))) create: 10.
	aBoard := Board with: boxes measure: (Parsec worth: 100).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         throwing: aLoadedDie
		         winningWhen: 1
		         using: (LoadedCardDealer with:
				          (OrderedCollection with:
					           (RepeatCard owner: 'red' number: 1))).


	aGame movePlayer.
	aGame movePlayer.
	aGame apply: (RepeatCard owner: 'red' number: 1) to: 'red'.


	self
		assert: aGame playersPositions
		equals: (OrderedCollection with: 10 with: 10)
]

{ #category : #tests }
CardsTest >> testQ039VerifyThatAccelerationCardCanOnlyBePlayedAtPlayersTurns [

	| aGame aLoadedDie aBoard |
	aBoard := self createBoard.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 4
			               with: 3
			               with: 4).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         throwing: aLoadedDie
		         winningWhen: 1
		         using:
		         (LoadedCardDealer with:
			          (OrderedCollection with:( AccelerationCard owner: 'red' number: 1))).
	aGame movePlayer.
	aGame apply: (AccelerationCard owner: 'red' number: 1) to: 'all'.
	aGame movePlayer.

	self
		assert: aGame playersPositions
		equals: (OrderedCollection with: 2 with: 5)
]

{ #category : #tests }
CardsTest >> testQ040VerifyThatOverloadCardCanOnlyBePlayedAtPlayersTurns [

	| aGame aLoadedDie aBoard |
	aBoard := self createBoard.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 4
			               with: 3
			               with: 4).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         throwing: aLoadedDie
		         winningWhen: 1
		         using:
		         (LoadedCardDealer with:
			          (OrderedCollection with: (OverloadCard owner: 'red' number: 1))).
	aGame movePlayer.
	aGame apply: (OverloadCard owner: 'red' number: 1) to: 'blue'.
	aGame movePlayer.

	self
		assert: aGame playersPositions
		equals: (OrderedCollection with: 2 with: 5)
]

{ #category : #tests }
CardsTest >> testQ041VerifyThatSpeedCardCanOnlyBePlayedAtPlayersTurns [

	| aGame aLoadedDie aBoard |
	aBoard := self createBoard.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 4
			               with: 3
			               with: 4).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         throwing: aLoadedDie
		         winningWhen: 1
		         using:
		         (LoadedCardDealer with:
			          (OrderedCollection with: (SpeedCard owner: 'red' number: 1))).
	aGame movePlayer.
	aGame apply: (SpeedCard owner: 'red' number: 1) to: 'blue'.
	aGame movePlayer.

	self
		assert: aGame playersPositions
		equals: (OrderedCollection with: 2 with: 5)
]

{ #category : #tests }
CardsTest >> testQ042VerifyThatCancellationCardCanBePlayWheneverThePlayerWants [

	| aGame aLoadedDie aBoard |
	aBoard := self createBoard.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 4
			               with: 3
			               with: 4).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         throwing: aLoadedDie
		         winningWhen: 1
		         using: (LoadedCardDealer with: (OrderedCollection
					           with: (AccelerationCard owner: 'red' number: 1)
					           with: (CancellationCard owner: 'red' number: 2))).
	aGame apply: (AccelerationCard owner: 'red' number: 1) to: 'all'.
	aGame movePlayer.
	aGame
		apply: (CancellationCard owner: 'red' number: 2)
		to: (AccelerationCard owner: 'blue' number: 1).
	aGame movePlayer.

	self
		assert: aGame playersPositions
		equals: (OrderedCollection with: 3 with: 5)
]

{ #category : #tests }
CardsTest >> testQ043VerifyThatRedoCardCanBePlayWheneverThePlayerWants [

	| aGame aLoadedDie aBoard |
	aBoard := self createBoard.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 4
			               with: 3
			               with: 4).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         throwing: aLoadedDie
		         winningWhen: 1
		         using: (LoadedCardDealer with:
				          (OrderedCollection
					           with: (AccelerationCard owner: 'red' number: 1)
					           with: (RedoCard owner: 'red' number: 2))).
	aGame apply: (AccelerationCard owner: 'red' number: 1) to: 'all'.
	aGame movePlayer.
	aGame apply: (RedoCard owner: 'red' number: 2) to: 'all'.
	aGame movePlayer.

	self
		assert: aGame playersPositions
		equals: (OrderedCollection with: 3 with: 7)
]

{ #category : #tests }
CardsTest >> testQ044VerifyThatRepeatCardCanBePlayWheneverThePlayerWants [

	| aGame aLoadedDie boxes aBoard |
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 1
			               with: 3
			               with: 4).
	boxes := (BoxCreator use:
		          (OrderedCollection with: (BoxProbability using: SpeedUpBox new withChance: 100))) 
		         create: 10.
	aBoard := Board with: boxes measure: (Parsec worth: 100).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         throwing: aLoadedDie
		         winningWhen: 1
		         using: (LoadedCardDealer with:
				          (OrderedCollection with:
					           (RepeatCard owner: 'red' number: 1))).
	aGame movePlayer.
	aGame apply: (RepeatCard owner: 'red' number: 1) to: 'red'.
	aGame movePlayer.

	self
		assert: aGame playersPositions
		equals: (OrderedCollection with: 10 with: 6)
]

{ #category : #tests }
CardsTest >> testQ045VerifyThatRedoCardCanRepeatTheEffectOfTheRepeatCard [

	| aGame aLoadedDie boxes aBoard |
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 1
			               with: 3
			               with: 4).
	boxes := (BoxCreator use:
		          (OrderedCollection with: (BoxProbability using: SpeedUpBox new withChance: 100))) 
		         create: 10.
	aBoard := Board with: boxes measure: (Parsec worth: 100).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         throwing: aLoadedDie
		         winningWhen: 1
		         using: (LoadedCardDealer with: (OrderedCollection
					           with: (RepeatCard owner: 'red' number: 1)
					           with: (RedoCard owner: 'red' number: 2))).
	aGame movePlayer.
	aGame apply: (RepeatCard owner: 'red' number: 1) to: 'red'.
	aGame apply: (RedoCard owner: 'red' number: 2) to: 'blue'.
	aGame movePlayer.

	self
		assert: aGame playersPositions
		equals: (OrderedCollection with: 10 with: 10)
]

{ #category : #tests }
CardsTest >> testQ046VerifyThatWhenUsingARedoCardOfACancellationCardTheObjectiveCardMustBeDecleared [

	| aGame aLoadedDie aBoard |
	aBoard := self createBoard.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 4
			               with: 8
			               with: 3
			               with: 4).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         throwing: aLoadedDie
		         winningWhen: 1
		         using: (LoadedCardDealer with: (OrderedCollection
					           with: (AccelerationCard owner: 'red' number: 1)
					           with: (CancellationCard owner: 'red' number: 2)
					           with: (RedoCard owner: 'blue' number: 3))).
	aGame apply: (AccelerationCard owner: 'red' number: 1) to: 'all'.
	aGame
		apply: (CancellationCard owner: 'red' number: 2)
		to: (AccelerationCard owner: 'blue' number: 1).

	self
		should: [ aGame apply: (RedoCard owner: 'blue' number: 3) to: 'red' ]
		raise: Error
		withMessage: 'There are no that type of cards activate in this player'
]

{ #category : #tests }
CardsTest >> testQ047VerifyThatWhenUsingACancellationCardTheObjectiveCardMustBeDecleared [

| aGame aLoadedDie aBoard |
	aBoard := self createBoard.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 4
			               with: 8
			               with: 3
			               with: 4).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         throwing: aLoadedDie
		         winningWhen: 1
		         using: (LoadedCardDealer with: (OrderedCollection
					           with: (AccelerationCard owner: 'red' number: 1)
					           with: (CancellationCard owner: 'red' number: 2)
					           with: (RedoCard owner: 'blue' number: 3))).
	aGame apply: (AccelerationCard owner: 'red' number: 1) to: 'all'.
	self
		should: [ 
			aGame
		apply: (CancellationCard owner: 'red' number: 2) to: 'blue'.]
		raise: Error
		withMessage: 'There are no that type of cards activate in this player'
]

{ #category : #tests }
CardsTest >> testQ048VerifyThatWhenUsingAnOverloadCardTheObjectiveMustBeAValidPlayer [

	| aGame aLoadedDie aBoard |
	aBoard := self createBoard.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 2
			               with: 3
			               with: 4).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         throwing: aLoadedDie
		         winningWhen: 1
		         using: (LoadedCardDealer with:
				          (OrderedCollection with: (OverloadCard owner: 'red' number: 1))).
	self
		should: [ aGame apply: (OverloadCard owner: 'red' number: 1) to: (AccelerationCard owner: 'red' number: 2) ]
		raise: Error
		withMessage: 'That is not a valid objective'
]

{ #category : #tests }
CardsTest >> testQ049VerifyThatWhenUsingAnAccelerationCardTheObjectiveMustBeAll [

	| aGame aLoadedDie aBoard |
	aBoard := self createBoard.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 2
			               with: 3
			               with: 4).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         throwing: aLoadedDie
		         winningWhen: 1
		         using: (LoadedCardDealer with:
				          (OrderedCollection with: (AccelerationCard owner: 'red' number: 1))).
	self
		should: [ aGame apply: (AccelerationCard owner: 'red' number: 1) to: (AccelerationCard owner: 'red' number: 2) ]
		raise: Error
		withMessage: 'The objective must be all'
]

{ #category : #tests }
CardsTest >> testQ050VerifyThatWhenUsingASpeedCardTheObjectiveMustBeAValidPlayer [

	| aGame aLoadedDie aBoard |
	aBoard := self createBoard.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 2
			               with: 3
			               with: 4).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         throwing: aLoadedDie
		         winningWhen: 1
		         using: (LoadedCardDealer with:
				          (OrderedCollection with: (SpeedCard owner: 'red' number: 1))).
	self
		should: [ aGame apply: (SpeedCard owner: 'red' number: 1) to: (AccelerationCard owner: 'red' number: 2) ]
		raise: Error
		withMessage: 'That is not a valid objective'
]

{ #category : #tests }
CardsTest >> testQ051VerifyThatWhenUsingARepeatCardTheObjectiveMustBeAValidPlayer [

	| aGame aLoadedDie aBoard |
	aBoard := self createBoard.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 2
			               with: 3
			               with: 4).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         throwing: aLoadedDie
		         winningWhen: 1
		         using: (LoadedCardDealer with:
				          (OrderedCollection with: (RepeatCard owner: 'red' number: 1))).
	self
		should: [ aGame apply: (RepeatCard owner: 'red' number: 1) to: 'all' ]
		raise: Error
		withMessage: 'That is not a valid objective'
]

{ #category : #tests }
CardsTest >> testQ052VerifyThatWhenUsingARedoCardACardHasToBeenPlayedBefore [

	| aGame aLoadedDie aBoard |
	aBoard := self createBoard.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 2
			               with: 3
			               with: 4).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         throwing: aLoadedDie
		         winningWhen: 1
		         using: (LoadedCardDealer with:
				          (OrderedCollection with: (RedoCard owner: 'red' number: 1))).
	self
		should: [ aGame apply: (RedoCard owner: 'red' number: 1) to: 'all' ]
		raise: Error
		withMessage: 'Redo card cannot be played because there are no cards that have been played before'
]

{ #category : #tests }
CardsTest >> testQ053TryToCancellAnActiveCardThatHasBeenCancellBefore [

	| aGame aLoadedDie aBoard |
	aBoard := self createBoard.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 4
			               with: 3
			               with: 4).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         throwing: aLoadedDie
		         winningWhen: 1
		         using: (LoadedCardDealer with: (OrderedCollection
					           with: (AccelerationCard owner: 'red' number: 1)
					           with: (AccelerationCard owner: 'red' number: 2)
					           with: (CancellationCard owner: 'blue' number: 3)
					           with: (CancellationCard owner: 'blue' number: 4))).
	aGame apply: (AccelerationCard owner: 'red' number: 1) to: 'all'.
	aGame apply: (AccelerationCard owner: 'red' number: 2) to: 'all'.
	aGame
		apply: (CancellationCard owner: 'blue' number: 3)
		to: (AccelerationCard owner: 'red' number: 1).
	aGame movePlayer.
	aGame movePlayer.
	self
		should: [ 
			aGame
				apply: (CancellationCard owner: 'blue' number: 4)
				to: (AccelerationCard owner: 'red' number: 1) ]
		raise: Error
		withMessage:
		'There are no that type of cards activate in this player'
]
