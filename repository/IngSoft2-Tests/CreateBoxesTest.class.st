Class {
	#name : #CreateBoxesTest,
	#superclass : #TestCase,
	#instVars : [
		'aColorCollection'
	],
	#category : #'IngSoft2-Tests'
}

{ #category : #running }
CreateBoxesTest >> setUp [

	super setUp.

	aColorCollection := OrderedCollection with: 'red' with: 'blue'.
]

{ #category : #tests }
CreateBoxesTest >> testN001NoEffectBox [
	|aLoadedDie aGame boxes aBoard |
	aLoadedDie := LoadedDie with: (OrderedCollection  with: 6 with: 8 with: 5 with: 8).
	boxes:= OrderedCollection
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
	aBoard:= Board with: 10 effects: boxes measure: 100.
	aGame := DuplaGalacticaGame 
		               with: aColorCollection
		               and: aBoard
		               throwing: aLoadedDie
							winningWhen: 1.
	aGame moveNextPlayer.
	aGame moveNextPlayer.
	self
		assert: aGame positions
		equals: (OrderedCollection with: 7 with: 9)
]

{ #category : #tests }
CreateBoxesTest >> testN002WormHoleBox [

	|aLoadedDie aGame boxes aBoard |
	aLoadedDie := LoadedDie with: (OrderedCollection  with: 5 with: 8 with: 5 with: 8).
	boxes:= OrderedCollection
		         with: NoEffectBox new
		         with: NoEffectBox new
		         with: NoEffectBox new
		         with: NoEffectBox new
		         with: NoEffectBox  new
		         with: WormHoleBox new.
	boxes addLast: NoEffectBox new.
	boxes addLast: NoEffectBox new.
	boxes addLast: NoEffectBox new.
	boxes addLast: NoEffectBox new.
	aBoard:= Board with: 10 effects: boxes measure: 100.
	aGame := DuplaGalacticaGame 
		               with: aColorCollection
		               and: aBoard
		               throwing: aLoadedDie 
							winningWhen: 1.
	aGame moveNextPlayer.
	aGame moveNextPlayer.
	self
		assert: aGame positions
		equals: (OrderedCollection with: 2 with: 9)
]

{ #category : #tests }
CreateBoxesTest >> testN003SpeedUpBox [

	|aLoadedDie aGame boxes aBoard |
	aLoadedDie := LoadedDie with: (OrderedCollection  with: 1 with: 8 with: 5 with: 8).
	boxes:= OrderedCollection
		         with: NoEffectBox new
		         with: SpeedUpBox new
		         with: NoEffectBox new
		         with: NoEffectBox new
		         with: NoEffectBox new
		         with: NoEffectBox new.
	boxes addLast: NoEffectBox new.
	boxes addLast: NoEffectBox new.
	boxes addLast: NoEffectBox new.
	boxes addLast: NoEffectBox new.
	aBoard:= Board with: 10 effects: boxes measure: 100.
	aGame := DuplaGalacticaGame 
		               with: aColorCollection
		               and: aBoard
		               throwing: aLoadedDie
							winningWhen: 1.
	aGame moveNextPlayer.
	aGame moveNextPlayer.
	self
		assert: aGame positions
		equals: (OrderedCollection with: 6 with: 9)
]

{ #category : #tests }
CreateBoxesTest >> testN004MoonWalkBox [

	|aLoadedDie aGame boxes aBoard |
	aLoadedDie := LoadedDie with: (OrderedCollection  with: 8 with: 3 with: 5 with: 8).
	boxes:= OrderedCollection
		         with: NoEffectBox new
		         with: NoEffectBox new
		         with: NoEffectBox new
		         with: (MoonWalkBox with: -2)
		         with: NoEffectBox new
		         with: NoEffectBox new.
	boxes addLast: NoEffectBox new.
	boxes addLast: NoEffectBox new.
	boxes addLast: NoEffectBox new.
	boxes addLast: NoEffectBox new.
	aBoard:= Board with: 10 effects: boxes measure: 100.
	aGame := DuplaGalacticaGame 
		               with: aColorCollection
		               and: aBoard
		               throwing: aLoadedDie 
							winningWhen: 1.
	aGame moveNextPlayer.
	aGame moveNextPlayer.
	self
		assert: aGame positions
		equals: (OrderedCollection with: 7 with: 4)
]

{ #category : #tests }
CreateBoxesTest >> testN005AtomicBombBox [

	|aLoadedDie aGame boxes aBoard |
	aLoadedDie := LoadedDie with: (OrderedCollection  with: 8 with: 7 with: 5 with: 8).
	boxes:= OrderedCollection
		         with: NoEffectBox new
		         with: NoEffectBox new
		         with: NoEffectBox new
		         with: NoEffectBox new
		         with: NoEffectBox new
		         with: NoEffectBox new.
	boxes addLast: NoEffectBox new.
	boxes addLast: AtomicBombBox new.
	boxes addLast: NoEffectBox new.
	boxes addLast: NoEffectBox new.
	aBoard:= Board with: 10 effects: boxes measure: 100.
	aGame := DuplaGalacticaGame 
		               with: aColorCollection
		               and: aBoard
		               throwing: aLoadedDie 
							winningWhen: 1.
	aGame moveNextPlayer.
	aGame moveNextPlayer.
	self
		assert: aGame positions
		equals: (OrderedCollection with: 1 with: 1)
]

{ #category : #tests }
CreateBoxesTest >> testN006HyperJumpBox [

	|aLoadedDie aGame boxes aBoard |
	aLoadedDie := LoadedDie with: (OrderedCollection  with: 3 with: 3 with: 5 with: 8).
	boxes:= OrderedCollection
		         with: NoEffectBox new
		         with: NoEffectBox new
		         with: NoEffectBox new
		         with: (HyperJumpBox with: (OrderedCollection with: 40 with: 30))
		         with: NoEffectBox new
		         with: NoEffectBox new.
	boxes addLast: NoEffectBox new.
	boxes addLast: NoEffectBox new.
	boxes addLast: NoEffectBox new.
	boxes addLast: NoEffectBox new.
	aBoard:= Board with: 10 effects: boxes measure: 100.
	aGame := DuplaGalacticaGame 
		               with: aColorCollection
		               and: aBoard
		               throwing: aLoadedDie 
							winningWhen: 1.
	aGame moveNextPlayer.
	aGame moveNextPlayer.
	self
		assert: aGame positions
		equals: (OrderedCollection with: 8 with: 7)
]

{ #category : #tests }
CreateBoxesTest >> testN007WormHoleBoxWhenPlayerIsInTheFirstLap [

	| aLoadedDie aGame boxes aBoard |
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 8
			               with: 5
			               with: 8).
	boxes := OrderedCollection
		         with: NoEffectBox new
		         with: WormHoleBox new
		         with: NoEffectBox new
		         with: NoEffectBox new
		         with: NoEffectBox new
		         with: NoEffectBox new.
	boxes addLast: NoEffectBox new.
	boxes addLast: NoEffectBox new.
	boxes addLast: NoEffectBox new.
	boxes addLast: NoEffectBox new.
	aBoard := Board with: 10 effects: boxes measure: 100.
	aGame := DuplaGalacticaGame
		         with: aColorCollection
		         and: aBoard
		         throwing: aLoadedDie 
		         winningWhen: 1.
	aGame moveNextPlayer.
	aGame moveNextPlayer.
	self
		assert: aGame positions
		equals: (OrderedCollection with: 1 with: 9)
]

{ #category : #tests }
CreateBoxesTest >> testN008MoonWalkBoxWhenPlayerIsInTheFirstLap [

	| aLoadedDie aGame boxes aBoard |
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 4
			               with: 5
			               with: 8).
	boxes := OrderedCollection
		         with: NoEffectBox new
		         with: NoEffectBox new
		         with: NoEffectBox new
		         with: NoEffectBox new
		         with: (MoonWalkBox with: -4)
		         with: NoEffectBox new.
	boxes addLast: NoEffectBox new.
	boxes addLast: NoEffectBox new.
	boxes addLast: NoEffectBox new.
	boxes addLast: NoEffectBox new.
	aBoard := Board with: 10 effects: boxes measure: 100.
	aGame := DuplaGalacticaGame
		         with: aColorCollection
		         and: aBoard
		         throwing: aLoadedDie 
		         winningWhen: 1.
	aGame moveNextPlayer.
	aGame moveNextPlayer.
	self
		assert: aGame positions
		equals: (OrderedCollection with: 1 with: 5)
]

{ #category : #tests }
CreateBoxesTest >> testN009HyperJumpBoxWhenPlayerIsInTheFirstLap [

	|aLoadedDie aGame boxes aBoard |
	aLoadedDie := LoadedDie with: (OrderedCollection  with: 3 with: 3 with: 5 with: 8).
	boxes:= OrderedCollection
		         with: NoEffectBox new
		         with: NoEffectBox new
		         with: NoEffectBox new
		         with: (HyperJumpBox with: (OrderedCollection with: -40 with: -10))
		         with: NoEffectBox new
		         with: NoEffectBox new.
	boxes addLast: NoEffectBox new.
	boxes addLast: NoEffectBox new.
	boxes addLast: NoEffectBox new.
	boxes addLast: NoEffectBox new.
	aBoard:= Board with: 10 effects: boxes measure: 100.
	aGame := DuplaGalacticaGame 
		               with: aColorCollection
		               and: aBoard
		               throwing: aLoadedDie
							winningWhen: 1.
	aGame moveNextPlayer.
	aGame moveNextPlayer.
	self
		assert: aGame positions
		equals: (OrderedCollection with: 1 with: 3)
]
