Class {
	#name : #BoxesTest,
	#superclass : #TestCase,
	#instVars : [
		'aColorCollection'
	],
	#category : #'IngSoft2-Tests'
}

{ #category : #running }
BoxesTest >> setUp [

	super setUp.

	aColorCollection := OrderedCollection with: 'red' with: 'blue'.
]

{ #category : #tests }
BoxesTest >> should: anErrorBlock raise: anExceptionClass withMessage: anErrorMessage [

	self
		should: anErrorBlock
		raise: anExceptionClass
		withExceptionDo: [ :error | 
		self assert: error messageText equals: anErrorMessage ]
]

{ #category : #tests }
BoxesTest >> testN001CheckNoEffectBoxDoesNotApplyAnyEffect [
	|aLoadedDie aGame boxes aBoard |
	aLoadedDie := LoadedDie with: (OrderedCollection  with: 6 with: 8 with: 5 with: 8).
	boxes:= OrderedCollection
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
	aBoard:= Board with: 10 effects: boxes measure: 100.
	aGame := DuplaGalacticaGameProxy
		               with: aColorCollection
		               and: aBoard
		               throwing: aLoadedDie
							winningWhen: 1
							using: CardDealer new.
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersPositions
		equals: (OrderedCollection with: 7 with: 9)
]

{ #category : #tests }
BoxesTest >> testN002CheckTheWormHoleBoxApplyANegativeEffect [

	| aLoadedDie aGame boxes aBoard |
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 5
			               with: 8
			               with: 5
			               with: 8).
	boxes := OrderedCollection
		         with: NoEffectBox new
		         with: NoEffectBox new
		         with: NoEffectBox new
		         with: NoEffectBox new
		         with: NoEffectBox new
		         with: WormHoleBox new.
	boxes addLast: NoEffectBox new.
	boxes addLast: NoEffectBox new.
	boxes addLast: NoEffectBox new.
	boxes addLast: NoEffectBox new.
	aBoard := Board with: 10 effects: boxes measure: 100.
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         throwing: aLoadedDie
		         winningWhen: 1
		         using: CardDealer new.
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersPositions
		equals: (OrderedCollection with: 2 with: 9)
]

{ #category : #tests }
BoxesTest >> testN003CheckSpeedUpBoxApplyAPositiveEffectOnThePosition [

	| aLoadedDie aGame boxes aBoard |
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 8
			               with: 5
			               with: 8).
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
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         throwing: aLoadedDie
		         winningWhen: 1
		         using: CardDealer new.
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersPositions
		equals: (OrderedCollection with: 6 with: 9)
]

{ #category : #tests }
BoxesTest >> testN004CheckMoonWalkBoxApplyTheCorrectEffectOnTheOtherPlayers [

	| aLoadedDie aGame boxes aBoard |
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 8
			               with: 3
			               with: 5
			               with: 8).
	boxes := OrderedCollection
		         with: NoEffectBox new
		         with: NoEffectBox new
		         with: NoEffectBox new
		         with: (MoonWalkBox with: -2)
		         with: NoEffectBox new
		         with: NoEffectBox new.
	boxes addLast: NoEffectBox new.
	boxes addLast: NoEffectBox new.
	boxes addLast: NoEffectBox new.
	boxes addLast: NoEffectBox new.
	aBoard := Board with: 10 effects: boxes measure: 100.
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         throwing: aLoadedDie
		         winningWhen: 1
		         using: CardDealer new.
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersPositions
		equals: (OrderedCollection with: 7 with: 4)
]

{ #category : #tests }
BoxesTest >> testN005ChackAtomicBombBoxMoveAllthePlayersToTheBeginning [

	| aLoadedDie aGame boxes aBoard |
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 8
			               with: 7
			               with: 5
			               with: 8).
	boxes := OrderedCollection
		         with: NoEffectBox new
		         with: NoEffectBox new
		         with: NoEffectBox new
		         with: NoEffectBox new
		         with: NoEffectBox new
		         with: NoEffectBox new.
	boxes addLast: NoEffectBox new.
	boxes addLast: AtomicBombBox new.
	boxes addLast: NoEffectBox new.
	boxes addLast: NoEffectBox new.
	aBoard := Board with: 10 effects: boxes measure: 100.
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         throwing: aLoadedDie
		         winningWhen: 1
		         using: CardDealer new.
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersPositions
		equals: (OrderedCollection with: 1 with: 1)
]

{ #category : #tests }
BoxesTest >> testN006CheckHyperJumpBoxMoveTheCorrectAmountOfParsecsWhenTheyAreEntireValues [

	| aLoadedDie aGame boxes aBoard |
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 3
			               with: 3
			               with: 5
			               with: 8).
	boxes := OrderedCollection
		         with: NoEffectBox new
		         with: NoEffectBox new
		         with: NoEffectBox new
		         with:
		         (HyperJumpBox with: (OrderedCollection with: 40 with: 30))
		         with: NoEffectBox new
		         with: NoEffectBox new.
	boxes addLast: NoEffectBox new.
	boxes addLast: NoEffectBox new.
	boxes addLast: NoEffectBox new.
	boxes addLast: NoEffectBox new.
	aBoard := Board with: 10 effects: boxes measure: 100.
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         throwing: aLoadedDie
		         winningWhen: 1
		         using: CardDealer new.
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersPositions
		equals: (OrderedCollection with: 8 with: 7)
]

{ #category : #tests }
BoxesTest >> testN007CheckWormHoleBoxDoesNotAllowThePlayerToBeInANegativePosition [

	| aLoadedDie aGame boxes aBoard |
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 8
			               with: 5
			               with: 8).
	boxes := OrderedCollection
		         with: NoEffectBox new
		         with: WormHoleBox new
		         with: NoEffectBox new
		         with: NoEffectBox new
		         with: NoEffectBox new
		         with: NoEffectBox new.
	boxes addLast: NoEffectBox new.
	boxes addLast: NoEffectBox new.
	boxes addLast: NoEffectBox new.
	boxes addLast: NoEffectBox new.
	aBoard := Board with: 10 effects: boxes measure: 100.
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         throwing: aLoadedDie
		         winningWhen: 1
		         using: CardDealer new.
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersPositions
		equals: (OrderedCollection with: 1 with: 9)
]

{ #category : #tests }
BoxesTest >> testN008CheckMoonWalkBoxDoesNotAllowThePlayersToBeInANegativePosition [

	| aLoadedDie aGame boxes aBoard |
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 4
			               with: 5
			               with: 8).
	boxes := OrderedCollection
		         with: NoEffectBox new
		         with: NoEffectBox new
		         with: NoEffectBox new
		         with: NoEffectBox new
		         with: (MoonWalkBox with: -4)
		         with: NoEffectBox new.
	boxes addLast: NoEffectBox new.
	boxes addLast: NoEffectBox new.
	boxes addLast: NoEffectBox new.
	boxes addLast: NoEffectBox new.
	aBoard := Board with: 10 effects: boxes measure: 100.
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         throwing: aLoadedDie
		         winningWhen: 1
		         using: CardDealer new.
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersPositions
		equals: (OrderedCollection with: 1 with: 5)
]

{ #category : #tests }
BoxesTest >> testN009CheckHyperJumpBoxDoesNotAllowThePlayersToBeInANegativePosition [

	| aLoadedDie aGame boxes aBoard |
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 3
			               with: 3
			               with: 5
			               with: 8).
	boxes := OrderedCollection
		         with: NoEffectBox new
		         with: NoEffectBox new
		         with: NoEffectBox new
		         with:
		         (HyperJumpBox with: (OrderedCollection with: -40 with: -10))
		         with: NoEffectBox new
		         with: NoEffectBox new.
	boxes addLast: NoEffectBox new.
	boxes addLast: NoEffectBox new.
	boxes addLast: NoEffectBox new.
	boxes addLast: NoEffectBox new.
	aBoard := Board with: 10 effects: boxes measure: 100.
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         throwing: aLoadedDie
		         winningWhen: 1
		         using: CardDealer new.
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersPositions
		equals: (OrderedCollection with: 1 with: 3)
]

{ #category : #tests }
BoxesTest >> testN010CheckTheEffectApplysAlsoWhenTheSpaceshipReachTheGoal [

	| aLoadedDie aGame boxes aBoard |
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 11
			               with: 3
			               with: 5
			               with: 8).
	boxes := OrderedCollection
		         with: NoEffectBox new
		         with: WormHoleBox new
		         with: NoEffectBox new
		         with: NoEffectBox new
		         with: NoEffectBox new
		         with: NoEffectBox new.
	boxes addLast: NoEffectBox new.
	boxes addLast: NoEffectBox new.
	boxes addLast: NoEffectBox new.
	boxes addLast: NoEffectBox new.
	aBoard := Board with: 10 effects: boxes measure: 100.
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         throwing: aLoadedDie
		         winningWhen: 1
		         using: CardDealer new.
	aGame movePlayer.
	self
		should: [ aGame winner ]
		raise: Error
		withMessage: 'There is no winner'
]

{ #category : #tests }
BoxesTest >> testN011CheckHyperJumpBoxMoveTheCorrectAmountOfParsecsWhenTheyAreNotEntireValues [

	| aLoadedDie aGame boxes aBoard |
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 3
			               with: 3
			               with: 5
			               with: 8).
	boxes := OrderedCollection
		         with: NoEffectBox new
		         with: NoEffectBox new
		         with: NoEffectBox new
		         with:
		         (HyperJumpBox with:
			          (OrderedCollection with: 45.5 with: 34.9))
		         with: NoEffectBox new
		         with: NoEffectBox new.
	boxes addLast: NoEffectBox new.
	boxes addLast: NoEffectBox new.
	boxes addLast: NoEffectBox new.
	boxes addLast: NoEffectBox new.
	aBoard := Board with: 10 effects: boxes measure: 100.
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         throwing: aLoadedDie
		         winningWhen: 1
		         using: CardDealer new.
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersPositions
		equals: (OrderedCollection with: 8 with: 7)
]

{ #category : #tests }
BoxesTest >> testR001CheckRandomCardBoxGeneratesARandomCard [

	| aLoadedDie aGame boxes aBoard |
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 3
			               with: 5
			               with: 5
			               with: 8).
	boxes := OrderedCollection
		         with: NoEffectBox new
		         with: NoEffectBox new
		         with: NoEffectBox new
		         with: RandomCardBox new
		         with: NoEffectBox new
		         with: NoEffectBox new.
	boxes addLast: NoEffectBox new.
	boxes addLast: NoEffectBox new.
	boxes addLast: NoEffectBox new.
	boxes addLast: NoEffectBox new.
	aBoard := Board with: 10 effects: boxes measure: 100.
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         throwing: aLoadedDie
		         winningWhen: 1
		         using: CardDealer new.
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersCardInPosetion
		equals: (OrderedCollection with: 3 with: 2)
]

{ #category : #tests }
BoxesTest >> testR002CheckRandomCardBoxGeneratesARandomCardMoreThanOneTimeIfNecessary [

	| aLoadedDie aGame boxes aBoard |
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 3
			               with: 3
			               with: 3
			               with: 8).
	boxes := OrderedCollection
		         with: NoEffectBox new
		         with: NoEffectBox new
		         with: NoEffectBox new
		         with: RandomCardBox new
		         with: NoEffectBox new
		         with: NoEffectBox new.
	boxes addLast: RandomCardBox new.
	boxes addLast: NoEffectBox new.
	boxes addLast: NoEffectBox new.
	boxes addLast: NoEffectBox new.
	aBoard := Board with: 10 effects: boxes measure: 100.
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         throwing: aLoadedDie
		         winningWhen: 1
		         using: CardDealer new.
	aGame movePlayer.
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersCardInPosetion
		equals: (OrderedCollection with: 4 with: 3)
]
