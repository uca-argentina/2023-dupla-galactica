Class {
	#name : #CreatingSpaceshipsFromTheGameTest,
	#superclass : #TestCase,
	#instVars : [
		'aColorCollection',
		'aLoadedDie',
		'boxes',
		'aGame'
	],
	#category : #'IngSoft2-Tests'
}

{ #category : #running }
CreatingSpaceshipsFromTheGameTest >> setUp [

	super setUp.

	aColorCollection := OrderedCollection with: 'red'.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 8
			               with: 5
			               with: 7
			               with: 9).

	aGame := LoadedGame
		         with: aColorCollection
		         and: (OrderedCollection with: 9 with: 1)
		         throwing: (OrderedCollection with: aLoadedDie).
]

{ #category : #tests }
CreatingSpaceshipsFromTheGameTest >> testI001CreatingSpaceshipsFromTheGame [

	aGame moveNextPlayer.
	self
		assert: aGame positions
		equals: (OrderedCollection with: 9)
]
