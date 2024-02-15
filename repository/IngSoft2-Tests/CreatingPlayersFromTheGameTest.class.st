Class {
	#name : #CreatingPlayersFromTheGameTest,
	#superclass : #TestCase,
	#instVars : [
		'aGame'
	],
	#category : #'IngSoft2-Tests'
}

{ #category : #running }
CreatingPlayersFromTheGameTest >> setUp [

	| aBoard aColorCollection aLoadedDie aShaker boxes |
	super setUp.

	aColorCollection := OrderedCollection with: 'red'.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 8
			               with: 5
			               with: 7
			               with: 9).

	aShaker := DiceShaker with: aLoadedDie.
	boxes := (BoxCreator use: (OrderedCollection with:
			           (BoxProbability
				            using: NoEffectBox initializeNew
				            withChanceOf: 100))) create: 10.
	aBoard := Board with: boxes measure: (Parsec worth: 100).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         usingToThrow: aShaker
		         winningWhenReach: 1
		         using: (CardDealer with: (OrderedCollection with:
					           (CardProbability using: OverloadCard withChanceOf: 100)))
]

{ #category : #tests }
CreatingPlayersFromTheGameTest >> testI001CreateAGameWithAColorsCollectionThenCheckTheCreationOfPlayers [

	self assert: aGame playersColors equals: (OrderedCollection with: 'red')
]
