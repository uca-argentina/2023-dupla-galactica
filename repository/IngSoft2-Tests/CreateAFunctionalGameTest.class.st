Class {
	#name : #CreateAFunctionalGameTest,
	#superclass : #TestCase,
	#instVars : [
		'aColorCollection'
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
	aCardsCollection := (Creator use: (OrderedCollection with:
			                      (ObjectProbability
				                       using: OverloadCard initializeNew
				                       withChanceOf: 100))) create: 4.
	aBoxesCollection := (Creator use: (OrderedCollection with:
			                      (ObjectProbability
				                       using: NoEffectBox initializeNew
				                       withChanceOf: 100))) create: 10.
	aBoard := Board with: aBoxesCollection measure: (Parsec worth: 100).
	^ DuplaGalacticaGameProxy
		  with: aColorCollection
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
	aCardsCollection := (Creator use: (OrderedCollection with:
			                      (ObjectProbability
				                       using: OverloadCard initializeNew
				                       withChanceOf: 100))) create: 4.
	aBoxesCollection := (Creator use: (OrderedCollection with:
			                      (ObjectProbability
				                       using: NoEffectBox initializeNew
				                       withChanceOf: 100))) create: 10.
	aBoard := Board with: aBoxesCollection measure: (Parsec worth: 100).
	^ DuplaGalacticaGameProxy
		  with: aColorCollection
		  and: aBoard
		  usingToThrow: (DiceShaker with:
				   (OrderedCollection with: aLoadedDie with: aSecondLoadedDie))
		  winningWhenReach: 1
		  using: aCardsCollection
]

{ #category : #running }
CreateAFunctionalGameTest >> setUp [

	super setUp.


	aColorCollection := OrderedCollection with: 'red' with: 'blue'
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

	| aLoadedGame |
	aLoadedGame := self gameWithLoadedDie.
	self
		assert: aLoadedGame currentPlayer 
		equals: 'red' 
]

{ #category : #tests }
CreateAFunctionalGameTest >> testD002CreateAGameWithALoadedDieThenMovePlayersAndAskForWinner [

	| aLoadedGame |
	aLoadedGame := self gameWithLoadedDie.
	aLoadedGame movePlayer.
	aLoadedGame movePlayer.
	aLoadedGame movePlayer.
	self assert: aLoadedGame winner equals: 'red'
]

{ #category : #tests }
CreateAFunctionalGameTest >> testF001CreateAGameWithALoadedDieThenMovePlayersAndCheckPlayersPositions [

	| aGame |
	aGame := self gameWithLoadedDie.
	aGame movePlayer.
	self
		assert: aGame playersBox
		equals: (OrderedCollection with: 10 with: 1)
]

{ #category : #tests }
CreateAFunctionalGameTest >> testG002CreateAGameWithTwoLoadedDiceThenMovePlayersAndCheckPlayersPositions [

	| aGame |
	aGame := self gameWithTwoLoadedDie.
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersBox
		equals: (OrderedCollection with: 3 with: 5)
]

{ #category : #tests }
CreateAFunctionalGameTest >> testH001WhenTheGameTriesToMovePlayersAfterSomeoneWinsThenTheMovementHasNoEffectAndCheckPlayersPositions [

	| aGame |
	aGame := self gameWithTwoLoadedDie.
	aGame movePlayer.
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame playersBox
		equals: (OrderedCollection with: 9 with: 5)
]

{ #category : #tests }
CreateAFunctionalGameTest >> testL002TryToAskForWinnerWhenNoOneWinsThenFails [

	| aGame |
	aGame := self gameWithLoadedDie.
	aGame movePlayer.
	self
		should: [ aGame winner ]
		raise: Error
		withMessage: 'There is no winner'
]

{ #category : #tests }
CreateAFunctionalGameTest >> testL003WhenTheGameAskForRankingThenCheckPlayersPositionsAndValid [

	| aGame |
	aGame := self gameWithTwoLoadedDie.
	aGame movePlayer.
	aGame movePlayer.
	aGame movePlayer.
	aGame movePlayer.
	self
		assert: aGame ranking
		equals: (OrderedCollection with: 'blue' with: 'red')
]
