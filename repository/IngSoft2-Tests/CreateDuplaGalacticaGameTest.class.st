Class {
	#name : #CreateDuplaGalacticaGameTest,
	#superclass : #TestCase,
	#instVars : [
		'aLoadedDie',
		'aColorsCollection'
	],
	#category : #'IngSoft2-Tests'
}

{ #category : #Games }
CreateDuplaGalacticaGameTest >> createGameWithEffects [

	| aBoard aBoxCreator aBoxesCollection boxesProbabilities aCardsCollection |
	aCardsCollection := (ObjectCreator use: (OrderedCollection with:
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
				                       using:
					                       (HyperJumpBox with: (OrderedCollection
							                         with: (ParsecMeasure worth: 40)
							                         with: (ParsecMeasure worth: 30)))
				                       withChanceOf: 8).
	boxesProbabilities addLast: (ObjectProbability
			 using:
				 (RandomCardBox with: (OrderedCollection with: (ObjectProbability
							    using: CancellationCard initializeNew
							    withChanceOf: 100)))
			 withChanceOf: 10).
	aBoxCreator := ObjectCreator use: boxesProbabilities.
	aBoxesCollection := aBoxCreator create: 10.
	aBoard := Board
		          with: aBoxesCollection
		          measure: (ParsecMeasure worth: 200).
	^ DuplaGalacticaGameProxy
		  with: aColorsCollection
		  and: aBoard
		  usingToThrow:
		  (DiceShaker with: (OrderedCollection with: aLoadedDie))
		  winningWhenReach: 1
		  using: aCardsCollection
]

{ #category : #running }
CreateDuplaGalacticaGameTest >> setUp [

	super setUp.

	aColorsCollection := OrderedCollection with: 'red' with: 'blue'.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 2
			               with: 3
			               with: 4)
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
CreateDuplaGalacticaGameTest >> testP001CreateAGameWithABoardWhoseBoxesHaveRandomEffectsThenValidBoardBoxesSize [

	| aDuplaGalacticaGame |
	aDuplaGalacticaGame := self createGameWithEffects.
	self assert: aDuplaGalacticaGame boardLength identicalTo: 10
]

{ #category : #tests }
CreateDuplaGalacticaGameTest >> testP003CreateAGameThenMovePlayersAndValidPlayersTurn [

	| aDuplaGalacticaGame |
	aDuplaGalacticaGame := self createGameWithEffects.
	aDuplaGalacticaGame movePlayer.
	self assert: aDuplaGalacticaGame currentPlayer equals: 'blue'
]

{ #category : #tests }
CreateDuplaGalacticaGameTest >> testP004CreateAGameThenValidGoalLaps [

	| aDuplaGalacticaGame |
	aDuplaGalacticaGame := self createGameWithEffects.
	self assert: aDuplaGalacticaGame goalLaps identicalTo: 1
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
						 measure: (ParsecMeasure worth: 200))
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
				with: aColorsCollection
				and: (Board
						 with: (OrderedCollection
								  with: NoEffectBox initializeNew
								  with: NoEffectBox initializeNew
								  with: NoEffectBox initializeNew
								  with: NoEffectBox initializeNew)
						 measure: (ParsecMeasure worth: 200))
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
				with: aColorsCollection
				and:
				(Board
					 with: OrderedCollection new
					 measure: (ParsecMeasure worth: 0))
				usingToThrow: (DiceShaker with: aLoadedDie)
				winningWhenReach: 1
				using: (OrderedCollection with: OverloadCard initializeNew) ]
		raise: Error
		withMessage:
		'Cannot create a game with that parsec or lightYear value'
]

{ #category : #tests }
CreateDuplaGalacticaGameTest >> testP020TryToCreateAGameWithDuplicatedColorsThenFails [

	| aDuplicatedColorsCollection aBoxesCollection aBoard |
	aDuplicatedColorsCollection := OrderedCollection
		                               with: 'red'
		                               with: 'red'.
	aBoxesCollection := (ObjectCreator use: (OrderedCollection with:
			                      (ObjectProbability
				                       using: NoEffectBox initializeNew
				                       withChanceOf: 100))) create: 10.
	aBoard := Board
		          with: aBoxesCollection
		          measure: (ParsecMeasure worth: 100).
	self
		should: [ 
			DuplaGalacticaGameProxy
				with: aDuplicatedColorsCollection
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
		should: [ aBoxCreator := ObjectCreator use: boxesProbabilities ]
		raise: Error
		withMessage: 'The sum of probabilities must be 100'
]

{ #category : #tests }
CreateDuplaGalacticaGameTest >> testP022TryToCreateAGameWithMoreThan100PercentProbabilityOfCardAppearancesThenFails [

	| boxesProbabilities aBoxCreator aBoxesCollection aBoard aDuplaGalacticaGame |
	boxesProbabilities := OrderedCollection with:
		                      (ObjectProbability
			                       using: NoEffectBox initializeNew
			                       withChanceOf: 100).
	aBoxCreator := ObjectCreator use: boxesProbabilities.
	aBoxesCollection := aBoxCreator create: 10.
	aBoard := Board
		          with: aBoxesCollection
		          measure: (ParsecMeasure worth: 200).
	self
		should: [ 
			aDuplaGalacticaGame := DuplaGalacticaGameProxy
				                       with: aColorsCollection
				                       and: aBoard
				                       usingToThrow:
				                       (DiceShaker with:
					                        (OrderedCollection with: aLoadedDie))
				                       winningWhenReach: 1
				                       using:
					                       (ObjectCreator use:
						                        (OrderedCollection with:
							                         (ObjectProbability
								                          using: OverloadCard initializeNew
								                          withChanceOf: 130))) ]
		raise: Error
		withMessage: 'The sum of probabilities must be 100'
]
