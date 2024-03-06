Class {
	#name : #CreateDuplaGalacticaGameTest,
	#superclass : #TestCase,
	#instVars : [
		'aColorCollection',
		'aLoadedDie',
		'aShaker'
	],
	#category : #'IngSoft2-Tests'
}

{ #category : #Games }
CreateDuplaGalacticaGameTest >> createGameWithEffects [

	| aBoard aBoxCreator aBoxesCollection boxesProbabilities aCardsCollection |
	aCardsCollection := (Creator use: (OrderedCollection with:
			                      (ObjectProbability
				                       using: OverloadCard initializeNew
				                       withChanceOf: 100))) create: 4.
	boxesProbabilities := OrderedCollection
		                      with:
		                      (ObjectProbability
			                       using: NoEffectBox initializeNew
			                       withChanceOf: 30)
		                      with:
		                      (ObjectProbability
			                       using: WormHoleBox initializeNew
			                       withChanceOf: 20)
		                      with:
		                      (ObjectProbability
			                       using: SpeedUpBox initializeNew
			                       withChanceOf: 20)
		                      with:
		                      (ObjectProbability
			                       using: (MoonWalkBox with: -2)
			                       withChanceOf: 10)
		                      with:
		                      (ObjectProbability
			                       using: AtomicBombBox initializeNew
			                       withChanceOf: 2)
		                      with: (ObjectProbability
				                       using: (HyperJumpBox with:
						                        (OrderedCollection
							                         with: (Parsec worth: 40)
							                         with: (Parsec worth: 30)))
				                       withChanceOf: 8).
	boxesProbabilities addLast: (ObjectProbability
			 using:
				 (RandomCardBox with: (OrderedCollection with: (ObjectProbability
							    using: CancellationCard initializeNew
							    withChanceOf: 100)))
			 withChanceOf: 10).
	aBoxCreator := Creator use: boxesProbabilities.
	aBoxesCollection := aBoxCreator create: 10.
	aBoard := Board with: aBoxesCollection measure: (Parsec worth: 200).
	^ DuplaGalacticaGameProxy
		  with: aColorCollection
		  and: aBoard
		  usingToThrow: aShaker
		  winningWhenReach: 1
		  using: aCardsCollection
]

{ #category : #running }
CreateDuplaGalacticaGameTest >> setUp [

	super setUp.

	aColorCollection := OrderedCollection with: 'red' with: 'blue'.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 2
			               with: 3
			               with: 4).
	aShaker := DiceShaker with: (OrderedCollection with: aLoadedDie)
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
CreateDuplaGalacticaGameTest >> testP001CreateAGameWithABoardWhoseBoxesHaveRandomEffectsThenAskForTheBoardBoxesSize [

	| aGame |
	aGame := self createGameWithEffects.

	self assert: aGame boxes identicalTo: 10
]

{ #category : #tests }
CreateDuplaGalacticaGameTest >> testP003CreateAGameThenMovePlayersAndAskForCurrentPlayerToCheckTurns [

	| aGame |
	aGame := self createGameWithEffects.
	aGame movePlayer.
	self assert: aGame currentPlayer equals: 'blue'
]

{ #category : #tests }
CreateDuplaGalacticaGameTest >> testP004CreateAGameThenAskForGoalLaps [

	| aGame |
	aGame := self createGameWithEffects.
	self assert: aGame goalLaps identicalTo: 1
]

{ #category : #tests }
CreateDuplaGalacticaGameTest >> testP017TryToCreateAGameWithoutAColorsCollectionThenFails [

	self
		should: [ 
			DuplaGalacticaGameProxy
				with: OrderedCollection new
				and: (Board
						 with: (OrderedCollection
								  with: NoEffectBox initializeNew
								  with: NoEffectBox initializeNew
								  with: NoEffectBox initializeNew
								  with: NoEffectBox initializeNew)
						 measure: (Parsec worth: 200))
				usingToThrow: (OrderedCollection with: aLoadedDie)
				winningWhenReach: 1
				using: (OrderedCollection with: OverloadCard initializeNew) ]
		raise: Error
		withMessage: 'Cannot create a game with no players'
]

{ #category : #tests }
CreateDuplaGalacticaGameTest >> testP018TryToCreateAGameWithAnInvalidAmountOfGoalLapsThenFails [

	self
		should: [ 
			DuplaGalacticaGame
				with: aColorCollection
				and: (Board
						 with: (OrderedCollection
								  with: NoEffectBox initializeNew
								  with: NoEffectBox initializeNew
								  with: NoEffectBox initializeNew
								  with: NoEffectBox initializeNew)
						 measure: (Parsec worth: 200))
				usingToThrow: (DiceShaker with: aLoadedDie)
				winningWhenReach: -1
				using: (OrderedCollection with: OverloadCard initializeNew) ]
		raise: Error
		withMessage: 'Cannot create a game with that goal laps'
]

{ #category : #tests }
CreateDuplaGalacticaGameTest >> testP019TryToCreateAgameWithAnInvalidParsecAmountMeasureThenFails [

	self
		should: [ 
			DuplaGalacticaGameProxy
				with: aColorCollection
				and:
				(Board with: OrderedCollection new measure: (Parsec worth: 0))
				usingToThrow: (DiceShaker with: aLoadedDie)
				winningWhenReach: 1
				using: (OrderedCollection with: OverloadCard initializeNew) ]
		raise: Error
		withMessage:
		'Cannot create a game with that parsec or lightYear value'
]

{ #category : #tests }
CreateDuplaGalacticaGameTest >> testP020TryToCreateAGameWithDuplicateColorsThenFails [

	| aDuplicateColorCollection boxes aBoard |
	aDuplicateColorCollection := OrderedCollection
		                             with: 'red'
		                             with: 'red'.
	boxes := (Creator use: (OrderedCollection with:
			           (ObjectProbability
				            using: NoEffectBox initializeNew
				            withChanceOf: 100))) create: 10.
	aBoard := Board with: boxes measure: (Parsec worth: 100).
	self
		should: [ 
			DuplaGalacticaGameProxy
				with: aDuplicateColorCollection
				and: aBoard
				usingToThrow: (DiceShaker with: aLoadedDie)
				winningWhenReach: 1
				using: (OrderedCollection with: OverloadCard initializeNew) ]
		raise: Error
		withMessage: 'Cannot create a game with duplicate colors'
]

{ #category : #tests }
CreateDuplaGalacticaGameTest >> testP021TryToCreateAGameWithMoreThan100PercentProbabilityOfBoxAppearancesThenFails [

	| boxesProbabilities aBoxCreator |
	boxesProbabilities := OrderedCollection with:
		                      (ObjectProbability
			                       using: NoEffectBox initializeNew
			                       withChanceOf: 130).
	self
		should: [ aBoxCreator := Creator use: boxesProbabilities ]
		raise: Error
		withMessage: 'The sum of probabilities must be 100'
]

{ #category : #tests }
CreateDuplaGalacticaGameTest >> testP022TryToCreateAGameWithMoreThan100PercentProbabilityOfCardAppearancesThenFails [

	| boxesProbabilities aBoxCreator boxes aBoard aGame |
	boxesProbabilities := OrderedCollection with:
		                      (ObjectProbability
			                       using: NoEffectBox initializeNew
			                       withChanceOf: 100).
	aBoxCreator := Creator use: boxesProbabilities.
	boxes := aBoxCreator create: 10.
	aBoard := Board with: boxes measure: (Parsec worth: 200).
	self
		should: [ 
			aGame := DuplaGalacticaGameProxy
				         with: aColorCollection
				         and: aBoard
				         usingToThrow: aShaker
				         winningWhenReach: 1
				         using: (Creator use: (OrderedCollection with:
							           (ObjectProbability
								            using: OverloadCard initializeNew
								            withChanceOf: 130))) ]
		raise: Error
		withMessage: 'The sum of probabilities must be 100'
]
