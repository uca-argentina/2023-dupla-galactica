Class {
	#name : #CreateDuplaGalacticaGameTest,
	#superclass : #TestCase,
	#instVars : [
		'boxes',
		'aColorCollection',
		'aLoadedDie'
	],
	#category : #'IngSoft2-Tests'
}

{ #category : #Games }
CreateDuplaGalacticaGameTest >> createGameWithEffects [
	|aGame|
	aGame := DuplaGalacticaGame 
		         with: aColorCollection
		         and: 10
		         throwing: (OrderedCollection with: aLoadedDie)
		         winningWhen: 1.
	^aGame.
]

{ #category : #running }
CreateDuplaGalacticaGameTest >> setUp [
	super setUp.
	aColorCollection := OrderedCollection with: 'red' with: 'blue'.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 9
			               with: 10
			               with: 7
			               with: 9).
]

{ #category : #tests }
CreateDuplaGalacticaGameTest >> should: anErrorBlock raise: anExceptionClass withMessage: anErrorMessage [ 
	self
		should: anErrorBlock
		raise: anExceptionClass 
		withExceptionDo: [ :error|
			self assert: error messageText equals: anErrorMessage ].
]

{ #category : #tests }
CreateDuplaGalacticaGameTest >> testP001VerifyTheCorrectCreationOfTheBoardWithEffectsLength [
	|aGame|	
	
	aGame := self createGameWithEffects.

	self assert: (aGame  boxes) size identicalTo:  10.
]

{ #category : #tests }
CreateDuplaGalacticaGameTest >> testP003VerifyTheCorrectUseOfTurns [
	|aGame|	
	
	aGame := self createGameWithEffects.
	aGame moveNextPlayer.
	self assert: (aGame nextPlayer) asSymbol identicalTo: 'blue' asSymbol.
]

{ #category : #tests }
CreateDuplaGalacticaGameTest >> testP004VerifyTheCorrectCreationOfGoalLaps [
	|aGame|	
	
	aGame := self createGameWithEffects.
	self assert: (aGame goalLaps) identicalTo: 1.
]

{ #category : #tests }
CreateDuplaGalacticaGameTest >> testP007VerifyTheParsecsWhenBoardCreated [
	|aGame|	
	
	aGame := self createGameWithEffects.
	self assert: (aGame parsecs) equals: 100.
]

{ #category : #tests }
CreateDuplaGalacticaGameTest >> testP011CreateHyperJumpRandomly [
	|aGame anHyperJumpBox|	
	aGame := self createGameWithEffects.
	anHyperJumpBox:= (aGame createRandomHyperJump: 10 with: 100). 
	self assert: (anHyperJumpBox parsecs size) <= 10.
]

{ #category : #tests }
CreateDuplaGalacticaGameTest >> testP012CreateMoonWalkRandomly [
	|aGame aMoonWalkBox|	
	aGame := self createGameWithEffects.
	aMoonWalkBox:= (aGame createMoonWalkRandom: 10). 
	self assert: ((aMoonWalkBox effectValue) abs) <=10.
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
	self assert: aGame laps size identicalTo: 2
]

{ #category : #tests }
CreateDuplaGalacticaGameTest >> testP015VerifyTheCorrectUseOfPositions [

	| aGame |
	aGame := self createGameWithEffects.
	self assert: aGame positions size identicalTo: 2
]

{ #category : #tests }
CreateDuplaGalacticaGameTest >> testP016VerifyTheCorrectUseOfWinner [

	| aGame |
	aGame := self createGameWithEffects.
	self should: [ aGame winner ] raise: Error withMessage: 'There is no winner'.
]
