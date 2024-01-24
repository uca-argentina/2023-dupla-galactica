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
		           using: (CardDealer with: (OrderedCollection with: OverloadCard)).
	aGame apply: (OverloadCard owner: 'red') to: 'blue'.
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersBox
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
		         (CardDealer  with:
			          (OrderedCollection with: (OverloadCard))).
	aGame apply: (OverloadCard owner: 'red') to: 'blue'.
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
		         (CardDealer  with:
			          (OrderedCollection with: (OverloadCard))).
	aGame apply: (OverloadCard owner: 'red') to: 'blue'.
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

	| aGame aLoadedDie aBoard aRedPosition aBluePosition|
	aRedPosition := (Position atTheBeginning) move: 1.
	aBluePosition := (Position atTheBeginning).
	
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
		         (CardDealer  with:
			          (OrderedCollection with: (OverloadCard))).
	aGame apply: (OverloadCard owner: 'red') to: 'blue'.
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersPositions 
		equals: (OrderedCollection with: aRedPosition with: aBluePosition)
	
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
		         (CardDealer  with:
			          (OrderedCollection with: (SpeedCard ))).
	aGame apply: (SpeedCard owner: 'red') to: 'red'.
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersBox
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
		        (CardDealer  with:
			          (OrderedCollection with: (SpeedCard ))).
	aGame apply: (SpeedCard owner: 'red') to: 'red'.
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
		         (CardDealer with: (OrderedCollection with: SpeedCard)).
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
		         using: (CardDealer with:
				          (OrderedCollection with: OverloadCard)).
	aGame apply: (OverloadCard owner: 'red') to: 'red'.
	aGame apply: (OverloadCard owner: 'red') to: 'red'.
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersBox
		equals: (OrderedCollection with: 2 with: 3)
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
		         (CardDealer with:
			          (OrderedCollection with: AccelerationCard)).
	aGame applyEveryone: (AccelerationCard owner: 'red').
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersBox
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
		          (CardDealer with:
			          (OrderedCollection with: AccelerationCard)).
	aGame applyEveryone: (AccelerationCard owner: 'red').
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersBox
		equals: (OrderedCollection with: 10 with: 1)
]

