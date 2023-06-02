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
		           using: (LoadedCardDealer with: (OrderedCollection with: OverloadCard new)).
	aGame apply: (OverloadCard to: 'blue') from: 'red'.
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
			          (OrderedCollection with: OverloadCard new)).
	aGame apply: (OverloadCard to: 'blue') from: 'red'.
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
			          (OrderedCollection with: OverloadCard new)).
	aGame apply: (OverloadCard to: 'blue') from: 'red'.
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
			          (OrderedCollection with: OverloadCard new)).
	aGame apply: (OverloadCard to: 'blue') from: 'red'.
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
			          (OrderedCollection with: SpeedCard new)).
	aGame apply: (SpeedCard to: 'red') from: 'red'.
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
			          (OrderedCollection with: SpeedCard new)).
	aGame apply: (SpeedCard to: 'red') from: 'red'.
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
			          (OrderedCollection with: SpeedCard new)).
	aGame apply: (SpeedCard to: 'red') from: 'red'.
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
			          (OrderedCollection with: SpeedCard new with: OverloadCard new)).

	aGame apply: (SpeedCard to: 'red') from: 'red'.
	aGame apply: (OverloadCard to: 'red') from: 'red'.
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
			          (OrderedCollection with: AccelerationCard new)).
	aGame apply: (AccelerationCard new) from: 'red'.
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
	aGame apply: AccelerationCard new from: 'red'.
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
		         using:
		         (LoadedCardDealer with:
			          (OrderedCollection with: CancellationCard new with: OverloadCard new)).

	aGame apply: (OverloadCard to: 'blue') from: 'red'.
	aGame movePlayer.
	aGame movePlayer.
	aGame apply: (CancellationCard to: 'blue' ofCard: 'Overload') from: 'red'.
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
					           with: SpeedCard new
					           with: OverloadCard new
					           with: CancellationCard new)).
	aGame apply: (OverloadCard to: 'blue') from: 'red'.
	aGame apply: (SpeedCard to: 'blue') from: 'red'.
	aGame movePlayer.
	aGame movePlayer.
	aGame
		apply: (CancellationCard to: 'blue' ofCard: 'Speed')
		from: 'blue'.
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
					           with: CancellationCard new
					           with: OverloadCard new
					           with: CancellationCard new
					           with: SpeedCard new)).
	aGame apply: (OverloadCard to: 'blue') from: 'red'.
	aGame movePlayer.
	aGame apply: (SpeedCard to: 'blue') from: 'blue'.
	aGame movePlayer.
	aGame
		apply: (CancellationCard to: 'blue' ofCard: 'Speed')
		from: 'red'.
	aGame movePlayer.
	aGame movePlayer.
	aGame
		apply: (CancellationCard to: 'blue' ofCard: 'Overload')
		from: 'blue'.
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
			          (OrderedCollection with: CancellationCard new)).
	self
		should: [ 
			aGame
				apply: (CancellationCard to: 'blue' ofCard: 'Overload')
				from: 'red' ]
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
					           with: CancellationCard new
					           with: OverloadCard new)).
	aGame apply: (OverloadCard to: 'blue') from: 'red'.

	self
		should: [ 
			aGame
				apply: (CancellationCard to: 'blue' ofCard: 'Speed')
				from: 'red' ]
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
			          (OrderedCollection with: OverloadCard new)).
	aGame apply: (OverloadCard to: 'red') from: 'blue'.

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
			          (OrderedCollection with: SpeedCard new)).
	aGame apply: (SpeedCard to: 'blue') from: 'blue'.
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
	aGame apply: AccelerationCard new from: 'blue'.

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
					           with: OverloadCard new
					           with: OverloadCard new)).
	aGame apply: (OverloadCard to: 'blue') from: 'red'.
	aGame apply: (OverloadCard to: 'blue') from: 'red'.

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
			          (OrderedCollection with: OverloadCard new)).
	aGame apply: (OverloadCard to: 'blue') from: 'red'.
	aGame apply: (OverloadCard to: 'blue') from: 'red'.
	
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
					           with: SpeedCard new
					           with: SpeedCard new)).
	aGame apply: (SpeedCard to: 'red') from: 'red'.
	aGame apply: (SpeedCard to: 'red') from: 'red'.

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
			          (OrderedCollection with: SpeedCard new)).
	aGame apply: (SpeedCard to: 'red') from: 'red'.
	aGame apply: (SpeedCard to: 'red') from: 'red'.

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
	aGame apply: AccelerationCard new from: 'red'.
	aGame apply: AccelerationCard new from: 'red'.
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
	aGame apply: AccelerationCard new from: 'red'.
	aGame apply: AccelerationCard new from: 'red'.
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
			          (OrderedCollection with: OverloadCard new)).

	aGame apply: (OverloadCard to: 'blue') from: 'red'.
	aGame
		apply: (CancellationCard to: 'blue' ofCard: 'Overload')
		from: 'red'.

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
	aGame apply: AccelerationCard new from: 'red'.
	aGame apply: AccelerationCard new from: 'red'.
	aGame
		apply: (CancellationCard to: 'red' ofCard: 'Acceleration')
		from: 'blue'.
	aGame
		apply: (CancellationCard to: 'red' ofCard: 'Acceleration')
		from: 'blue'.
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

	aGame apply: AccelerationCard new from: 'red'.
	aGame apply: AccelerationCard new from: 'red'.
	aGame
		apply: (CancellationCard to: 'red' ofCard: 'Acceleration')
		from: 'blue'.
	aGame
		apply: (CancellationCard to: 'red' ofCard: 'Acceleration')
		from: 'blue'.
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
					           with: OverloadCard new
					           with: RedoCard new)).
	aGame apply: (OverloadCard to: 'blue') from: 'red'.
	aGame apply: (RedoCard to: 'red') from: 'red'.
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
	aGame apply: AccelerationCard new from: 'red'.
	aGame
		apply: (CancellationCard to: 'blue' ofCard: 'Acceleration')
		from: 'red'.
	aGame
		apply: (RedoCard to: 'red' ofCard: 'Acceleration')
		from: 'blue'.

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
					           with: SpeedCard new
					           with: RedoCard new)).
	aGame apply: (SpeedCard to: 'red') from: 'red'.
	aGame apply: (RedoCard to: 'blue') from: 'red'.

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
	aGame apply: AccelerationCard new from: 'red'.
	aGame apply: RedoCard new from: 'red'.

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
	aGame apply: AccelerationCard new from: 'red'.
	aGame apply: RedoCard new from: 'blue'.
	aGame apply: RedoCard new from: 'red'.

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
			          (OrderedCollection with: RepeatCard new)).
	aGame movePlayer.
	aGame movePlayer.
	aGame apply: (RepeatCard to: 'red') from: 'red'.

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
			          (OrderedCollection with: RepeatCard new)).

	aGame movePlayer.
	aGame movePlayer.
	aGame apply: (RepeatCard to: 'blue') from: 'red'.

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
			          (OrderedCollection with: RepeatCard new)).


	aGame movePlayer.
	aGame movePlayer.
	aGame apply: (RepeatCard to: 'red') from: 'red'.

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
			          (OrderedCollection with: RepeatCard new)).
	aGame movePlayer.
	aGame movePlayer.

	aGame apply: (RepeatCard to: 'red') from: 'red'.


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
			          (OrderedCollection with: RepeatCard new)).
	aGame movePlayer.
	aGame movePlayer.

	aGame apply: (RepeatCard to: 'red') from: 'red'.


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
	aGame apply: AccelerationCard new from: 'red'.
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
			          (OrderedCollection with: OverloadCard new)).
	aGame movePlayer.
	aGame apply: (OverloadCard to: 'blue') from: 'red'.
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
			          (OrderedCollection with: SpeedCard new)).
	aGame movePlayer.
	aGame apply: (SpeedCard to: 'blue') from: 'red'.
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
	aGame apply: AccelerationCard new from: 'red'.
	aGame movePlayer.
	aGame
		apply: (CancellationCard to: 'blue' ofCard: 'Acceleration')
		from: 'red'.
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
	aGame apply: AccelerationCard new from: 'red'.
	aGame movePlayer.
	aGame apply: RedoCard new from: 'red'.
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
			          (OrderedCollection with: RepeatCard new with: RedoCard new)).
	aGame movePlayer.
	aGame apply: (RepeatCard to: 'red') from: 'red'.
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
			          (OrderedCollection with: RepeatCard new with: RedoCard new)).
	aGame movePlayer.
	aGame apply: (RepeatCard to: 'red') from: 'red'.
	aGame apply: (RedoCard to: 'blue') from: 'red'.
	aGame movePlayer.

	self
		assert: aGame playersPositions
		equals: (OrderedCollection with: 10 with: 10)
]
