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
	boxes := (BoxCreator use: (OrderedCollection with: (NoEffectBox withChance: 100))) create: 10.
	^ aBoard := Board with: boxes measure: (Parsecs worth: 100).
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
		           using: (LoadedCardDealer with: (OrderedCollection with: (OverloadCard owner: 'red'))).
	aGame apply: (OverloadCard owner: 'red') to: 'blue'.
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
			          (OrderedCollection with: (OverloadCard owner: 'red'))).
	aGame apply: (OverloadCard owner: 'red') to: 'blue'.
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
			          (OrderedCollection with: (OverloadCard owner: 'red'))).
	aGame apply: (OverloadCard owner: 'red') to: 'blue'.
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
			          (OrderedCollection with: (OverloadCard owner: 'red'))).
	aGame apply: (OverloadCard owner: 'red') to: 'blue'.
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
			          (OrderedCollection with: (SpeedCard owner: 'red'))).
	aGame apply: (SpeedCard owner: 'red') to: 'red'.
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
			          (OrderedCollection with: (SpeedCard owner: 'red'))).
	aGame apply: (SpeedCard owner: 'red') to: 'red'.
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
			          (OrderedCollection with: (SpeedCard owner: 'red'))).
	aGame apply: (SpeedCard owner: 'red') to: 'red'.
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
		         using:
		         (LoadedCardDealer with:
			          (OrderedCollection with: (SpeedCard owner: 'red') with: (OverloadCard owner: 'red'))).

	aGame apply: (SpeedCard owner: 'red') to: 'red'.
	aGame apply: (OverloadCard owner: 'red') to: 'red'.
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
			          (OrderedCollection with: (AccelerationCard owner: 'red'))).
	aGame apply: (AccelerationCard owner: 'red') to: 'all'.
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
			          (OrderedCollection with: AccelerationCard new)).
	aGame apply: AccelerationCard new to: 'red'.
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
					           with: (CancellationCard owner: 'red')
					           with: (OverloadCard owner: 'red'))).

	aGame apply: (OverloadCard owner: 'red') to: 'blue'.
	aGame movePlayer.
	aGame movePlayer.
	aGame
		apply: (CancellationCard owner: 'red' ofCard: 'Overload')
		to: 'blue'.
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
					           with: (SpeedCard owner: 'red')
					           with: (OverloadCard owner: 'red')
					           with: (CancellationCard owner: 'blue'))).
	aGame apply: (OverloadCard owner: 'red') to: 'blue'.
	aGame apply: (SpeedCard owner: 'red') to: 'blue'.
	aGame movePlayer.
	aGame movePlayer.
	aGame
		apply: (CancellationCard owner: 'blue' ofCard: 'Speed')
		to: 'blue'.
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
					           with: (CancellationCard owner: 'red')
					           with: (OverloadCard owner: 'red')
					           with: (CancellationCard owner: 'blue')
					           with: (SpeedCard owner: 'blue'))).
	aGame apply: (OverloadCard owner: 'red') to: 'blue'.
	aGame movePlayer.
	aGame apply: (SpeedCard owner: 'blue') to: 'blue'.
	aGame movePlayer.
	aGame
		apply: (CancellationCard owner: 'red' ofCard: 'Speed')
		to: 'blue'.
	aGame movePlayer.
	aGame movePlayer.
	aGame
		apply: (CancellationCard owner: 'blue' ofCard: 'Overload')
		to: 'blue'.
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
			          (OrderedCollection with: (CancellationCard owner: 'red'))).
	self
		should: [ 
			aGame
				apply: (CancellationCard owner: 'red' ofCard: 'Overload')
				to: 'blue' ]
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
					           with: (CancellationCard owner: 'red')
					           with: (OverloadCard owner: 'red'))).
	aGame apply: (OverloadCard owner: 'red') to: 'blue'.

	self
		should: [ 
			aGame
				apply: (CancellationCard owner: 'red' ofCard: 'Speed')
				to: 'blue' ]
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
			          (OrderedCollection with: (OverloadCard owner: 'red'))).
	aGame apply: (OverloadCard owner: 'blue') to: 'red'.

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
			          (OrderedCollection with: (SpeedCard owner: 'red'))).
	aGame apply: (SpeedCard owner: 'blue') to: 'blue'.
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
			          (OrderedCollection with: AccelerationCard new)).
	aGame apply: AccelerationCard new to: 'blue'.

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
					           with: (OverloadCard owner: 'red')
					           with: (OverloadCard owner: 'red'))).
	aGame apply: (OverloadCard owner: 'red') to: 'blue'.
	aGame apply: (OverloadCard owner: 'red') to: 'blue'.

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
			          (OrderedCollection with: (OverloadCard owner: 'red'))).
	aGame apply: (OverloadCard owner: 'red') to: 'blue'.
	aGame apply: (OverloadCard owner: 'red') to: 'blue'.
	
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
					           with:( SpeedCard owner: 'red')
					           with: (SpeedCard owner: 'red'))).
	aGame apply: (SpeedCard owner: 'red') to: 'red'.
	aGame apply: (SpeedCard owner: 'red') to: 'red'.

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
			          (OrderedCollection with: (SpeedCard owner: 'red'))).
	aGame apply: (SpeedCard owner: 'red') to: 'red'.
	aGame apply: (SpeedCard owner: 'red') to: 'red'.

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
					           with: AccelerationCard new
					           with: AccelerationCard new)).
	aGame apply: AccelerationCard new to: 'red'.
	aGame apply: AccelerationCard new to: 'red'.
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
		         using:
		         (LoadedCardDealer with:
			          (OrderedCollection with: AccelerationCard new)).
	aGame apply: AccelerationCard new to: 'red'.
	aGame apply: AccelerationCard new to: 'red'.
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
			          (OrderedCollection with: (OverloadCard owner: 'red'))).

	aGame apply: (OverloadCard owner: 'red') to: 'blue'.
	aGame
		apply: (CancellationCard owner: 'red' ofCard: 'Overload')
		to: 'blue'.

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
					           with: AccelerationCard new
					           with: AccelerationCard new
					           with: CancellationCard new
					           with: CancellationCard new)).
	aGame apply: AccelerationCard new to: 'red'.
	aGame apply: AccelerationCard new to: 'red'.
	aGame
		apply: (CancellationCard owner: 'red' ofCard: 'Acceleration')
		to: 'blue'.
	aGame
		apply: (CancellationCard owner: 'red' ofCard: 'Acceleration')
		to: 'blue'.
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
					           with: AccelerationCard new
					           with: AccelerationCard new
					           with: CancellationCard new)).

	aGame apply: AccelerationCard new to: 'red'.
	aGame apply: AccelerationCard new to: 'red'.
	aGame
		apply: (CancellationCard owner: 'red' ofCard: 'Acceleration')
		to: 'blue'.
	aGame
		apply: (CancellationCard owner: 'red' ofCard: 'Acceleration')
		to: 'blue'.
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
					           with: (OverloadCard owner: 'red')
					           with: (RedoCard owner: 'red'))).
	aGame apply: (OverloadCard owner: 'red') to: 'blue'.
	aGame apply: (RedoCard owner: 'red') to: 'red'.
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
					           with: AccelerationCard new
					           with: CancellationCard new
					           with: RedoCard new)).
	aGame apply: AccelerationCard new to: 'red'.
	aGame
		apply: (CancellationCard owner: 'blue' ofCard: 'Acceleration')
		to: 'red'.
	aGame
		apply: (RedoCard owner: 'red' ofCard: 'Acceleration')
		to: 'blue'.

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
					           with: (SpeedCard owner: 'red')
					           with: (RedoCard owner: 'red'))).
	aGame apply: (SpeedCard owner: 'red') to: 'red'.
	aGame apply: (RedoCard owner: 'red') to: 'blue'.

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
		         using: (LoadedCardDealer with:
				          (OrderedCollection
					           with: AccelerationCard new
					           with: RedoCard new)).
	aGame apply: AccelerationCard new to: 'red'.
	aGame apply: RedoCard new to: 'red'.

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
					           with: AccelerationCard new
					           with: RedoCard new
					           with: RedoCard new)).
	aGame apply: AccelerationCard new to: 'red'.
	aGame apply: RedoCard new to: 'blue'.
	aGame apply: RedoCard new to: 'red'.

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
	boxes := (BoxCreator use: (OrderedCollection with: (SpeedUpBox withChance: 100))) create: 10.
	aBoard := Board with: boxes measure: (Parsecs worth: 100).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         throwing: aLoadedDie
		         winningWhen: 1
		         using:
		         (LoadedCardDealer with:
			          (OrderedCollection with: (RepeatCard owner: 'red'))).
	aGame movePlayer.
	aGame movePlayer.
	aGame apply: (RepeatCard owner: 'red') to: 'red'.

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
		          (OrderedCollection with: (WormHoleBox withChance: 100))) 
		         create: 10.
	aBoard := Board with: boxes measure: (Parsecs worth: 100).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         throwing: aLoadedDie
		         winningWhen: 1
		         using:
		         (LoadedCardDealer with:
			          (OrderedCollection with: (RepeatCard owner: 'red'))).

	aGame movePlayer.
	aGame movePlayer.
	aGame apply: (RepeatCard owner: 'red') to: 'blue'.

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
	boxes := (BoxCreator use:
		          (OrderedCollection with:
			           (MoonWalkBox with: -2 chance: 100))) create: 10.
	aBoard := Board with: boxes measure: (Parsecs worth: 100).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         throwing: aLoadedDie
		         winningWhen: 1
		         using:
		         (LoadedCardDealer with:
			          (OrderedCollection with: (RepeatCard owner: 'red'))).


	aGame movePlayer.
	aGame movePlayer.
	aGame apply: (RepeatCard owner: 'red') to: 'red'.

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
	boxes := (BoxCreator use: (OrderedCollection with: (AtomicBombBox withChance: 100))) create: 10.
	aBoard := Board with: boxes measure: (Parsecs worth: 100).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         throwing: aLoadedDie
		         winningWhen: 1
		         using:
		         (LoadedCardDealer with:
			          (OrderedCollection with: (RepeatCard owner: 'red'))).


	aGame movePlayer.
	aGame movePlayer.
	aGame apply: (RepeatCard owner: 'red') to: 'red'.


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
	boxes := (BoxCreator use: (OrderedCollection with: (HyperJumpBox with: (OrderedCollection with: (Parsecs worth: 40)) chance: 100))) create: 10.
	aBoard := Board with: boxes measure: (Parsecs worth: 100).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         throwing: aLoadedDie
		         winningWhen: 1
		         using:
		         (LoadedCardDealer with:
			          (OrderedCollection with: (RepeatCard owner: 'red'))).


	aGame movePlayer.
	aGame movePlayer.
	aGame apply: (RepeatCard owner: 'red') to: 'red'.


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
			          (OrderedCollection with: AccelerationCard new)).
	aGame movePlayer.
	aGame apply: AccelerationCard new to: 'red'.
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
			          (OrderedCollection with: (OverloadCard owner: 'red'))).
	aGame movePlayer.
	aGame apply: (OverloadCard owner: 'red') to: 'blue'.
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
			          (OrderedCollection with: (SpeedCard owner: 'red'))).
	aGame movePlayer.
	aGame apply: (SpeedCard owner: 'red') to: 'blue'.
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
					           with: AccelerationCard new
					           with: CancellationCard new)).
	aGame apply: AccelerationCard new to: 'red'.
	aGame movePlayer.
	aGame
		apply: (CancellationCard owner: 'blue' ofCard: 'Acceleration')
		to: 'red'.
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
					           with: AccelerationCard new
					           with: RedoCard new)).
	aGame apply: AccelerationCard new to: 'red'.
	aGame movePlayer.
	aGame apply: RedoCard new to: 'red'.
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
	boxes := (BoxCreator use: (OrderedCollection with: (SpeedUpBox withChance: 100))) create: 10.
	aBoard := Board with: boxes measure: (Parsecs worth: 100).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         throwing: aLoadedDie
		         winningWhen: 1
		         using:
		         (LoadedCardDealer with:
			          (OrderedCollection with: (RepeatCard owner: 'red'))).
	aGame movePlayer.
	aGame apply: (RepeatCard owner: 'red') to: 'red'.
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
	boxes := (BoxCreator use: (OrderedCollection with: (SpeedUpBox withChance: 100))) create: 10.
	aBoard := Board with: boxes measure: (Parsecs worth: 100).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         throwing: aLoadedDie
		         winningWhen: 1
		         using:
		         (LoadedCardDealer with:
			          (OrderedCollection with: (RepeatCard owner: 'red') with: (RedoCard owner: 'red'))).
	aGame movePlayer.
	aGame apply: (RepeatCard owner: 'red') to: 'red'.
	aGame apply: (RedoCard owner: 'red') to: 'blue'.
	aGame movePlayer.

	self
		assert: aGame playersPositions
		equals: (OrderedCollection with: 10 with: 10)
]
