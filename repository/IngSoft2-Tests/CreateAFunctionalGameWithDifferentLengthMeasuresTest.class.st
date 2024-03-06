Class {
	#name : #CreateAFunctionalGameWithDifferentLengthMeasuresTest,
	#superclass : #TestCase,
	#instVars : [
		'aColorCollection',
		'aLoadedDie',
		'aBoxesCollection',
		'aCardsCollection'
	],
	#category : #'IngSoft2-Tests'
}

{ #category : #running }
CreateAFunctionalGameWithDifferentLengthMeasuresTest >> setUp [

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
				                       withChanceOf: 100))) create: 10
]

{ #category : #tests }
CreateAFunctionalGameWithDifferentLengthMeasuresTest >> testS001CreateAGameWithAParsecMeasureThenAskForParsecsNominalValue [

	| aBoard aGame |
	aBoard := Board with: aBoxesCollection measure: (Parsec worth: 100).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         usingToThrow:
		         (DiceShaker with: (OrderedCollection with: aLoadedDie))
		         winningWhenReach: 1
		         using: aCardsCollection.
	self assert: aGame parsecs nominalValue equals: 100
]

{ #category : #tests }
CreateAFunctionalGameWithDifferentLengthMeasuresTest >> testS002CreateAGameWithALightYearMeasureThenAskForLightYearsNominalValue [

	| aBoard aGame |
	aBoard := Board
		          with: aBoxesCollection
		          measure: (LigthYear worth: 300).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         usingToThrow:
		         (DiceShaker with: (OrderedCollection with: aLoadedDie))
		         winningWhenReach: 1
		         using: aCardsCollection.
	self assert: aGame lightYears nominalValue equals: 300
]

{ #category : #tests }
CreateAFunctionalGameWithDifferentLengthMeasuresTest >> testS003CreateAGameWithAParsecMeasureThenAskForLightYearsNominalValue [

	| aBoard aGame |
	aBoard := Board with: aBoxesCollection measure: (Parsec worth: 100).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         usingToThrow:
		         (DiceShaker with: (OrderedCollection with: aLoadedDie))
		         winningWhenReach: 1
		         using: aCardsCollection.
	self assert: aGame lightYears nominalValue equals: 300
]

{ #category : #tests }
CreateAFunctionalGameWithDifferentLengthMeasuresTest >> testS004CreateAGameWithALightYearMeasureThenAskForParsecsNominalValue [

	| aBoard aGame |
	aBoard := Board
		          with: aBoxesCollection
		          measure: (LigthYear worth: 300).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         usingToThrow:
		         (DiceShaker with: (OrderedCollection with: aLoadedDie))
		         winningWhenReach: 1
		         using: aCardsCollection.
	self assert: aGame parsecs nominalValue equals: 100
]
