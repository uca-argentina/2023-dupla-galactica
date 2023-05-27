Class {
	#name : #CardsTest,
	#superclass : #TestCase,
	#instVars : [
		'aColorCollection'
	],
	#category : #'IngSoft2-Tests'
}

{ #category : #Game }
CardsTest >> createGame: aLoadedDie [

	| boxes aBoard aGame |
	boxes := OrderedCollection
		         with: NoEffectBox new
		         with: NoEffectBox new
		         with: NoEffectBox new
		         with: NoEffectBox new
		         with: NoEffectBox new
		         with: NoEffectBox new.
	boxes addLast: NoEffectBox new.
	boxes addLast: NoEffectBox new.
	boxes addLast: NoEffectBox new.
	boxes addLast: NoEffectBox new.
	aBoard := Board with: 10 effects: boxes measure: 100.
	^ aGame := DuplaGalacticaGame
		           with: aColorCollection
		           and: aBoard
		           throwing: aLoadedDie
		           winningWhen: 1
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

	| aGame |
	aGame := self createGame: (LoadedDie with: (OrderedCollection
				           with: 1
				           with: 2
				           with: 3
				           with: 4)).
	aGame addCard: 'Overload' to: 'red'.
	aGame applyCard: 'Overload' to: 'blue' from: 'red'.
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersPositions
		equals: (OrderedCollection with: 2 with: 1)
]

{ #category : #tests }
CardsTest >> testQ002VerifyTheCorrectUseOfOverloadCardWhenThrowingMoreThanOneTime [

	| aGame |
	aGame := self createGame: (LoadedDie with: (OrderedCollection
				           with: 1
				           with: 2
				           with: 3
				           with: 4)).
	aGame addCard: 'Overload' to: 'red'.
	aGame applyCard: 'Overload' to: 'blue' from: 'red'.
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

	| aGame |
	aGame := self createGame: (LoadedDie with: (OrderedCollection
				           with: 1
				           with: 5
				           with: 3
				           with: 0)).
	aGame addCard: 'Overload' to: 'red'.
	aGame applyCard: 'Overload' to: 'blue' from: 'red'.
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

	| aGame |
	aGame := self createGame: (LoadedDie with: (OrderedCollection
				           with: 1
				           with: 0
				           with: 3
				           with: 4)).
	aGame addCard: 'Overload' to: 'red'.
	aGame applyCard: 'Overload' to: 'blue' from: 'red'.
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersPositions
		equals: (OrderedCollection with: 2 with: 1)
]

{ #category : #tests }
CardsTest >> testQ005VerifyTheCorrectUseOfASpeedCard [

	| aGame |
	aGame := self createGame: (LoadedDie with: (OrderedCollection
				           with: 1
				           with: 4
				           with: 3
				           with: 4)).
	aGame addCard: 'Speed' to: 'blue'.
	aGame applyCard: 'Speed' to: 'red' from: 'blue'.
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersPositions
		equals: (OrderedCollection with: 3 with: 5)
]

{ #category : #tests }
CardsTest >> testQ006VerifyTheCorrectUseOfASpeedCardWhenThrowingMoreThanOneTime [

	| aGame |
	aGame := self createGame: (LoadedDie with: (OrderedCollection
				           with: 1
				           with: 2
				           with: 3
				           with: 5)).
	aGame addCard: 'Speed' to: 'blue'.
	aGame applyCard: 'Speed' to: 'red' from: 'blue'.
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

	| aGame |
	aGame := self createGame: (LoadedDie with: (OrderedCollection
				           with: 9
				           with: 2
				           with: 3
				           with: 5)).
	aGame addCard: 'Speed' to: 'blue'.
	aGame applyCard: 'Speed' to: 'red' from: 'blue'.
	aGame movePlayer.
	self
		assert: aGame playersLaps
		equals: (OrderedCollection with: 1 with: 0)
]

{ #category : #tests }
CardsTest >> testQ008VerifyTheCorrectUseOfPermanentCardsWhenAPlayerHasMoreThanOneActive [

	| aGame |
	aGame := self createGame: (LoadedDie with: (OrderedCollection
				           with: 5
				           with: 2
				           with: 3
				           with: 5)).
	aGame addCard: 'Speed' to: 'blue'.
	aGame addCard: 'Overload' to: 'blue'.

	aGame applyCard: 'Speed' to: 'red' from: 'blue'.
	aGame applyCard: 'Overload' to: 'red' from: 'blue'.
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersPositions
		equals: (OrderedCollection with: 5 with: 3)
]

{ #category : #tests }
CardsTest >> testQ009VerifyTheCorrectUseOfAccelerationCard [

	| aGame |
	aGame := self createGame: (LoadedDie with: (OrderedCollection
				           with: 1
				           with: 2
				           with: 3
				           with: 4)).
	aGame addCard: 'Acceleration' to: 'red'.
	aGame applyCard: 'Acceleration' from: 'red'.
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersPositions 
		equals: (OrderedCollection with: 3 with: 4)
]

{ #category : #tests }
CardsTest >> testQ010VerifyTheCorrectUseOfAccelerationCardWhenHasToRaiseALap [

	| aGame |
	aGame := self createGame: (LoadedDie with: (OrderedCollection
				           with: 8
				           with: 9
				           with: 3
				           with: 4)).
	aGame addCard: 'Acceleration' to: 'red'.
	aGame applyCard: 'Acceleration' from: 'red'.
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersPositions
		equals: (OrderedCollection with: 10 with: 1)
]

{ #category : #tests }
CardsTest >> testQ011VerifyTheCorrectUseOfCancellationCard [

	| aGame |
	aGame := self createGame: (LoadedDie with: (OrderedCollection
				           with: 1
				           with: 2
				           with: 3
				           with: 4)).

	aGame addCard: 'Cancellation' to: 'blue'.
	aGame addCard: 'Overload' to: 'red'.
	aGame applyCard: 'Overload' to: 'blue' from: 'red'.
	aGame movePlayer.
	aGame movePlayer.
	aGame applyCard: 'Cancellation' to: 'blue' from: 'blue' ofCard: 'Overload'.
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersPositions
		equals: (OrderedCollection with: 5 with: 5)
]

{ #category : #tests }
CardsTest >> testQ012VerifyTheCorrectUseOfCancellationCardWhenThePlayerHasMoreThanOneCard [

	| aGame |
	aGame := self createGame: (LoadedDie with: (OrderedCollection
				           with: 1
				           with: 2
				           with: 3
				           with: 4)).
	aGame addCard: 'Cancellation' to: 'red'.
	aGame addCard: 'Overload' to: 'red'.
	aGame addCard: 'Speed' to: 'red'.
	aGame applyCard: 'Overload' to: 'blue' from: 'red'.
	aGame applyCard: 'Speed' to: 'blue' from: 'red'.
	aGame movePlayer.
	aGame movePlayer.
	aGame
		applyCard: 'Cancellation'
		to: 'blue'
		from: 'red'
		ofCard: 'Speed'.
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersPositions
		equals: (OrderedCollection with: 5 with: 4)
]

{ #category : #tests }
CardsTest >> testQ013VerifyTheCorrectUseOfTwoCancellationCards [

	| aGame |
	aGame := self createGame: (LoadedDie with: (OrderedCollection
				           with: 1
				           with: 2
				           with: 3
				           with: 4)).
	aGame addCard: 'Cancellation' to: 'blue'.
	aGame addCard: 'Cancellation' to: 'red'.
	aGame addCard: 'Overload' to: 'red'.
	aGame addCard: 'Speed' to: 'red'.
	aGame applyCard: 'Overload' to: 'blue' from: 'red'.
	aGame applyCard: 'Speed' to: 'blue' from: 'red'.
	aGame movePlayer.
	aGame movePlayer.
	aGame
		applyCard: 'Cancellation'
		to: 'blue'
		from: 'red'
		ofCard: 'Speed'.
	aGame movePlayer.
	aGame movePlayer.
	aGame
		applyCard: 'Cancellation'
		to: 'blue'
		from: 'blue'
		ofCard: 'Overload'.
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersPositions
		equals: (OrderedCollection with: 6 with: 6)
]

{ #category : #tests }
CardsTest >> testQ014TryToCancellAPermanentCardWhenThePlayerDoesNotHaveOne [

	| aGame |
	aGame := self createGame: (LoadedDie with: (OrderedCollection
				           with: 1
				           with: 2
				           with: 3
				           with: 4)).
	aGame addCard: 'Cancellation' to: 'red'.
	self
		should: [ 
			aGame
				applyCard: 'Cancellation'
				to: 'blue'
				from: 'red'
				ofCard: 'Overload' ]
		raise: Error
		withMessage: 'There are no permanent cards'
]

{ #category : #tests }
CardsTest >> testQ015TryToCancellAPermanentCardWithATypeOfCardThatIsNotActivate [

	| aGame |
	aGame := self createGame: (LoadedDie with: (OrderedCollection
				           with: 1
				           with: 2
				           with: 3
				           with: 4)).
	aGame addCard: 'Overload' to: 'red'.
	aGame addCard: 'Cancellation' to: 'red'.
	aGame applyCard: 'Overload' to: 'blue' from: 'red'.

	self
		should: [ 
			aGame
				applyCard: 'Cancellation'
				to: 'blue'
				from: 'red'
				ofCard: 'Speed' ]
		raise: Error
		withMessage:
		'There are no that type of cards activate in this player'
]

{ #category : #tests }
CardsTest >> testQ017TryToUseAnOverLoadCardWhenThePlayerDoesNotHaveOne [

	| aGame |
	aGame := self createGame: (LoadedDie with: (OrderedCollection
				           with: 1
				           with: 2
				           with: 3
				           with: 4)).
	aGame addCard: 'Overload' to: 'blue'.
	aGame applyCard: 'Overload' to: 'blue' from: 'red'.

	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersPositions
		equals: (OrderedCollection with: 2 with: 3)
]

{ #category : #tests }
CardsTest >> testQ018TryToUseASpeedCardWhenThePlayerDoesNotHaveOne [

	| aGame |
	aGame := self createGame: (LoadedDie with: (OrderedCollection
				           with: 1
				           with: 2
				           with: 3
				           with: 4)).
	aGame addCard: 'Speed' to: 'blue'.

	aGame applyCard: 'Speed' to: 'blue' from: 'red'.
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersPositions
		equals: (OrderedCollection with: 2 with: 3)
]

{ #category : #tests }
CardsTest >> testQ019TryToUseAnAccelerationCardWhenThePlayerDoesNotHaveOne [

	| aGame |
	aGame := self createGame: (LoadedDie with: (OrderedCollection
				           with: 1
				           with: 2
				           with: 3
				           with: 4)).
	aGame addCard: 'Acceleration' to: 'blue'.
	aGame applyCard: 'Acceleration' from: 'red'.

	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersPositions
		equals: (OrderedCollection with: 2 with: 3)
]

{ #category : #tests }
CardsTest >> testQ020UseTwoOverLoadCardsFromTheSamePlayerToTheSamePlayer [

	| aGame |
	aGame := self createGame: (LoadedDie with: (OrderedCollection
				           with: 1
				           with: 4
				           with: 3
				           with: 4)).
	aGame addCard: 'Overload' to: 'red'.
	aGame addCard: 'Overload' to: 'red'.
	aGame applyCard: 'Overload' to: 'blue' from: 'red'.
	aGame applyCard: 'Overload' to: 'blue' from: 'red'.

	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersPositions
		equals: (OrderedCollection with: 2 with: 1)
]

{ #category : #tests }
CardsTest >> testQ021UseAnOverLoadCardAndThenTryToUseItAgainButItHasGoneAway [

	| aGame |
	aGame := self createGame: (LoadedDie with: (OrderedCollection
				           with: 1
				           with: 4
				           with: 3
				           with: 4)).
	aGame addCard: 'Overload' to: 'red'.
	aGame applyCard: 'Overload' to: 'blue' from: 'red'.
	aGame applyCard: 'Overload' to: 'blue' from: 'red'.
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersPositions
		equals: (OrderedCollection with: 2 with: 3)
]

{ #category : #tests }
CardsTest >> testQ022UseTwoSpeedCardsFromTheSamePlayerToTheSamePlayer [

	| aGame |
	aGame := self createGame: (LoadedDie with: (OrderedCollection
				           with: 1
				           with: 4
				           with: 3
				           with: 4)).
	aGame addCard: 'Speed' to: 'red'.
	aGame addCard: 'Speed' to: 'red'.
	aGame applyCard: 'Speed' to: 'blue' from: 'red'.
	aGame applyCard: 'Speed' to: 'blue' from: 'red'.
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersPositions
		equals: (OrderedCollection with: 2 with: 7)
]

{ #category : #tests }
CardsTest >> testQ023UseASpeedCardAndThenTryToUseItAgainButItHasGoneAway [

	| aGame |
	aGame := self createGame: (LoadedDie with: (OrderedCollection
				           with: 1
				           with: 4
				           with: 3
				           with: 4)).
	aGame addCard: 'Speed' to: 'red'.
	aGame applyCard: 'Speed' to: 'blue' from: 'red'.
	aGame applyCard: 'Speed' to: 'blue' from: 'red'.
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersPositions
		equals: (OrderedCollection with: 2 with: 6)
]

{ #category : #tests }
CardsTest >> testQ024UseTwoAccelerationCardsFromTheSamePlayer [

	| aGame |
	aGame := self createGame: (LoadedDie with: (OrderedCollection
				           with: 1
				           with: 4
				           with: 3
				           with: 4)).
	aGame addCard: 'Acceleration' to: 'red'.
	aGame addCard: 'Acceleration' to: 'red'.
	aGame applyCard: 'Acceleration' from: 'red'.
	aGame applyCard: 'Acceleration' from: 'red'.
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersPositions
		equals: (OrderedCollection with: 4 with: 7)
]

{ #category : #tests }
CardsTest >> testQ025UseAnAccelerationCardAnThenTryToUseItAgainButItHasGoneAway [

	| aGame |
	aGame := self createGame: (LoadedDie with: (OrderedCollection
				           with: 1
				           with: 4
				           with: 3
				           with: 4)).
	aGame addCard: 'Acceleration' to: 'red'.
	aGame applyCard: 'Acceleration' from: 'red'.
	aGame applyCard: 'Acceleration' from: 'red'.
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersPositions
		equals: (OrderedCollection with: 3 with: 6)
]

{ #category : #tests }
CardsTest >> testQ026TryToUseACancellationCardWhenThePlayerDoesNotHaveOne [

	| aGame |
	aGame := self createGame: (LoadedDie with: (OrderedCollection
				           with: 1
				           with: 2
				           with: 3
				           with: 4)).
	aGame addCard: 'Overload' to: 'red'.

	aGame applyCard: 'Overload' to: 'blue' from: 'red'.
	aGame
		applyCard: 'Cancellation'
		to: 'blue'
		from: 'red'
		ofCard: 'Overload'.
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersPositions
		equals: (OrderedCollection with: 2 with: 1)
]

{ #category : #tests }
CardsTest >> testQ027UseTwoCancellationCardsFromTheSamePlayer [

	| aGame |
	aGame := self createGame: (LoadedDie with: (OrderedCollection
				           with: 1
				           with: 4
				           with: 3
				           with: 4)).
	aGame addCard: 'Acceleration' to: 'red'.
	aGame addCard: 'Acceleration' to: 'red'.
	aGame addCard: 'Cancellation' to: 'red'.
	aGame addCard: 'Cancellation' to: 'red'.
	aGame applyCard: 'Acceleration' from: 'red'.
	aGame applyCard: 'Acceleration' from: 'red'.
	aGame
		applyCard: 'Cancellation'
		to: 'blue'
		from: 'red'
		ofCard: 'Acceleration'.
	aGame
		applyCard: 'Cancellation'
		to: 'blue'
		from: 'red'
		ofCard: 'Acceleration'.
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersPositions
		equals: (OrderedCollection with: 4 with: 5)
]

{ #category : #tests }
CardsTest >> testQ028UseCancellationCardAnThenTryToUseItAgainButItHasGoneAway [

	| aGame |
	aGame := self createGame: (LoadedDie with: (OrderedCollection
				           with: 1
				           with: 4
				           with: 3
				           with: 4)).
	aGame addCard: 'Acceleration' to: 'red'.
	aGame addCard: 'Acceleration' to: 'red'.
	aGame addCard: 'Cancellation' to: 'red'.

	aGame applyCard: 'Acceleration' from: 'red'.
	aGame applyCard: 'Acceleration' from: 'red'.
	aGame
		applyCard: 'Cancellation'
		to: 'blue'
		from: 'red'
		ofCard: 'Acceleration'.
	aGame
		applyCard: 'Cancellation'
		to: 'blue'
		from: 'red'
		ofCard: 'Acceleration'.
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersPositions
		equals: (OrderedCollection with: 4 with: 6)
]

{ #category : #tests }
CardsTest >> testQ029VerifyTheCorrectUseOfRedoCardWhenLastCardPlayIsAnOverloadCard [

	| aGame |
	aGame := self createGame: (LoadedDie with: (OrderedCollection
				           with: 4
				           with: 8
				           with: 3
				           with: 4)).
	aGame addCard: 'Overload' to: 'red'.
	aGame addCard: 'Redo' to: 'blue'.
	aGame applyCard: 'Overload' to: 'blue' from: 'red'.
	aGame applyCard: 'Redo' to:'red' from: 'blue'.
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersPositions
		equals: (OrderedCollection with: 3 with: 7)
]

{ #category : #tests }
CardsTest >> testQ030VerifyTheCorrectUseOfRedoCardWhenLastCardPlayedIsACancellationCard [

	| aGame |
	aGame := self createGame: (LoadedDie with: (OrderedCollection
				           with: 4
				           with: 8
				           with: 3
				           with: 4)).
	aGame addCard: 'Acceleration' to: 'red'.
	aGame addCard: 'Cancellation' to: 'red'.
	aGame addCard: 'Redo' to: 'blue'.
	aGame applyCard: 'Acceleration' from: 'red'.
	aGame
		applyCard: 'Cancellation'
		to: 'blue'
		from: 'red'
		ofCard: 'Acceleration'.
	aGame
		applyCard: 'Redo'
		to: 'red'
		from: 'blue'
		ofCard: 'Acceleration'.

	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersPositions
		equals: (OrderedCollection with: 5 with: 9)
]

{ #category : #tests }
CardsTest >> testQ031VerifyTheCorrectUseOfRedoCardWhenLastCardPlayedIsASpeedCard [

	| aGame |
	aGame := self createGame: (LoadedDie with: (OrderedCollection
				           with: 4
				           with: 8
				           with: 3
				           with: 4)).
	aGame addCard: 'Speed' to: 'red'.
	aGame addCard: 'Redo' to: 'blue'.
	aGame applyCard: 'Speed' to: 'red' from: 'red'.
	aGame applyCard: 'Redo' to: 'blue' from: 'blue'.

	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersPositions
		equals: (OrderedCollection with: 6 with: 10)
]

{ #category : #tests }
CardsTest >> testQ032VerifyTheCorrectUseOfRedoCardWhenLastCardPlayedIsAnAccelerationCard [

	| aGame |
	aGame := self createGame: (LoadedDie with: (OrderedCollection
				           with: 4
				           with: 8
				           with: 3
				           with: 4)).
	aGame addCard: 'Acceleration' to: 'red'.
	aGame addCard: 'Redo' to: 'blue'.
	aGame applyCard: 'Acceleration' from: 'red'.
	aGame applyCard: 'Redo' from: 'blue'.

	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersPositions
		equals: (OrderedCollection with: 7 with: 1)
]

{ #category : #tests }
CardsTest >> testQ033VerifyTheCorrectUseOfRedoCardWhenLastCardPlayedIsARedoCard [

	| aGame |
	aGame := self createGame: (LoadedDie with: (OrderedCollection
				           with: 4
				           with: 8
				           with: 3
				           with: 4)).
	aGame addCard: 'Acceleration' to: 'red'.
	aGame addCard: 'Redo' to: 'red'.
	aGame addCard: 'Redo' to: 'blue'.
	aGame applyCard: 'Acceleration' from: 'red'.
	aGame applyCard: 'Redo' from: 'blue'.
	aGame applyCard: 'Redo' from: 'red'.

	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersPositions
		equals: (OrderedCollection with: 8 with: 2)
]

{ #category : #tests }
CardsTest >> testQ034VerifyTheCorrectUseOfRepeatCardWhenLastBoxIsASpeedUpOne [

	| aGame aLoadedDie boxes aBoard|
	aLoadedDie:= LoadedDie with: (OrderedCollection
				           with: 4
				           with: 1
				           with: 3
				           with: 4).
	boxes := OrderedCollection
		         with: NoEffectBox new
		         with: SpeedUpBox new
		         with: NoEffectBox new
		         with: NoEffectBox new
		         with: NoEffectBox new
		         with: NoEffectBox new.
	boxes addLast: NoEffectBox new.
	boxes addLast: NoEffectBox new.
	boxes addLast: NoEffectBox new.
	boxes addLast: NoEffectBox new.
	aBoard := Board with: 10 effects: boxes measure: 100.
	aGame := DuplaGalacticaGame
		           with: aColorCollection
		           and: aBoard
		           throwing: aLoadedDie
		           winningWhen: 1.
				
	aGame addCard: 'Repeat' to: 'blue'.
	aGame movePlayer.
	aGame movePlayer.
	aGame applyCard: 'Repeat' to: 'blue' from: 'blue'.

	self
		assert: aGame playersPositions
		equals: (OrderedCollection with: 5 with: 10)
]

{ #category : #tests }
CardsTest >> testQ035VerifyTheCorrectUseOfRepeatCardWhenLastBoxIsAWormHoleOne [

	| aGame aLoadedDie boxes aBoard |
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 4
			               with: 9
			               with: 3
			               with: 4).
	boxes := OrderedCollection
		         with: NoEffectBox new
		         with: NoEffectBox new
		         with: NoEffectBox new
		         with: NoEffectBox new
		         with: NoEffectBox new
		         with: NoEffectBox new.
	boxes addLast: NoEffectBox new.
	boxes addLast: NoEffectBox new.
	boxes addLast: NoEffectBox new.
	boxes addLast: WormHoleBox new.
	aBoard := Board with: 10 effects: boxes measure: 100.
	aGame := DuplaGalacticaGame
		         with: aColorCollection
		         and: aBoard
		         throwing: aLoadedDie
		         winningWhen: 1.


	aGame addCard: 'Repeat' to: 'red'.
	aGame movePlayer.
	aGame movePlayer.
	aGame applyCard: 'Repeat' to: 'blue' from: 'red'.

	self
		assert: aGame playersPositions
		equals: (OrderedCollection with: 5 with: 2)
]

{ #category : #tests }
CardsTest >> testQ036VerifyTheCorrectUseOfRepeatCardWhenLastBoxIsAMoonWalkOne [

	| aGame aLoadedDie boxes aBoard |
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 4
			               with: 5
			               with: 3
			               with: 4).
	boxes := OrderedCollection
		         with: NoEffectBox new
		         with: NoEffectBox new
		         with: NoEffectBox new
		         with: NoEffectBox new
		         with: NoEffectBox new
		         with: (MoonWalkBox with: -2).
	boxes addLast: NoEffectBox new.
	boxes addLast: NoEffectBox new.
	boxes addLast: NoEffectBox new.
	boxes addLast: NoEffectBox new.
	aBoard := Board with: 10 effects: boxes measure: 100.
	aGame := DuplaGalacticaGame
		         with: aColorCollection
		         and: aBoard
		         throwing: aLoadedDie
		         winningWhen: 1.


	aGame addCard: 'Repeat' to: 'red'.
	aGame movePlayer.
	aGame movePlayer.
	aGame applyCard: 'Repeat' to: 'red' from: 'red'.

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
	boxes := OrderedCollection
		         with: NoEffectBox new
		         with: NoEffectBox new
		         with: NoEffectBox new
		         with: NoEffectBox new
		         with: NoEffectBox new
		         with: AtomicBombBox new.
	boxes addLast: NoEffectBox new.
	boxes addLast: NoEffectBox new.
	boxes addLast: NoEffectBox new.
	boxes addLast: NoEffectBox new.
	aBoard := Board with: 10 effects: boxes measure: 100.
	aGame := DuplaGalacticaGame
		         with: aColorCollection
		         and: aBoard
		         throwing: aLoadedDie
		         winningWhen: 1.


	aGame addCard: 'Repeat' to: 'red'.
	aGame movePlayer.
	aGame movePlayer.
	aGame applyCard: 'Repeat' to: 'red' from: 'red'.

	self
		assert: aGame playersPositions
		equals: (OrderedCollection with: 1 with: 1)
]

{ #category : #tests }
CardsTest >> testQ038VerifyTheCorrectUseOfRepeatCardWhenLastBoxIsHyperJumpOne [

	| aGame aLoadedDie boxes aBoard |
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 4
			               with: 5
			               with: 3
			               with: 4).
	boxes := OrderedCollection
		         with: NoEffectBox new
		         with: NoEffectBox new
		         with: NoEffectBox new
		         with: NoEffectBox new
		         with: NoEffectBox new
		         with:
		         (HyperJumpBox with: (OrderedCollection with: 40 with: 30)).
	boxes addLast: NoEffectBox new.
	boxes addLast: NoEffectBox new.
	boxes addLast: NoEffectBox new.
	boxes addLast: NoEffectBox new.
	aBoard := Board with: 10 effects: boxes measure: 100.
	aGame := DuplaGalacticaGame
		         with: aColorCollection
		         and: aBoard
		         throwing: aLoadedDie
		         winningWhen: 1.


	aGame addCard: 'Repeat' to: 'red'.
	aGame movePlayer.
	aGame movePlayer.
	aGame applyCard: 'Repeat' to: 'red' from: 'red'.

	self
		assert: aGame playersPositions
		equals: (OrderedCollection with: 8 with: 10)
]
