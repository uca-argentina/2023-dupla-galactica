Class {
	#name : #CreateAFunctionalGameWithDifferentLengthMeasuresTest,
	#superclass : #TestCase,
	#instVars : [
		'aColorCollection',
		'boxes',
		'aShaker'
	],
	#category : #'IngSoft2-Tests'
}

{ #category : #running }
CreateAFunctionalGameWithDifferentLengthMeasuresTest >> setUp [

	| aLoadedDie |
	super setUp.

	aColorCollection := OrderedCollection with: 'red' with: 'blue'.
	aLoadedDie := LoadedDie with:
		              (OrderedCollection with: 1 with: 2 with: 3).
	aShaker := DiceShaker with: aLoadedDie.
	boxes := (BoxCreator use: (OrderedCollection with:
			           (BoxProbability
				            using: NoEffectBox initializeNew
				            withChanceOf: 100))) create: 10
]

{ #category : #tests }
CreateAFunctionalGameWithDifferentLengthMeasuresTest >> testS001CreateAGameWithAParsecMeasureThenAskForParsecsNominalValue [

	| aBoard oneHundredParsecs aGame |
	oneHundredParsecs := Parsec worth: 100.
	aBoard := Board with: boxes measure: oneHundredParsecs.
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         usingToThrow: aShaker
		         winningWhenReach: 1
		         using: (CardDealer with: (OrderedCollection with: (CardProbability using: OverloadCard withChanceOf: 100))).

	self assert: aGame parsecs nominalValue equals: 100
]

{ #category : #tests }
CreateAFunctionalGameWithDifferentLengthMeasuresTest >> testS002CreateAGameWithALightYearMeasureThenAskForLightYearsNominalValue [

	| aBoard threeHundredLigthYears aGame |
	threeHundredLigthYears := LigthYear worth: 300.
	aBoard := Board with: boxes measure: threeHundredLigthYears.
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         usingToThrow: aShaker
		         winningWhenReach: 1
		         using: (CardDealer with: (OrderedCollection with: (CardProbability using: OverloadCard withChanceOf: 100))).

	self assert: aGame lightYears nominalValue equals: 300
]

{ #category : #tests }
CreateAFunctionalGameWithDifferentLengthMeasuresTest >> testS003CreateAGameWithAParsecMeasureThenAskForLightYearsNominalValue [

	| aBoard oneHundredParsecs aGame |
	oneHundredParsecs := Parsec worth: 100.
	aBoard := Board with: boxes measure: oneHundredParsecs.
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         usingToThrow: aShaker
		         winningWhenReach: 1
		         using: (CardDealer with: (OrderedCollection with: (CardProbability using: OverloadCard withChanceOf: 100))).

	self assert: aGame lightYears nominalValue equals: 300
]

{ #category : #tests }
CreateAFunctionalGameWithDifferentLengthMeasuresTest >> testS004CreateAGameWithALightYearMeasureThenAskForParsecsNominalValue [

	| aBoard threeHundredLigthYears aGame |
	threeHundredLigthYears := LigthYear worth: 300.
	aBoard := Board with: boxes measure: threeHundredLigthYears.
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         usingToThrow: aShaker
		         winningWhenReach: 1
		         using: (CardDealer with: (OrderedCollection with: (CardProbability using: OverloadCard withChanceOf: 100))).

	self assert: aGame parsecs nominalValue equals: 100
]
