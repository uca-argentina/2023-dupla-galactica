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
	boxes := OrderedCollection
		                   with: NoEffectBox new
		                   with: NoEffectBox new
		                   with: NoEffectBox new
		                   with: NoEffectBox new
		                   with: NoEffectBox new
		                   with: NoEffectBox new.
	boxes addLast: NoEffectBox new.
	boxes addLast: NoEffectBox new.
	boxes addLast: NoEffectBox new.
	boxes addLast: NoEffectBox new.

	aGame := Game
		         with: aColorCollection
		         and: 8
		         throwing: (OrderedCollection with: aLoadedDie)
		         winningWhen: 1
		         effects: boxes
]

{ #category : #tests }
CreatingSpaceshipsFromTheGameTest >> testI001CreatingSpaceshipsFromTheGame [

	aGame moveNextPlayer.
	self
		assert: aGame positions
		equals: (OrderedCollection with: 8)
]
