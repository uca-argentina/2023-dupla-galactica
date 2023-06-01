Class {
	#name : #CreatingPlayersFromTheGameTest,
	#superclass : #TestCase,
	#instVars : [
		'aColorCollection',
		'aLoadedDie',
		'boxes',
		'aGame',
		'aBoard'
	],
	#category : #'IngSoft2-Tests'
}

{ #category : #running }
CreatingPlayersFromTheGameTest >> setUp [

	super setUp.

	aColorCollection := OrderedCollection with: 'red'.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 8
			               with: 5
			               with: 7
			               with: 9).
	boxes:= (BoxCreator use: (OrderedCollection with: (NoEffectBox withChance: 100))) create: 10.
	aBoard := Board with: boxes measure: (Parsecs worth: 100).
	aGame := DuplaGalacticaGameProxy
		         with: aColorCollection
		         and: aBoard
		         throwing: aLoadedDie
		         winningWhen: 1
		         using: CardDealer new
]

{ #category : #tests }
CreatingPlayersFromTheGameTest >> testI001CreatingPlayersFromTheGame [

	aGame movePlayer.
	self assert: aGame playersPositions equals: (OrderedCollection with: 9)
]
