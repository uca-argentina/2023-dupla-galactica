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
			               with: 5
			               with: 7
			               with: 9).
]

{ #category : #tests }
CreateDuplaGalacticaGameTest >> testP001VerifyTheCorrectCreationOfTheBoardWithEffectsLength [
	|aGame|	
	
	aGame := self createGameWithEffects.

	self assert: ((aGame board) boxes) size identicalTo:  10.
]

{ #category : #tests }
CreateDuplaGalacticaGameTest >> testP002VerifyTheCorrectCreationOfTheBoardWithNoEffectsLength [
	|aGame|	
	
	aGame := self createGameWithNoEffects.

	self assert: ((aGame board) boxes) size identicalTo:  10.
]
