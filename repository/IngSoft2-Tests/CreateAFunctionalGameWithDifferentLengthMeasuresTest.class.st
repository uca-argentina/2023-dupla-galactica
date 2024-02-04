Class {
	#name : #CreateAFunctionalGameWithDifferentLengthMeasuresTest,
	#superclass : #TestCase,
	#instVars : [
		'aColorCollection',
		'aLoadedDie',
		'boxes',
		'aShaker'
	],
	#category : #'IngSoft2-Tests'
}

{ #category : #running }
CreateAFunctionalGameWithDifferentLengthMeasuresTest >> setUp [
	super setUp.
	
	aColorCollection := OrderedCollection with: 'red' with: 'blue'.
	aLoadedDie := LoadedDie with:
		              (OrderedCollection with: 1 with: 2 with: 3).
	aShaker := DiceShaker with: aLoadedDie.
	boxes := (BoxCreator use:
		          (OrderedCollection with: (BoxProbability using: NoEffectBox new withChanceOf: 100))) 
		         create: 10.
]

{ #category : #tests }
CreateAFunctionalGameWithDifferentLengthMeasuresTest >> testS001CreateABordWithParsec [

	| aBoard oneHundredParsecs aGame |
	oneHundredParsecs := Parsec worth: 100.
	aShaker := DiceShaker with: aLoadedDie.
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
CreateAFunctionalGameWithDifferentLengthMeasuresTest >> testS002CreateABordWithLigthYear [

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
CreateAFunctionalGameWithDifferentLengthMeasuresTest >> testS003CreateABordWithParsecAndAskForLightYear [

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
CreateAFunctionalGameWithDifferentLengthMeasuresTest >> testS004CreateABordWithLigthYearAndAskForParsec [

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
