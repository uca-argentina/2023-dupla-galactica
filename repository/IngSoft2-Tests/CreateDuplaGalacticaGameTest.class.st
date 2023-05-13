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
		         winningWhen: 1
					effects: 1.
	^aGame.
]

{ #category : #Games }
CreateDuplaGalacticaGameTest >> createGameWithNoEffects [
	|aGame|
	aGame := DuplaGalacticaGame 
		         with: aColorCollection
		         and: 10
		         throwing: (OrderedCollection with: aLoadedDie)
		         winningWhen: 1
					effects: 0.
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
CreateDuplaGalacticaGameTest >> testP001VerifyTheCorrectCreationOfTheBoardWithEffectsLength [
	|aGame|	
	
	aGame := self createGameWithEffects.

	self assert: (aGame  boxes) size identicalTo:  10.
]

{ #category : #tests }
CreateDuplaGalacticaGameTest >> testP002VerifyTheCorrectCreationOfTheBoardWithNoEffectsLength [
	|aGame|	
	
	aGame := self createGameWithNoEffects.

	self assert: (aGame boxes) size identicalTo:  10.
]

{ #category : #tests }
CreateDuplaGalacticaGameTest >> testP003VerifyTheCorrectUseOfTurns [
	|aGame|	
	
	aGame := self createGameWithNoEffects.
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
CreateDuplaGalacticaGameTest >> testP005VerifyTheLapsOfPlayers [
	|aGame|	
	
	aGame := self createGameWithNoEffects.
	aGame moveNextPlayer.
	aGame moveNextPlayer.
	aGame moveNextPlayer.
	self assert: (aGame laps) equals: (OrderedCollection with: 0 with: 1).
]

{ #category : #tests }
CreateDuplaGalacticaGameTest >> testP006VerifyThePositionsOfThePlayersAfterMovingThem [
	|aGame|	
	
	aGame := self createGameWithNoEffects.
	aGame moveNextPlayer.
	aGame moveNextPlayer.
	self assert: (aGame positions) equals: (OrderedCollection with: 10 with: 1).
]

{ #category : #tests }
CreateDuplaGalacticaGameTest >> testP007VerifyTheParsecsWhenBoardCreated [
	|aGame|	
	
	aGame := self createGameWithEffects.
	self assert: (aGame parsecs) equals: 100.
]

{ #category : #tests }
CreateDuplaGalacticaGameTest >> testP008MovePlayerInARandomGameAndVerifyTheWinner [
	|aGame|	
	aGame := self createGameWithNoEffects.
	aGame moveNextPlayer.
	aGame moveNextPlayer.
	self assert: (aGame winner asSymbol) equals: 'blue' asSymbol.
]

{ #category : #tests }
CreateDuplaGalacticaGameTest >> testP009MovePlayersAndAskForRanking [
	|aGame|	
	aGame := self createGameWithNoEffects.
	aGame moveNextPlayer.
	aGame moveNextPlayer.
	self assert: (aGame ranking ) equals: (OrderedCollection with: 'blue' with: 'red').
]

{ #category : #tests }
CreateDuplaGalacticaGameTest >> testP011CreateHyperJumpRandomly [
	|aGame anHyperJumpBox|	
	aGame := self createGameWithNoEffects.
	aGame moveNextPlayer.
	aGame moveNextPlayer.
	anHyperJumpBox:= (aGame createRandomHyperJump: 10 with: 100). 
	self assert: (anHyperJumpBox parsecs size) <= 10.
]

{ #category : #tests }
CreateDuplaGalacticaGameTest >> testP012CreateMoonWalkRandomly [
	|aGame aMoonWalkBox|	
	aGame := self createGameWithNoEffects.
	aGame moveNextPlayer.
	aGame moveNextPlayer.
	aMoonWalkBox:= (aGame createMoonWalkRandom: 10). 
	self assert: ((aMoonWalkBox effectValue) abs) <=10.
]
