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
	^ aGame := DuplaGalacticaGameProxy
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
	aGame applyOverloadCardTo: 'blue'.
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
	aGame applyOverloadCardTo: 'blue'.
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
	aGame applyOverloadCardTo: 'blue'.
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
	aGame applyOverloadCardTo: 'blue'.
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
	aGame applySpeedCardTo: 'red'.
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
	aGame applySpeedCardTo: 'red'.
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
	aGame applySpeedCardTo: 'red'.
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
	aGame applySpeedCardTo: 'red'.
	aGame applyOverloadCardTo: 'red'.
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
	aGame applyAccelerationCard.
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
	aGame applyAccelerationCard.
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
	aGame applyOverloadCardTo: 'blue'.
	aGame movePlayer.
	aGame movePlayer.
	aGame applyCancellationCardTo: 'blue' number: 1.
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
	aGame applyOverloadCardTo: 'blue'.
	aGame applySpeedCardTo: 'blue'.
	aGame movePlayer.
	aGame movePlayer.
	aGame applyCancellationCardTo: 'blue' number: 2.
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
	aGame applyOverloadCardTo: 'blue'.
	aGame applySpeedCardTo: 'blue'.
	aGame movePlayer.
	aGame movePlayer.
	aGame applyCancellationCardTo: 'blue' number: 2.
	aGame movePlayer.
	aGame movePlayer.
	aGame applyCancellationCardTo: 'blue' number: 1.
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
	self
		should: [ aGame applyCancellationCardTo: 'blue' number: 1 ]
		raise: Error
		withMessage: 'There are no permanent cards'
]

{ #category : #tests }
CardsTest >> testQ015TryToCancellAPermanentCardWithAnInvalidIndex [

	| aGame |
	aGame := self createGame: (LoadedDie with: (OrderedCollection
				           with: 1
				           with: 2
				           with: 3
				           with: 4)).
	aGame applyOverloadCardTo: 'blue'.
	self
		should: [ aGame applyCancellationCardTo: 'blue' number: 2 ]
		raise: Error
		withMessage: 'There are no cards in that index'
]

{ #category : #tests }
CardsTest >> testQ016TryToCancellAPermanentCardWithANegativeIndex [

	| aGame |
	aGame := self createGame: (LoadedDie with: (OrderedCollection
				           with: 1
				           with: 2
				           with: 3
				           with: 4)).
	aGame applyOverloadCardTo: 'blue'.
	self
		should: [ aGame applyCancellationCardTo: 'blue' number: -1 ]
		raise: Error
		withMessage: 'There are no cards in that index'
]
