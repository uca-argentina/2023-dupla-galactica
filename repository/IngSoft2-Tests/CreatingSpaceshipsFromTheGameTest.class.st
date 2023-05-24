Class {
	#name : #CreatingSpaceshipsFromTheGameTest,
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
CreatingSpaceshipsFromTheGameTest >> setUp [

	super setUp.

	aColorCollection := OrderedCollection with: 'red'.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 8
			               with: 5
			               with: 7
			               with: 9).

	boxes:= OrderedCollection
		         with: NoEffectBox new
		         with: SpeedUpBox new
		         with: WormHoleBox new
		         with: NoEffectBox new
		         with: (MoonWalkBox with: 10)
		         with: (HyperJumpBox with: (OrderedCollection
					           with: 20
					           with: 40
					           with: 30
					           with: -10
					           with: 50)).
	boxes addLast: NoEffectBox new.
	boxes addLast: AtomicBombBox new.
	boxes addLast: NoEffectBox new.
	boxes addLast: NoEffectBox new.
	aBoard:= Board with: 9 effects: boxes measure: 100.
	aGame := DuplaGalacticaGame 
		               with: aColorCollection
		               and: aBoard
		               throwing: (OrderedCollection with: aLoadedDie)
							winningWhen: 1.
]

{ #category : #tests }
CreatingSpaceshipsFromTheGameTest >> testI001CreatingSpaceshipsFromTheGame [

	aGame moveNextPlayer.
	self assert: aGame positions equals: (OrderedCollection with: 9)
]
