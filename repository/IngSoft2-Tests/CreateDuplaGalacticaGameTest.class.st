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
		         and: (OrderedCollection with: 10 with: 1 with: 200)
		         throwing: (OrderedCollection with: aLoadedDie).
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
	self assert: (aGame parsecs) equals: 200.
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

{ #category : #tests }
CreateDuplaGalacticaGameTest >> testP017VerifyTheCorrectCreationOfGameWhenNoColorHasBennPass [

	self
		should: [ 
			DuplaGalacticaGame
				with: OrderedCollection new
				and: (OrderedCollection with: 10 with:1 with:200)
				throwing: (OrderedCollection with: aLoadedDie).]
		raise: Error
		withMessage: 'Cannot create a game with no players'
]

{ #category : #tests }
CreateDuplaGalacticaGameTest >> testP018VerifyTheCorrectCreationOfGameWhenTheGoalLapsAreInvalid [

	self
		should: [ 
			DuplaGalacticaGame
				with: aColorCollection 
				and: (OrderedCollection with: 10 with:-1 with:200)
				throwing: (OrderedCollection with: aLoadedDie).]
		raise: Error
		withMessage: 'Cannot create a game with that goal laps'
]

{ #category : #tests }
CreateDuplaGalacticaGameTest >> testP019VerifyTheCorrectCreationOfGameWhenTheParsecsAmountAreInvalid [

	self
		should: [ 
			DuplaGalacticaGame
				with: aColorCollection 
				and: (OrderedCollection with: 10 with:1 with:0)
				throwing: (OrderedCollection with: aLoadedDie).]
		raise: Error
		withMessage: 'Cannot create a game a negative parsec amount'.
]
