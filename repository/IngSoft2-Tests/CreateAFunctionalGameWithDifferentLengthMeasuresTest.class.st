Class {
	#name : #CreateAFunctionalGameWithDifferentLengthMeasuresTest,
	#superclass : #TestCase,
	#instVars : [
		'aLoadedDie',
		'aBoxesCollection',
		'aCardsCollection',
		'aColorsCollection'
	],
	#category : #'IngSoft2-Tests'
}

{ #category : #running }
CreateAFunctionalGameWithDifferentLengthMeasuresTest >> setUp [

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
				                       withChanceOf: 100))) create: 10
]

{ #category : #tests }
CreateAFunctionalGameWithDifferentLengthMeasuresTest >> testS001CreateAGameWithAParsecMeasureThenAskForParsecsNominalValue [

	| aBoard aDuplaGalacticaGame |
	aBoard := Board
		          with: aBoxesCollection
		          measure: (ParsecMeasure worth: 100).
	aDuplaGalacticaGame := DuplaGalacticaGameProxy
		                       with: aColorsCollection
		                       and: aBoard
		                       usingToThrow:
		                       (DiceShaker with:
			                        (OrderedCollection with: aLoadedDie))
		                       winningWhenReach: 1
		                       using: aCardsCollection.
	self assert: aDuplaGalacticaGame parsecs nominalValue equals: 100
]

{ #category : #tests }
CreateAFunctionalGameWithDifferentLengthMeasuresTest >> testS002CreateAGameWithALightYearMeasureThenAskForLightYearsNominalValue [

	| aBoard aDuplaGalacticaGame |
	aBoard := Board
		          with: aBoxesCollection
		          measure: (LigthYearMeasure worth: 300).
	aDuplaGalacticaGame := DuplaGalacticaGameProxy
		                       with: aColorsCollection
		                       and: aBoard
		                       usingToThrow:
		                       (DiceShaker with:
			                        (OrderedCollection with: aLoadedDie))
		                       winningWhenReach: 1
		                       using: aCardsCollection.
	self assert: aDuplaGalacticaGame lightYears nominalValue equals: 300
]

{ #category : #tests }
CreateAFunctionalGameWithDifferentLengthMeasuresTest >> testS003CreateAGameWithAParsecMeasureThenAskForLightYearsNominalValue [

	| aBoard aDuplaGalacticaGame |
	aBoard := Board
		          with: aBoxesCollection
		          measure: (ParsecMeasure worth: 100).
	aDuplaGalacticaGame := DuplaGalacticaGameProxy
		                       with: aColorsCollection
		                       and: aBoard
		                       usingToThrow:
		                       (DiceShaker with:
			                        (OrderedCollection with: aLoadedDie))
		                       winningWhenReach: 1
		                       using: aCardsCollection.
	self assert: aDuplaGalacticaGame lightYears nominalValue equals: 300
]

{ #category : #tests }
CreateAFunctionalGameWithDifferentLengthMeasuresTest >> testS004CreateAGameWithALightYearMeasureThenAskForParsecsNominalValue [

	| aBoard aDuplaGalacticaGame |
	aBoard := Board
		          with: aBoxesCollection
		          measure: (LigthYearMeasure worth: 300).
	aDuplaGalacticaGame := DuplaGalacticaGameProxy
		                       with: aColorsCollection
		                       and: aBoard
		                       usingToThrow:
		                       (DiceShaker with:
			                        (OrderedCollection with: aLoadedDie))
		                       winningWhenReach: 1
		                       using: aCardsCollection.
	self assert: aDuplaGalacticaGame parsecs nominalValue equals: 100
]
