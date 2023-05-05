Class {
	#name : #CreatingSpaceshipsFromTheGameTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
CreatingSpaceshipsFromTheGameTest >> testI001CreatingSpaceshipsFromTheGame [

	| aColorCollection aLoadedDie aGame |
	aColorCollection := OrderedCollection with: 'red'.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 8
			               with: 5
			               with: 7
			               with: 9).
	aGame := Game
		         with: aColorCollection 
		         and: 8
		         throwing: (OrderedCollection with: aLoadedDie).
	aGame moveNextPlayer.
	self
		assert: aGame positions
		equals: (OrderedCollection with: 8)
]
