Class {
	#name : #CreateBoxesTest,
	#superclass : #TestCase,
	#instVars : [
		'boxes',
		'aColorCollection',
		'aLoadedDie'
	],
	#category : #'IngSoft2-Tests'
}

{ #category : #Games }
CreateBoxesTest >> gameWith: aSecondLoadedDie [

	| aLoadedDiceCollection aGame |
	aLoadedDiceCollection := OrderedCollection
		                         with: aLoadedDie
		                         with: aSecondLoadedDie.
	aGame := LoadedGame
		         with: aColorCollection
		         and: 10
		         throwing: aLoadedDiceCollection
		         winningWhen: 1
		         effects: boxes.

	^ aGame
]

{ #category : #running }
CreateBoxesTest >> setUp [
	super setUp.
	
	aColorCollection := OrderedCollection with: 'red' with: 'blue'.
	boxes:= (OrderedCollection with:(NoEffectBox new) with:(SpeedUpBox new) with:(WormHoleBox new) with:(NoEffectBox new) with:(MoonWalkBox with: -2) with:(HyperJumpBox with: (OrderedCollection with: 40 with:20))).
	boxes addLast: (AtomicBombBox new).
	boxes addLast:(NoEffectBox new).
	boxes addLast:(NoEffectBox new).
	boxes addLast: (NoEffectBox new).
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 0
			               with: 0
			               with: 7
			               with: 9).
]

{ #category : #tests }
CreateBoxesTest >> testN001NoEffectBox [

	| aGame |
	aGame := self gameWith: (LoadedDie with: (OrderedCollection
				           with: 7
				           with: 8
				           with: 5
				           with: 8)).
	aGame moveNextPlayer.
	aGame moveNextPlayer.
	self
		assert: aGame positions
		equals: (OrderedCollection with: 8 with: 9)
]

{ #category : #tests }
CreateBoxesTest >> testN002WormHoleBox [

	| aGame |
	aGame := self gameWith: (LoadedDie with: (OrderedCollection
				           with: 7
				           with: 2
				           with: 5
				           with: 8)).
	aGame moveNextPlayer.
	aGame moveNextPlayer.
	self assert: aGame positions equals: (OrderedCollection with: 8 with: 1).
]

{ #category : #tests }
CreateBoxesTest >> testN003SpeedUpBox [

	| aGame |
	aGame := self gameWith: (LoadedDie with: (OrderedCollection
				           with: 7
				           with: 1
				           with: 5
				           with: 8)).
	aGame moveNextPlayer.
	aGame moveNextPlayer.
	self assert: aGame positions equals: (OrderedCollection with: 8 with: 6).
]

{ #category : #tests }
CreateBoxesTest >> testN004MoonWalkBox [

	
	| aGame |
	aGame := self gameWith: (LoadedDie with: (OrderedCollection
				           with: 7
				           with: 4
				           with: 5
				           with: 8)).
	aGame moveNextPlayer.
	aGame moveNextPlayer.
	self assert: aGame positions equals: (OrderedCollection with: 6 with: 5).
]

{ #category : #tests }
CreateBoxesTest >> testN005AtomicBombBox [

	
	| aGame |
	aGame := self gameWith: (LoadedDie with: (OrderedCollection
				           with: 7
				           with: 6
				           with: 5
				           with: 8)).
	aGame moveNextPlayer.
	aGame moveNextPlayer.
	self assert: aGame positions equals: (OrderedCollection with: 1 with: 1).
]

{ #category : #tests }
CreateBoxesTest >> testN006HyperJumpBox [

	| aGame |
	aGame := self gameWith: (LoadedDie with: (OrderedCollection
				           with: 5
				           with: 5
				           with: 5
				           with: 8)).
	aGame moveNextPlayer.
	aGame moveNextPlayer.
	self assert: aGame positions equals: (OrderedCollection with: 10 with: 8).
	
]
