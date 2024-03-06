Class {
	#name : #MovePlayersInTurnFromTheGameTest,
	#superclass : #TestCase,
	#instVars : [
		'aGame'
	],
	#category : #'IngSoft2-Tests'
}

{ #category : #running }
MovePlayersInTurnFromTheGameTest >> setUp [

	| aColorCollection aLoadedDie aCardsCollection aBoxesCollection aBoard |
	super setUp.

	aColorCollection := OrderedCollection with: 'red' with: 'blue'.
	aLoadedDie := LoadedDie with:
		              (OrderedCollection with: 1 with: 2 with: 3).
	aCardsCollection := (Creator use: (OrderedCollection with:
			                      (ObjectProbability
				                       using: OverloadCard initializeNew
				                       withChanceOf: 100))) create: 4.
	aBoxesCollection := (Creator use: (OrderedCollection with:
			                      (ObjectProbability
				                       using: NoEffectBox initializeNew
				                       withChanceOf: 100))) create: 10.
	aBoard := Board with: aBoxesCollection measure: (Parsec worth: 100).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         usingToThrow:
		         (DiceShaker with: (OrderedCollection with: aLoadedDie))
		         winningWhenReach: 1
		         using: aCardsCollection
]

{ #category : #tests }
MovePlayersInTurnFromTheGameTest >> testJ001CreateAGameWithTwoColorsPlayersThenCheckForThePlayerTurn [

	self assert: aGame currentPlayer equals: 'red'
]

{ #category : #tests }
MovePlayersInTurnFromTheGameTest >> testJ002CreateAGameWithTwoColorsPlayersThenMoveOnePlayerAndCheckThatThePlayerTurnHasChanged [

	aGame movePlayer.
	self assert: aGame currentPlayer equals: 'blue'
]

{ #category : #tests }
MovePlayersInTurnFromTheGameTest >> testJ003CreateAGameWithTwoColorsPlayersThenMoveBothPlayersAndCheckThatIsTurnOfTheFirstPlayer [

	aGame movePlayer.
	aGame movePlayer.
	self assert: aGame currentPlayer equals: 'red'
]
