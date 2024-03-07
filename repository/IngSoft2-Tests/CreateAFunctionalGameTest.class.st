Class {
	#name : #CreateAFunctionalGameTest,
	#superclass : #TestCase,
	#instVars : [
		'aColorsCollection'
	],
	#category : #'IngSoft2-Tests'
}

{ #category : #Games }
CreateAFunctionalGameTest >> gameWithLoadedDie [

	| aLoadedDie aBoard aBoxesCollection aCardsCollection |
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 9
			               with: 6
			               with: 7
			               with: 9).
	aCardsCollection := (ObjectCreator use: (OrderedCollection with:
			                      (ObjectProbability
				                       using: OverloadCard initializeNew
				                       withChanceOf: 100))) create: 4.
	aBoxesCollection := (ObjectCreator use: (OrderedCollection with:
			                      (ObjectProbability
				                       using: NoEffectBox initializeNew
				                       withChanceOf: 100))) create: 10.
	aBoard := Board
		          with: aBoxesCollection
		          measure: (ParsecMeasure worth: 100).
	^ DuplaGalacticaGameProxy
		  with: aColorsCollection
		  and: aBoard
		  usingToThrow:
		  (DiceShaker with: (OrderedCollection with: aLoadedDie))
		  winningWhenReach: 1
		  using: aCardsCollection
]

{ #category : #Games }
CreateAFunctionalGameTest >> gameWithTwoLoadedDie [

	| aLoadedDie aSecondLoadedDie aBoard aBoxesCollection aCardsCollection |
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 2
			               with: 3
			               with: 4).
	aSecondLoadedDie := LoadedDie with: (OrderedCollection
			                     with: 1
			                     with: 2
			                     with: 3
			                     with: 4).
	aCardsCollection := (ObjectCreator use: (OrderedCollection with:
			                      (ObjectProbability
				                       using: OverloadCard initializeNew
				                       withChanceOf: 100))) create: 4.
	aBoxesCollection := (ObjectCreator use: (OrderedCollection with:
			                      (ObjectProbability
				                       using: NoEffectBox initializeNew
				                       withChanceOf: 100))) create: 10.
	aBoard := Board
		          with: aBoxesCollection
		          measure: (ParsecMeasure worth: 100).
	^ DuplaGalacticaGameProxy
		  with: aColorsCollection
		  and: aBoard
		  usingToThrow: (DiceShaker with:
				   (OrderedCollection with: aLoadedDie with: aSecondLoadedDie))
		  winningWhenReach: 1
		  using: aCardsCollection
]

{ #category : #running }
CreateAFunctionalGameTest >> setUp [

	super setUp.


	aColorsCollection := OrderedCollection with: 'red' with: 'blue'
]

{ #category : #tests }
CreateAFunctionalGameTest >> should: anErrorBlock raise: anExceptionClass withMessage: anErrorMessage [

	self
		should: anErrorBlock
		raise: anExceptionClass
		withExceptionDo: [ :error | 
		self assert: error messageText equals: anErrorMessage ]
]

{ #category : #tests }
CreateAFunctionalGameTest >> testD001CreateAGameWithALoadedDieThenAskForCurrentPlayer [

	| aDuplaGalacticaGame |
	aDuplaGalacticaGame := self gameWithLoadedDie.
	self assert: aDuplaGalacticaGame currentPlayer equals: 'red'
]

{ #category : #tests }
CreateAFunctionalGameTest >> testD002CreateAGameWithALoadedDieThenMovePlayersAndAskForWinner [

	| aDuplaGalacticaGame |
	aDuplaGalacticaGame := self gameWithLoadedDie.
	aDuplaGalacticaGame movePlayer.
	aDuplaGalacticaGame movePlayer.
	aDuplaGalacticaGame movePlayer.
	self assert: aDuplaGalacticaGame winner equals: 'red'
]

{ #category : #tests }
CreateAFunctionalGameTest >> testF001CreateAGameWithALoadedDieThenMovePlayersAndCheckPlayersPositions [

	| aDuplaGalacticaGame |
	aDuplaGalacticaGame := self gameWithLoadedDie.
	aDuplaGalacticaGame movePlayer.
	self
		assert: aDuplaGalacticaGame playersBox
		equals: (OrderedCollection with: 10 with: 1)
]

{ #category : #tests }
CreateAFunctionalGameTest >> testG002CreateAGameWithTwoLoadedDiceThenMovePlayersAndCheckPlayersPositions [

	| aDuplaGalacticaGame |
	aDuplaGalacticaGame := self gameWithTwoLoadedDie.
	aDuplaGalacticaGame movePlayer.
	aDuplaGalacticaGame movePlayer.
	self
		assert: aDuplaGalacticaGame playersBox
		equals: (OrderedCollection with: 3 with: 5)
]

{ #category : #tests }
CreateAFunctionalGameTest >> testH001WhenTheGameTriesToMovePlayersAfterSomeoneWinsThenTheMovementHasNoEffectAndCheckPlayersPositions [

	| aDuplaGalacticaGame |
	aDuplaGalacticaGame := self gameWithTwoLoadedDie.
	aDuplaGalacticaGame movePlayer.
	aDuplaGalacticaGame movePlayer.
	aDuplaGalacticaGame movePlayer.
	self
		assert: aDuplaGalacticaGame playersBox
		equals: (OrderedCollection with: 9 with: 5)
]

{ #category : #tests }
CreateAFunctionalGameTest >> testL002TryToAskForWinnerWhenNoOneWinsThenFails [

	| aDuplaGalacticaGame |
	aDuplaGalacticaGame := self gameWithLoadedDie.
	aDuplaGalacticaGame movePlayer.
	self
		should: [ aDuplaGalacticaGame winner ]
		raise: Error
		withMessage: 'There is no winner'
]

{ #category : #tests }
CreateAFunctionalGameTest >> testL003WhenTheGameAskForRankingThenCheckPlayersPositionsAndValid [

	| aDuplaGalacticaGame |
	aDuplaGalacticaGame := self gameWithTwoLoadedDie.
	aDuplaGalacticaGame movePlayer.
	aDuplaGalacticaGame movePlayer.
	aDuplaGalacticaGame movePlayer.
	aDuplaGalacticaGame movePlayer.
	self
		assert: aDuplaGalacticaGame ranking
		equals: (OrderedCollection with: 'blue' with: 'red')
]
