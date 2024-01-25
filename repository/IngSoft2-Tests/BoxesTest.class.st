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
BoxesTest >> testN001CheckNoEffectBoxDoesNotApplyAnyEffectThenValuePositions [

	| aLoadedDie aGame boxes aBoard aShaker |
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 6
			               with: 8
			               with: 5
			               with: 8).
	boxes := boxes := (BoxCreator use:
		                   (OrderedCollection with:
			                    (BoxProbability using: NoEffectBox new withChance: 100))) create: 10.
	aBoard := Board with: boxes measure: (Parsec worth: 100).
	aShaker := DiceShaker withDie: aLoadedDie.
	
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         usingToThrow: aShaker
		         winningWhen: 1
		         using: (CardDealer with: (OrderedCollection with: (CardProbability using: OverloadCard withChance: 100))).
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersBox
		equals: (OrderedCollection with: 7 with: 9)
]

{ #category : #tests }
BoxesTest >> testN002CheckTheWormHoleBoxApplyANegativeEffectThenValuePositions [

	| aLoadedDie aGame boxes aBoard aShaker |
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 5
			               with: 8
			               with: 5
			               with: 8).
	boxes := (BoxCreator use:
		          (OrderedCollection with:  (BoxProbability using: WormHoleBox new withChance: 100))) 
		         create: 10.
	aBoard := Board with: boxes measure: (Parsec worth: 100).
	aShaker := DiceShaker withDie: aLoadedDie.
	
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         usingToThrow: aShaker
		         winningWhen: 1
		         using: (CardDealer with: (OrderedCollection with: (CardProbability using: OverloadCard withChance: 100))).
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersBox
		equals: (OrderedCollection with: 2 with: 5)
]

{ #category : #tests }
BoxesTest >> testN003CheckSpeedUpBoxApplyAPositiveEffectOnThePositionThenValuePositions [

	| aLoadedDie aGame boxes aBoard aShaker |
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 8
			               with: 5
			               with: 8).
	boxes := boxes := (BoxCreator use:
		                   (OrderedCollection with:
			                     (BoxProbability using: SpeedUpBox new withChance: 100))) create: 10.
	aBoard := Board with: boxes measure: (Parsec worth: 100).
	aShaker := DiceShaker withDie: aLoadedDie.
	
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         usingToThrow: aShaker
		         winningWhen: 1
		         using: (CardDealer with: (OrderedCollection with: (CardProbability using: OverloadCard withChance: 100))).
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersBox
		equals: (OrderedCollection with: 6 with: 3)
]

{ #category : #tests }
BoxesTest >> testN004CheckMoonWalkBoxApplyTheCorrectEffectOnTheOtherPlayersThenValuePositions [

	| aLoadedDie aGame boxes aBoard aShaker |
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 8
			               with: 3
			               with: 5
			               with: 8).
	boxes := (BoxCreator
		          use: (OrderedCollection with:  (BoxProbability using: (MoonWalkBox with: -2) withChance: 100))) create:
		         10.
	aBoard := Board with: boxes measure: (Parsec worth: 100).
	aShaker := DiceShaker withDie: aLoadedDie.
	
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         usingToThrow: aShaker
		         winningWhen: 1
		         using: (CardDealer with: (OrderedCollection with: (CardProbability using: OverloadCard withChance: 100))).
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersBox
		equals: (OrderedCollection with: 7 with: 4)
]

{ #category : #tests }
BoxesTest >> testN005CheckAtomicBombBoxMoveAllPlayersToTheBeginning [

	| aLoadedDie aGame boxes aBoard aShaker |
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 8
			               with: 7
			               with: 5
			               with: 8).
	boxes := (BoxCreator use:
		          (OrderedCollection with:  (BoxProbability using: AtomicBombBox new withChance: 100))) 
		         create: 10.
	aBoard := Board with: boxes measure: (Parsec worth: 100).
	aShaker := DiceShaker withDie: aLoadedDie.
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         usingToThrow: aShaker
		         winningWhen: 1
		         using: (CardDealer with: (OrderedCollection with: (CardProbability using: OverloadCard withChance: 100))).
	self
		assert: aGame playersBox
		equals: (OrderedCollection with: 1 with: 1)
]

