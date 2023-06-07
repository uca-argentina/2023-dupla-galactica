Class {
	#name : #CreateDuplaGalacticaGameTest,
	#superclass : #TestCase,
	#instVars : [
		'aColorCollection',
		'aLoadedDie'
	],
	#category : #'IngSoft2-Tests'
}

{ #category : #Games }
CreateDuplaGalacticaGameTest >> createGameWithEffects [

	| aGame aBoard aBoxCreator boxes boxesProbabilities |
	boxesProbabilities:= (OrderedCollection
			                with: (BoxProbability using: NoEffectBox new withChance: 30)
			                with: (BoxProbability using: WormHoleBox  new withChance: 20)
			                with: (BoxProbability using: SpeedUpBox  new withChance: 20)
			                with: (BoxProbability using: (MoonWalkBox with: -2) withChance: 10)
			                with: (BoxProbability using: AtomicBombBox new withChance: 2)
			                with:
			                (BoxProbability using: (HyperJumpBox
				                 with: (OrderedCollection with: (Parsec worth: 40) with: (Parsec worth: 30))
				                 )withChance: 8)).
	boxesProbabilities addLast: (BoxProbability using: RandomCardBox new withChance: 10).
	aBoxCreator := BoxCreator use: boxesProbabilities.
	boxes := aBoxCreator create: 10.
	aBoard := Board with: boxes measure: (Parsec worth: 200).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         throwing: aLoadedDie
		         winningWhen: 1
		         using: CardDealer new.
	^ aGame
]

{ #category : #running }
CreateDuplaGalacticaGameTest >> setUp [

	super setUp.
	aColorCollection := OrderedCollection with: 'red' with: 'blue'.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 9
			               with: 10
			               with: 7
			               with: 9)
]

{ #category : #tests }
CreateDuplaGalacticaGameTest >> should: anErrorBlock raise: anExceptionClass withMessage: anErrorMessage [

	self
		should: anErrorBlock
		raise: anExceptionClass
		withExceptionDo: [ :error | 
		self assert: error messageText equals: anErrorMessage ]
]

{ #category : #tests }
CreateDuplaGalacticaGameTest >> testP001VerifyTheCorrectCreationOfTheBoardWithEffectsLength [

	| aGame |
	aGame := self createGameWithEffects.

	self assert: aGame boxes size identicalTo: 10
]

{ #category : #tests }
CreateDuplaGalacticaGameTest >> testP003VerifyTheCorrectUseOfTurns [

	| aGame |
	aGame := self createGameWithEffects.
	aGame movePlayer.
	self assert: aGame currentPlayer equals: 'blue'
]

{ #category : #tests }
CreateDuplaGalacticaGameTest >> testP004VerifyTheCorrectCreationOfGoalLaps [

	| aGame |
	aGame := self createGameWithEffects.
	self assert: aGame goalLaps identicalTo: 1
]

{ #category : #tests }
CreateDuplaGalacticaGameTest >> testP007VerifyTheParsecsWhenBoardCreated [

	| aGame |
	aGame := self createGameWithEffects.
	self assert: aGame parsecs nominalValue equals: 200
]

{ #category : #tests }
CreateDuplaGalacticaGameTest >> testP013VerifyTheCorrectUseOfRankingInRandomGame [

	| aGame |
	aGame := self createGameWithEffects.
	self assert: aGame ranking size identicalTo: 2
]

{ #category : #tests }
CreateDuplaGalacticaGameTest >> testP014VerifyTheCorrectUseOfLaps [

	| aGame |
	aGame := self createGameWithEffects.
	self assert: aGame playersLaps size identicalTo: 2
]

{ #category : #tests }
CreateDuplaGalacticaGameTest >> testP015VerifyTheCorrectUseOfPositions [

	| aGame |
	aGame := self createGameWithEffects.
	self assert: aGame playersPositions size identicalTo: 2
]

{ #category : #tests }
CreateDuplaGalacticaGameTest >> testP016VerifyTheCorrectUseOfWinner [

	| aGame |
	aGame := self createGameWithEffects.
	self
		should: [ aGame winner ]
		raise: Error
		withMessage: 'There is no winner'
]

{ #category : #tests }
CreateDuplaGalacticaGameTest >> testP017VerifyTheCorrectCreationOfGameWhenNoColorHasBeenPass [

	self
		should: [ 
			DuplaGalacticaGameProxy
				with: OrderedCollection new
				and: (Board with: (OrderedCollection with: (NoEffectBox new) with: (NoEffectBox new) with: (NoEffectBox new) with: (NoEffectBox new)) measure: (Parsec worth: 200))
				throwing: (OrderedCollection with: aLoadedDie)
				winningWhen: 1
				using: CardDealer new]
		raise: Error
		withMessage: 'Cannot create a game with no players'
]

{ #category : #tests }
CreateDuplaGalacticaGameTest >> testP018VerifyTheCorrectCreationOfGameWhenTheGoalLapsAreInvalid [

	self
		should: [ 
			DuplaGalacticaGame
				with: aColorCollection
				and: (Board
						 with: (OrderedCollection
								  with: NoEffectBox new
								  with: NoEffectBox new
								  with: NoEffectBox new
								  with: NoEffectBox new)
						 measure: (Parsec worth: 200))
				throwing: (OrderedCollection with: aLoadedDie)
				winningWhen: -1
				using: CardDealer new ]
		raise: Error
		withMessage: 'Cannot create a game with that goal laps'
]

{ #category : #tests }
CreateDuplaGalacticaGameTest >> testP019VerifyTheCorrectCreationOfGameWhenTheParsecsAmountAreInvalid [

	self
		should: [ 
			DuplaGalacticaGameProxy
				with: aColorCollection
				and: (Board with: (OrderedCollection new) measure: (Parsec worth: 0))
				throwing: (OrderedCollection with: aLoadedDie)
				winningWhen: 1
				using: CardDealer new ]
		raise: Error
		withMessage: 'Cannot create a game a negative parsec amount'
]
