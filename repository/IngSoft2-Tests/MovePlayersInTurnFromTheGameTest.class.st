Class {
	#name : #MovePlayersInTurnFromTheGameTest,
	#superclass : #TestCase,
	#instVars : [
		'aDuplaGalacticaGame'
	],
	#category : #'IngSoft2-Tests'
}

{ #category : #running }
MovePlayersInTurnFromTheGameTest >> setUp [

	| aColorsCollection aLoadedDie aCardsCollection aBoxesCollection aBoard |
	super setUp.

	aColorsCollection := OrderedCollection with: 'red' with: 'blue'.
	aLoadedDie := LoadedDie with:
		              (OrderedCollection with: 1 with: 2 with: 3).
	aCardsCollection := (ObjectCreator use: (OrderedCollection with:
			                      (ObjectProbability
				                       using: OverloadCard initializeNew
				                       withChanceOf: 100))) create: 4.
	aBoxesCollection := (ObjectCreator use: (OrderedCollection with:
			                      (ObjectProbability
				                       using: NoEffectBox initializeNew
				                       withChanceOf: 100))) create: 10.
	aBoard := Board with: aBoxesCollection measure: (ParsecMeasure worth: 100).
	aDuplaGalacticaGame := DuplaGalacticaGameProxy
		         with: aColorsCollection
		         and: aBoard
		         usingToThrow:
		         (DiceShaker with: (OrderedCollection with: aLoadedDie))
		         winningWhenReach: 1
		         using: aCardsCollection
]

{ #category : #tests }
MovePlayersInTurnFromTheGameTest >> testJ001CreateAGameWithTwoColorsPlayersThenValidPlayersTurn [

	self assert: aDuplaGalacticaGame currentPlayer equals: 'red'
]

{ #category : #tests }
MovePlayersInTurnFromTheGameTest >> testJ003CreateAGameWithTwoColorsPlayersThenMoveBothPlayersAndValidPlayersTurn [

	aDuplaGalacticaGame movePlayer.
	aDuplaGalacticaGame movePlayer.
	self assert: aDuplaGalacticaGame currentPlayer equals: 'red'
]