{ #category : #tests }
CardsTest >> testQ011VerifyTheCorrectUseOfCancellationCard [

	| aGame aLoadedDie aBoard boxes | 
	boxes := (BoxCreator use: (OrderedCollection with: (BoxProbability using: (RandomCardBox withCards: (OrderedCollection with: CancellationCard)) withChance: 100))) create: 10.
	aBoard := Board with: boxes measure: (Parsec worth: 100).
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
		         using: (CardDealer with:
				          (OrderedCollection
					           with: OverloadCard )).

	aGame apply: (OverloadCard owner: 'red') to: 'blue'.
	aGame movePlayer.
	aGame movePlayer.
	aGame
		apply: (CancellationCard owner: 'red')
		to: (OverloadCard owner: 'blue').
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersBox
		equals: (OrderedCollection with: 5 with: 5)
]

{ #category : #tests }
CardsTest >> testQ012VerifyTheCorrectUseOfCancellationCardWhenThePlayerHasMoreThanOneCard [

	| aGame aLoadedDie aBoard boxes |
	boxes := (BoxCreator use: (OrderedCollection with: (BoxProbability using: (RandomCardBox withCards: (OrderedCollection with: CancellationCard)) withChance: 100))) create: 10.
	aBoard := Board with: boxes measure: (Parsec worth: 100).
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
		         using: (CardDealer with: (OrderedCollection
					           with: (SpeedCard))).
	aGame apply: (SpeedCard owner: 'red') to: 'blue'.
	aGame apply: (SpeedCard owner: 'red') to: 'blue'.
	aGame movePlayer.
	aGame movePlayer.
	aGame
		apply: (CancellationCard owner: 'blue') to: (SpeedCard owner: 'blue').
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersBox
		equals: (OrderedCollection with: 5 with: 10)
]

{ #category : #tests }
CardsTest >> testQ013VerifyTheCorrectUseOfTwoCancellationCards [

	| aGame aLoadedDie aBoard boxes |
	
	boxes := (BoxCreator use: (OrderedCollection with: (BoxProbability using: (RandomCardBox withCards: (OrderedCollection with: CancellationCard)) withChance: 100))) create: 10.
	aBoard := Board with: boxes measure: (Parsec worth: 100).
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
		         using: (CardDealer with: (OrderedCollection
					           with: SpeedCard )).
	aGame apply: (SpeedCard owner: 'red') to: 'red'.
	aGame movePlayer.
	aGame apply: (SpeedCard owner: 'blue') to: 'blue'.
	aGame movePlayer.
	aGame
		apply: (CancellationCard owner: 'red')
		to: (SpeedCard owner: 'blue').
	aGame movePlayer.
	aGame
		apply: (CancellationCard owner: 'blue')
		to: (SpeedCard owner: 'red').
	aGame movePlayer.
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersBox
		equals: (OrderedCollection with: 8 with: 10)
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
		         (CardDealer with:
			          (OrderedCollection with: CancellationCard)).
	self
		should: [ 
			aGame
				apply: (CancellationCard owner: 'red')
				to: (OverloadCard owner: 'red') ]
		raise: Error
		withMessage: 'There are no permanent cards'
]

{ #category : #tests }
CardsTest >> testQ015TryToCancellAPermanentCardWithATypeOfCardThatIsNotActivate [

	| aGame aLoadedDie aBoard boxes|
	
	boxes := (BoxCreator use: (OrderedCollection with: (BoxProbability using: (RandomCardBox withCards: (OrderedCollection with: CancellationCard)) withChance: 100))) create: 10.
	aBoard := Board with: boxes measure: (Parsec worth: 100).
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
		         using: (CardDealer with:
				          (OrderedCollection
					           with: OverloadCard)).
	aGame apply: (OverloadCard owner: 'red') to: 'blue'.
	aGame movePlayer.
	aGame movePlayer.
	
	self
		should: [ 
			aGame
				apply: (CancellationCard owner: 'red')
				to: (OverloadCard owner: 'red') ]
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
		         (CardDealer with: (OrderedCollection with: OverloadCard)).
	self
		should: [ 
			aGame
				apply: (OverloadCard  owner: 'blue')
				to: 'red' ]
		raise: Error
		withMessage: 'A permanent card can only be use when it is your turn'
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
		         (CardDealer with: (OrderedCollection with: OverloadCard)).
	self
		should: [ 
			aGame
				apply: (SpeedCard owner: 'red')
				to: 'red' ]
		raise: Error
		withMessage: 'The player does not have that card in posetion'
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
		         using:
		         (CardDealer with: (OrderedCollection with: OverloadCard)).
	aGame apply: (OverloadCard owner: 'red') to: 'blue'.
	aGame apply: (OverloadCard owner: 'red') to: 'blue'.

	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersBox
		equals: (OrderedCollection with: 2 with: 1)
]

{ #category : #tests }
CardsTest >> testQ021UseAnOverLoadCardAndThenTryToUseItAgainButItHasGoneAway [

	| aGame aLoadedDie aBoard |
	aBoard := self createBoard.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 5
			               with: 3
			               with: 4).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         throwing: aLoadedDie
		         winningWhen: 1
		         using:
		         (CardDealer with: (OrderedCollection with: OverloadCard)).
	aGame apply: (OverloadCard owner: 'red') to: 'blue'.
	aGame apply: (OverloadCard owner: 'red') to: 'blue'.
	self
		should: [ 
			aGame
				apply: (OverloadCard  owner: 'red')
				to: 'blue' ]
		raise: Error
		withMessage: 'The player does not have that card in posetion'
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
		         using:
		         (CardDealer with: (OrderedCollection with: SpeedCard)).
	aGame apply: (SpeedCard owner: 'red') to: 'red'.
	aGame apply: (SpeedCard owner: 'red') to: 'red'.

	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersBox
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
		         (CardDealer with: (OrderedCollection with: SpeedCard)).
	aGame apply: (SpeedCard owner: 'red') to: 'red'.
	aGame apply: (SpeedCard owner: 'red') to: 'red'.
	self
		should: [ 
			aGame
				apply: (SpeedCard owner: 'red')
				to: 'red' ]
		raise: Error
		withMessage: 'The player does not have that card in posetion'
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
		         using:
		         (CardDealer with:
			          (OrderedCollection with: AccelerationCard)).
	aGame applyEveryone: (AccelerationCard owner: 'red').
	aGame applyEveryone:  (AccelerationCard owner: 'red').
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersBox
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
		         (CardDealer with:
			          (OrderedCollection with: AccelerationCard)).
	aGame applyEveryone: (AccelerationCard owner: 'red').
	aGame applyEveryone: (AccelerationCard owner: 'red').
	self
		should: [ 
			aGame
				applyEveryone: (AccelerationCard   owner: 'red')]
		raise: Error
		withMessage: 'The player does not have that card in posetion'
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
		         (CardDealer with: (OrderedCollection with: OverloadCard)).

	aGame apply: (OverloadCard owner: 'red') to: 'blue'.
	self
		should: [ 
			aGame
				apply: (CancellationCard owner: 'blue')
				to: 'blue' ]
		raise: Error
		withMessage: 'The player does not have that card in posetion'
]

{ #category : #tests }
CardsTest >> testQ027UseTwoCancellationCardsFromTheSamePlayer [

	| aGame aLoadedDie aBoard boxes |
	boxes := (BoxCreator use: (OrderedCollection with: (BoxProbability
				            using:
				            (RandomCardBox withCards:
					             (OrderedCollection with: CancellationCard))
				            withChance: 100))) create: 10.
	aBoard := Board with: boxes measure: (Parsec worth: 100).

	aLoadedDie := LoadedDie with:
		              (OrderedCollection with: 1 with: 1 with: 1).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         throwing: aLoadedDie
		         winningWhen: 2
		         using:
		         (CardDealer with:
			          (OrderedCollection with: AccelerationCard)).
	aGame applyEveryone: (AccelerationCard owner: 'red').
	aGame applyEveryone: (AccelerationCard owner: 'red').
	aGame movePlayer.
	aGame movePlayer.
	aGame movePlayer.
	aGame movePlayer.
	aGame
		apply: (CancellationCard owner: 'blue')
		to: (AccelerationCard owner: 'red').
	aGame
		apply: (CancellationCard owner: 'blue')
		to: (AccelerationCard owner: 'red').
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersBox
		equals: (OrderedCollection with: 8 with: 10)
]

{ #category : #tests }
CardsTest >> testQ029VerifyTheCorrectUseOfRedoCardWhenLastCardPlayIsAnOverloadCard [

	| aGame aLoadedDie aBoard boxes |
	boxes := (BoxCreator use: (OrderedCollection with: (BoxProbability
				            using:
				            (RandomCardBox withCards:
					             (OrderedCollection with: RedoCard))
				            withChance: 100))) create: 10.
	aBoard := Board with: boxes measure: (Parsec worth: 100).
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 4
			               with: 4
			               with: 1
			               with: 1).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         throwing: aLoadedDie
		         winningWhen: 1
		         using: (CardDealer  with:
				          (OrderedCollection
					           with: OverloadCard)).
	aGame apply: (OverloadCard owner: 'red') to: 'blue'.
	aGame movePlayer.
	aGame movePlayer.
	aGame apply: (RedoCard owner: 'red') to: 'red'.
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersBox
		equals: (OrderedCollection with: 4 with: 2)
]

{ #category : #tests }
CardsTest >> testQ030VerifyTheCorrectUseOfRedoCardWhenLastCardPlayedIsACancellationCard [

	| aGame aLoadedDie aBoard boxes |
	boxes := (BoxCreator use: (OrderedCollection with: (BoxProbability
				            using:
				            (RandomCardBox withCards:
					             (OrderedCollection with: RedoCard))
				            withChance: 100))) create: 10.
	aBoard := Board with: boxes measure: (Parsec worth: 100).
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
		         using:
		         (CardDealer with:
			          (OrderedCollection with: CancellationCard)).
	aGame movePlayer.
	aGame movePlayer.

	self
		should: [ 
			aGame
				apply: (CancellationCard owner: 'red')
				to: (AccelerationCard owner: 'red') ]
		raise: Error
		withMessage: 'There are no permanent cards'.

	self
		should: [ 
			aGame
				apply: (RedoCard owner: 'blue')
				to: (AccelerationCard owner: 'red') ]
		raise: Error
		withMessage:
		'There are no permanent cards'.
]

{ #category : #tests }
CardsTest >> testQ031VerifyTheCorrectUseOfRedoCardWhenLastCardPlayedIsASpeedCard [

	| aGame aLoadedDie aBoard boxes |
	boxes := (BoxCreator use: (OrderedCollection with: (BoxProbability
				            using:
				            (RandomCardBox withCards:
					             (OrderedCollection with: RedoCard))
				            withChance: 100))) create: 10.
	aBoard := Board with: boxes measure: (Parsec worth: 100).
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 1
			               with: 1
			               with: 1).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         throwing: aLoadedDie
		         winningWhen: 1
		         using: (CardDealer with:
				          (OrderedCollection
					           with: SpeedCard)).
	aGame apply: (SpeedCard owner: 'red') to: 'red'.
	aGame movePlayer.
	aGame movePlayer.
	
	aGame apply: (RedoCard owner: 'red') to: 'blue'.

	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersBox
		equals: (OrderedCollection with: 5 with: 4)
]

{ #category : #tests }
CardsTest >> testQ032VerifyTheCorrectUseOfRedoCardWhenLastCardPlayedIsAnAccelerationCard [

	| aGame aLoadedDie aBoard boxes |
	
	boxes := (BoxCreator use: (OrderedCollection with: (BoxProbability
				            using:
				            (RandomCardBox withCards:
					             (OrderedCollection with: RedoCard))
				            withChance: 100))) create: 10.
	aBoard := Board with: boxes measure: (Parsec worth: 100).
	
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 1
			               with: 1
			               with: 1).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         throwing: aLoadedDie
		         winningWhen: 1
		         using: (CardDealer with: (OrderedCollection
					           with: AccelerationCard)).
	aGame applyEveryone: (AccelerationCard owner: 'red').
	aGame movePlayer.
	aGame movePlayer.
	
	aGame applyEveryone: (RedoCard owner: 'red').

	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersBox
		equals: (OrderedCollection with: 6 with: 6)
]

{ #category : #tests }
CardsTest >> testQ033VerifyTheCorrectUseOfRedoCardWhenLastCardPlayedIsARedoCard [

	| aGame aLoadedDie aBoard boxes |
	boxes := (BoxCreator use: (OrderedCollection with: (BoxProbability
				            using:
				            (RandomCardBox withCards:
					             (OrderedCollection with: RedoCard))
				            withChance: 100))) create: 10.
	aBoard := Board with: boxes measure: (Parsec worth: 100).
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 1
			               with: 1
			               with: 1).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         throwing: aLoadedDie
		         winningWhen: 1
		         using: (CardDealer with: (OrderedCollection
					           with: AccelerationCard)).
	aGame applyEveryone: (AccelerationCard owner: 'red').
	aGame movePlayer.
	aGame movePlayer.
	aGame movePlayer.
	aGame movePlayer.
	aGame applyEveryone: (RedoCard owner: 'red').
	aGame applyEveryone: (RedoCard owner: 'red').
	aGame movePlayer.
	aGame movePlayer.
	
	self
		assert: aGame playersBox
		equals: (OrderedCollection with: 9 with: 9)
]

{ #category : #tests }
CardsTest >> testQ034VerifyTheCorrectUseOfRepeatCardWhenLastBoxIsASpeedUpOne [

	| aGame aLoadedDie boxes aBoard |
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 1
			               with: 3
			               with: 4).
	boxes := (BoxCreator use: (OrderedCollection with:
			           (BoxProbability using: SpeedUpBox new withChance: 100))) 
		         create: 10.
	aBoard := Board with: boxes measure: (Parsec worth: 100).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         throwing: aLoadedDie
		         winningWhen: 1
		         using:
		         (CardDealer with: (OrderedCollection with: RepeatCard)).
	aGame movePlayer.
	aGame movePlayer.
	aGame apply: (RepeatCard owner: 'red') to: 'red'.

	self
		assert: aGame playersBox
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
	boxes := (BoxCreator use: (OrderedCollection with:
			           (BoxProbability using: WormHoleBox new withChance: 100))) 
		         create: 10.
	aBoard := Board with: boxes measure: (Parsec worth: 100).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         throwing: aLoadedDie
		         winningWhen: 1
		         using:
		         (CardDealer with: (OrderedCollection with: RepeatCard)).

	aGame movePlayer.
	aGame movePlayer.
	aGame apply: (RepeatCard owner: 'red') to: 'blue'.

	self
		assert: aGame playersBox
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
		         using:
		         (CardDealer with: (OrderedCollection with: RepeatCard)).


	aGame movePlayer.
	aGame movePlayer.
	aGame apply: (RepeatCard owner: 'red') to: 'red'.

	self
		assert: aGame playersBox
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
	boxes := (BoxCreator use: (OrderedCollection with:
			           (BoxProbability using: AtomicBombBox new withChance: 100))) 
		         create: 10.
	aBoard := Board with: boxes measure: (Parsec worth: 100).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         throwing: aLoadedDie
		         winningWhen: 1
		         using:
		         (CardDealer with: (OrderedCollection with: RepeatCard)).


	aGame movePlayer.
	aGame movePlayer.
	aGame apply: (RepeatCard owner: 'red') to: 'red'.


	self
		assert: aGame playersBox
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
		         using:
		         (CardDealer with: (OrderedCollection with: RepeatCard)).


	aGame movePlayer.
	aGame movePlayer.
	aGame apply: (RepeatCard owner: 'red') to: 'red'.


	self
		assert: aGame playersBox
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
		         (CardDealer with:
			          (OrderedCollection with: AccelerationCard)).
	aGame movePlayer.
	self
		should: [ 
			aGame
				applyEveryone: (AccelerationCard owner: 'red') ]
		raise: Error
		withMessage:
		'A permanent card can only be use when it is your turn'.
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
		         (CardDealer with: (OrderedCollection with: SpeedCard)).
	aGame movePlayer.
	self
		should: [ 
			aGame
				apply: (SpeedCard owner: 'red')
				to: 'red' ]
		raise: Error
		withMessage: 'A permanent card can only be use when it is your turn'
]

{ #category : #tests }
CardsTest >> testQ042VerifyThatCancellationCardCanBePlayWheneverThePlayerWants [

	| aGame aLoadedDie aBoard boxes |
	boxes := (BoxCreator use: (OrderedCollection with: (BoxProbability
				            using:
				            (RandomCardBox withCards:
					             (OrderedCollection with: CancellationCard))
				            withChance: 100))) create: 10.
	aBoard := Board with: boxes measure: (Parsec worth: 100).

	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 1
			               with: 1
			               with: 1).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         throwing: aLoadedDie
		         winningWhen: 1
		         using:
		         (CardDealer with:
			          (OrderedCollection with: AccelerationCard)).
	aGame applyEveryone: (AccelerationCard owner: 'red').
	aGame movePlayer.
	aGame
		apply: (CancellationCard owner: 'red')
		to: (AccelerationCard owner: 'blue').
	aGame movePlayer.

	self
		assert: aGame playersBox
		equals: (OrderedCollection with: 3 with: 2)
]

{ #category : #tests }
CardsTest >> testQ043VerifyThatRedoCardCanBePlayWheneverThePlayerWants [

	| aGame aLoadedDie aBoard boxes |
	boxes := (BoxCreator use: (OrderedCollection with: (BoxProbability
				            using:
				            (RandomCardBox withCards:
					             (OrderedCollection with: RedoCard))
				            withChance: 100))) create: 10.
	aBoard := Board with: boxes measure: (Parsec worth: 100).
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 1
			               with: 1
			               with: 1).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         throwing: aLoadedDie
		         winningWhen: 1
		         using: (CardDealer with: (OrderedCollection
					           with: AccelerationCard)).
	aGame applyEveryone: (AccelerationCard owner: 'red').
	aGame movePlayer.
	aGame applyEveryone: (RedoCard owner: 'red').
	aGame movePlayer.

	self
		assert: aGame playersBox
		equals: (OrderedCollection with: 3 with: 4)
]

{ #category : #tests }
CardsTest >> testQ044VerifyThatRepeatCardCanBePlayWheneverThePlayerWants [

	| aGame aLoadedDie boxes aBoard |
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 1
			               with: 3
			               with: 4).
	boxes := (BoxCreator use: (OrderedCollection with:
			           (BoxProbability using: SpeedUpBox new withChance: 100))) 
		         create: 10.
	aBoard := Board with: boxes measure: (Parsec worth: 100).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         throwing: aLoadedDie
		         winningWhen: 1
		         using:
		         (CardDealer with: (OrderedCollection with: RepeatCard)).
	aGame movePlayer.
	aGame apply: (RepeatCard owner: 'red') to: 'red'.
	aGame movePlayer.

	self
		assert: aGame playersBox
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

	boxes := (BoxCreator use: (OrderedCollection with: (BoxProbability
				            using:
				            (RandomCardBox withCards:
					             (OrderedCollection with: RedoCard))
				            withChance: 100))) create: 10.
	aBoard := Board with: boxes measure: (Parsec worth: 100).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         throwing: aLoadedDie
		         winningWhen: 1
		         using: (CardDealer with: (OrderedCollection
					           with: RepeatCard)).
					
	aGame movePlayer.
	aGame apply: (RepeatCard owner: 'red') to: 'red'.
	aGame apply: (RedoCard owner: 'red') to: 'blue'.
	aGame movePlayer.

	self
		assert: aGame playersCardInPosetion
		equals: (OrderedCollection with: 2 with: 4)
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
		         using:
		         (CardDealer with: (OrderedCollection with: OverloadCard)).
	self
		should: [ 
			aGame
				apply: (OverloadCard owner: 'red')
				to: (AccelerationCard owner: 'red') ]
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
		         using:
		         (CardDealer with:
			          (OrderedCollection with: AccelerationCard)).
	self
		should: [ 
			aGame
				apply: (AccelerationCard owner: 'red')
				to: (AccelerationCard owner: 'red') ]
		raise: Error
		withMessage: 'That is a general objective card must be use a general apply effect'
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
		         using:
		         (CardDealer with: (OrderedCollection with: SpeedCard)).
	self
		should: [ 
			aGame
				apply: (SpeedCard owner: 'red')
				to: (AccelerationCard owner: 'red') ]
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
		         using:
		         (CardDealer with: (OrderedCollection with: RepeatCard)).
	self
		should: [ 
		aGame apply: (RepeatCard owner: 'red') to: 'all' ]
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
		         using:
		         (CardDealer with: (OrderedCollection with: RedoCard)).
	self
		should: [ aGame apply: (RedoCard owner: 'red') to: 'all' ]
		raise: Error
		withMessage:
		'Redo card cannot be played because there are no cards that have been played before'
]

{ #category : #tests }
CardsTest >> testQ053VerifyThatThereIsAnErrorWhenARedoCardIsUseToEveryoneWhenTheLastCardPlayedIsAnSpeedCard [

	| aGame aLoadedDie aBoard boxes |
	boxes := (BoxCreator use: (OrderedCollection with: (BoxProbability
				            using:
				            (RandomCardBox withCards:
					             (OrderedCollection with: RedoCard))
				            withChance: 100))) create: 10.
	aBoard := Board with: boxes measure: (Parsec worth: 100).
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 1
			               with: 1
			               with: 1).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         throwing: aLoadedDie
		         winningWhen: 1
		         using: (CardDealer with:
				          (OrderedCollection
					           with: SpeedCard)).
	aGame apply: (SpeedCard owner: 'red') to: 'red'.
	aGame movePlayer.
	aGame movePlayer.
	
		self
		should: [ aGame applyEveryone: (RedoCard owner: 'red')]
		raise: Error
		withMessage:
		'That is not a general objective card, must be use a single player apply effect'
]
