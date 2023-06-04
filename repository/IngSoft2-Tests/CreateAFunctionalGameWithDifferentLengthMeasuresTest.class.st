Class {
	#name : #CreateAFunctionalGameWithDifferentLengthMeasuresTest,
	#superclass : #TestCase,
	#instVars : [
		'aColorCollection',
		'aLoadedDie',
		'boxes'
	],
	#category : #'IngSoft2-Tests'
}

{ #category : #running }
CreateAFunctionalGameWithDifferentLengthMeasuresTest >> setUp [
	super setUp.
	
	aColorCollection := OrderedCollection with: 'red' with: 'blue'.
	aLoadedDie := LoadedDie with:
		              (OrderedCollection with: 1 with: 2 with: 3).

	boxes := (BoxCreator use:
		          (OrderedCollection with: (NoEffectBox withChance: 100))) 
		         create: 10.
]

{ #category : #tests }
CreateAFunctionalGameWithDifferentLengthMeasuresTest >> testS001CreateABordWithParsecs [

	| aBoard oneHundredParsecs aGame |
	oneHundredParsecs := Parsecs worth: 100.

	aBoard := Board with: boxes measure: oneHundredParsecs.
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         throwing: aLoadedDie
		         winningWhen: 1
		         using: CardDealer new.

	self assert: aGame parsecs nominalValue equals: 100
]

{ #category : #tests }
CreateAFunctionalGameWithDifferentLengthMeasuresTest >> testS002CreateABordWithLigthYears [

	| aBoard threeHundredLigthYears aGame |
	threeHundredLigthYears := LigthYears worth: 300.
	aBoard := Board with: boxes measure: threeHundredLigthYears.
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         throwing: aLoadedDie
		         winningWhen: 1
		         using: CardDealer new.

	self assert: aGame lightYears nominalValue equals: 300
]

{ #category : #tests }
CreateAFunctionalGameWithDifferentLengthMeasuresTest >> testS003CreateABordWithParsecsAndAskForLightYears [

	| aBoard oneHundredParsecs aGame |
	oneHundredParsecs := Parsecs worth: 100.
	aBoard := Board with: boxes measure: oneHundredParsecs.
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         throwing: aLoadedDie
		         winningWhen: 1
		         using: CardDealer new.

	self assert: aGame lightYears nominalValue equals: 300
]

{ #category : #tests }
CreateAFunctionalGameWithDifferentLengthMeasuresTest >> testS004CreateABordWithLigthYearsAndAskForParsecs [

	| aBoard threeHundredLigthYears aGame |
	threeHundredLigthYears := LigthYears worth: 300.
	aBoard := Board with: boxes measure: threeHundredLigthYears.
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         throwing: aLoadedDie
		         winningWhen: 1
		         using: CardDealer new.

	self assert: aGame parsecs nominalValue equals: 100
]
