Class {
	#name : #CreatingPlayersFromTheGameTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
CreatingPlayersFromTheGameTest >> testI001CreateAGameWithAColorsCollectionThenCheckTheCreationOfPlayers [

	| aBoard aColorCollection aLoadedDie aShaker boxes aCardsCollection aGame |
	aCardsCollection := (Creator use: (OrderedCollection with:
			                      (ObjectProbability
				                       using: OverloadCard initializeNew
				                       withChanceOf: 100))) create: 4.
	aColorCollection := OrderedCollection with: 'red' with: 'blue'.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 8
			               with: 5
			               with: 7
			               with: 9).
	aShaker := DiceShaker with: aLoadedDie.
	boxes := (Creator use: (OrderedCollection with:
			           (ObjectProbability
				            using: NoEffectBox initializeNew
				            withChanceOf: 100))) create: 10.
	aBoard := Board with: boxes measure: (Parsec worth: 100).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         usingToThrow: aShaker
		         winningWhenReach: 1
		         using: aCardsCollection.
	self
		assert: aGame playersColors
		equals: (OrderedCollection with: 'red' with: 'blue')
]