{ #category : #tests }
BoxesTest >> testN006CheckHyperJumpBoxMoveTheCorrectAmountOfParsecsWhenTheyAreEntireValuesThenValuePositions [

	| aLoadedDie aGame boxes aBoard aShaker |
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 3
			               with: 3
			               with: 5
			               with: 8).
	boxes := (BoxCreator use: (OrderedCollection with: (BoxProbability
				            using: (HyperJumpBox with:
						             (OrderedCollection
							              with: (Parsec worth: 40)
							              with: (Parsec worth: 30)))
				            withChance: 100))) create: 10.
	aBoard := Board with: boxes measure: (Parsec worth: 100).
	aShaker := DiceShaker withDie: aLoadedDie.
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         usingToThrow: aShaker
		         winningWhen: 1
		         using: (CardDealer with:(OrderedCollection with: (CardProbability using: OverloadCard withChance: 100))).
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersBox
		equals: (OrderedCollection with: 7 with: 8)
]

{ #category : #tests }
BoxesTest >> testN007CheckWormHoleBoxDoesNotAllowPlayerToBeAtANegativePosition [

	| aLoadedDie aGame boxes aBoard aShaker |
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 8
			               with: 5
			               with: 8).
	boxes := (BoxCreator use:
		          (OrderedCollection with: (BoxProbability using: WormHoleBox new withChance: 100))) 
		         create: 10.
	aBoard := Board with: boxes measure: (Parsec worth: 100).
	aShaker := DiceShaker withDie: aLoadedDie.
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         usingToThrow: aShaker
		         winningWhen: 1
		         using: (CardDealer with: (OrderedCollection with: (CardProbability using: OverloadCard withChance: 100))).
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersBox
		equals: (OrderedCollection with: 1 with: 5)
]

{ #category : #tests }
BoxesTest >> testN008CheckMoonWalkBoxDoesNotAllowPlayersToBeAtANegativePosition [

	| aLoadedDie aGame boxes aBoard aShaker |
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 4
			               with: 5
			               with: 8).
	boxes := (BoxCreator use: (OrderedCollection with:
			           (BoxProbability
				            using: (MoonWalkBox with: -4)
				            withChance: 100))) create: 10.
	aBoard := Board with: boxes measure: (Parsec worth: 100).
	aShaker := DiceShaker withDie: aLoadedDie.
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         usingToThrow: aShaker
		         winningWhen: 1
		         using: (CardDealer with: (OrderedCollection with: (CardProbability using: OverloadCard withChance: 100))).
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersBox
		equals: (OrderedCollection with: 1 with: 5)
]

{ #category : #tests }
BoxesTest >> testN009CheckHyperJumpBoxDoesNotAllowPlayersToBeAtANegativePosition [

	| aLoadedDie aGame boxes aBoard aShaker |
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 3
			               with: 3
			               with: 5
			               with: 8).
	boxes := (BoxCreator use: (OrderedCollection with: (BoxProbability
				            using: (HyperJumpBox with:
						             (OrderedCollection
							              with: (Parsec worth: -40)
							              with: (Parsec worth: -10)))
				            withChance: 100))) create: 10.
	aBoard := Board with: boxes measure: (Parsec worth: 100).
	aShaker := DiceShaker withDie: aLoadedDie.
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         usingToThrow: aShaker
		         winningWhen: 1
		         using: (CardDealer with: (OrderedCollection with: (CardProbability using: OverloadCard withChance: 100))).
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersBox
		equals: (OrderedCollection with: 1 with: 3)
]

{ #category : #tests }
BoxesTest >> testN010CheckTheEffectApplysAlsoWhenTheSpaceshipReachTheGoal [

	| aLoadedDie aGame boxes aBoard aShaker |
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 11
			               with: 3
			               with: 5
			               with: 8).
	boxes := (BoxCreator use:
		          (OrderedCollection with: (BoxProbability using: WormHoleBox new withChance: 100))) 
		         create: 10.
	aBoard := Board with: boxes measure: (Parsec worth: 100).
	aShaker := DiceShaker withDie: aLoadedDie.
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         usingToThrow: aShaker
		         winningWhen: 1
		         using: (CardDealer with: (OrderedCollection with: (CardProbability using: OverloadCard withChance: 100))).
	aGame movePlayer.
	self
		should: [ aGame winner ]
		raise: Error
		withMessage: 'There is no winner'
]

{ #category : #tests }
BoxesTest >> testN011CheckHyperJumpBoxMoveTheCorrectAmountOfParsecsWhenTheyAreNotEntireValuesThenValuePositions [

	| aLoadedDie aGame boxes aBoard aShaker |
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 3
			               with: 3
			               with: 5
			               with: 8).
	boxes := (BoxCreator use: (OrderedCollection with: (BoxProbability
				            using: (HyperJumpBox with: (OrderedCollection
							              with: (Parsec worth: 45.5)
							              with: (Parsec worth: 34.9)))
				            withChance: 100))) create: 10.
	aBoard := Board with: boxes measure: (Parsec worth: 100).
	aShaker := DiceShaker withDie: aLoadedDie.
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         usingToThrow: aShaker
		         winningWhen: 1
		         using: (CardDealer with: (OrderedCollection with: (CardProbability using: OverloadCard withChance: 100))).
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersBox
		equals: (OrderedCollection with: 7 with: 8)
]

{ #category : #tests }
BoxesTest >> testR001CheckRandomCardBoxGeneratesARandomCard [

	| aLoadedDie aGame boxes aBoard aShaker |
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 3
			               with: 5
			               with: 5
			               with: 8).
	boxes := (BoxCreator use:
		          (OrderedCollection with: (BoxProbability using: (RandomCardBox withCards: (OrderedCollection with: (CardProbability using: OverloadCard withChance: 100)))  withChance: 100))) 
		         create: 10.
	aBoard := Board with: boxes measure: (Parsec worth: 100).
	aShaker := DiceShaker withDie: aLoadedDie.
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         usingToThrow: aShaker
		         winningWhen: 1
		         using: (CardDealer with: (OrderedCollection with: (CardProbability using: OverloadCard withChance: 100))).
	aGame movePlayer.
	self
		assert: aGame playersCardInPosetion
		equals: (OrderedCollection with: 3 with: 2)
]

{ #category : #tests }
BoxesTest >> testR002CheckRandomCardBoxGeneratesARandomCardMoreThanOneTimeIfNecessary [

	| aLoadedDie aGame boxes aBoard aShaker |
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 3
			               with: 3
			               with: 3
			               with: 8).
	boxes := (BoxCreator use:
		          (OrderedCollection with: (BoxProbability using: (RandomCardBox withCards: (OrderedCollection with: (CardProbability using: OverloadCard withChance: 100))) withChance: 100))) 
		         create: 10.
	aBoard := Board with: boxes measure: (Parsec worth: 100).
	aShaker := DiceShaker withDie: aLoadedDie.
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         usingToThrow: aShaker
		         winningWhen: 1
		         using: (CardDealer with: (OrderedCollection with: (CardProbability using: OverloadCard withChance: 100))).
	aGame movePlayer.
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersCardInPosetion
		equals: (OrderedCollection with: 4 with: 3)
]

{ #category : #tests }
BoxesTest >> testR003TryToCreateARandomCardBoxGeneratorWithMoreThan100Probability [

	self
		should: [ 
			(RandomCardBox withCards: (OrderedCollection with: (CardProbability using: OverloadCard withChance: 10)))]
		raise: Error
		withMessage: 'The sum of probabilities must be 100'
]

{ #category : #tests }
BoxesTest >> testT001CheckHyperJumpBoxMoveTheCorrectAmountOfBoxesWhenTheValuesAreGivenInLightYears [

	| aLoadedDie aGame boxes aBoard aShaker |
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 3
			               with: 3
			               with: 5
			               with: 8).
	boxes := (BoxCreator use: (OrderedCollection with: (BoxProbability
				            using: (HyperJumpBox with: (OrderedCollection
							              with: (LigthYear worth: 120)
							              with: (LigthYear worth: 90)))
				            withChance: 100))) create: 10.
	aBoard := Board with: boxes measure: (Parsec worth: 100).
	aShaker := DiceShaker withDie: aLoadedDie.
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         usingToThrow: aShaker
		         winningWhen: 1
		         using: (CardDealer with: (OrderedCollection with: (CardProbability using: OverloadCard withChance: 100))).
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersBox
		equals: (OrderedCollection with: 7 with: 8)
]

{ #category : #tests }
BoxesTest >> testT002CheckHyperJumpBoxMoveTheCorrectAmountOfBoxesWhenTheValuesAreGivenInLightYearsAndParsecs [

	| aLoadedDie aGame boxes aBoard aShaker |
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 3
			               with: 3
			               with: 5
			               with: 8).
	boxes := (BoxCreator use: (OrderedCollection with: (BoxProbability
				            using: (HyperJumpBox with: (OrderedCollection
							              with: (LigthYear worth: 120)
							              with: (Parsec worth: 30)))
				            withChance: 100))) create: 10.
	aBoard := Board with: boxes measure: (Parsec worth: 100).
	aShaker := DiceShaker withDie: aLoadedDie.
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         usingToThrow: aShaker
		         winningWhen: 1
		         using: (CardDealer with: (OrderedCollection with: (CardProbability using: OverloadCard withChance: 100))).
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersBox
		equals: (OrderedCollection with: 7 with: 8)
]

{ #category : #tests }
BoxesTest >> testT003CheckHyperJumpBoxCannotBeCreatedIfDoesNotHaveValuesToUse [

	self
		should: [ 
			(BoxCreator use: (OrderedCollection with:
					  (BoxProbability using: (HyperJumpBox with: OrderedCollection new) withChance: 100))) 
				create: 10 ]
		raise: Error
		withMessage: 'There are no values to use in the hyper jump box'
]

{ #category : #tests }
BoxesTest >> testT004CheckHyperJumpBoxMoveTheCorrectAmountOfBoxesWhenTheValuesAreGivenInLightYearsAndParsecsAndAlsoTheyAreNegative [

	
	| aLoadedDie aGame boxes aBoard aShaker |
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 3
			               with: 3
			               with: 5
			               with: 8).
	boxes := (BoxCreator use: (OrderedCollection with: (BoxProbability
				            using: (HyperJumpBox with: (OrderedCollection
							              with: (LigthYear worth: -60)
							              with: (Parsec worth: -30)))
				            withChance: 100))) create: 10.
	aBoard := Board with: boxes measure: (Parsec worth: 100).
	aShaker := DiceShaker withDie: aLoadedDie.
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         usingToThrow: aShaker
		         winningWhen: 1
		         using: (CardDealer with: (OrderedCollection with: (CardProbability using: OverloadCard withChance: 100))).
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersBox
		equals: (OrderedCollection with: 1 with: 2)
]

{ #category : #tests }
BoxesTest >> testT005CheckPlayerMoveBackwardAsManyLapsAsRequest [

	| aLoadedDie aGame boxes aBoard aShaker |
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 3
			               with: 10
			               with: 5
			               with: 8).
	boxes := (BoxCreator use: (OrderedCollection with: (BoxProbability
				            using:
				            (HyperJumpBox with:
					             (OrderedCollection with: (Parsec worth: -120)))
				            withChance: 100))) create: 10.
	aBoard := Board with: boxes measure: (Parsec worth: 100).
	aShaker := DiceShaker withDie: aLoadedDie.
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         usingToThrow: aShaker
		         winningWhen: 2
		         using: (CardDealer with: (OrderedCollection with: (CardProbability using: OverloadCard withChance: 100))).
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersBox
		equals: (OrderedCollection with: 1 with: 1)
]
