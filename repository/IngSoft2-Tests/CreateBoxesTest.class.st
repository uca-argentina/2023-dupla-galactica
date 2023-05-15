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
		         winningWhen: 1.

	^ aGame
]

{ #category : #running }
CreateBoxesTest >> setUp [
	super setUp.
	
	aColorCollection := OrderedCollection with: 'red' with: 'blue'.
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
				           with: 6
				           with: 8
				           with: 5
				           with: 8)).
	aGame moveNextPlayer.
	aGame moveNextPlayer.
	self
		assert: aGame positions
		equals: (OrderedCollection with: 7 with: 9)
]

{ #category : #tests }
CreateBoxesTest >> testN002WormHoleBox [

	| aGame |
	aGame := self gameWith: (LoadedDie with: (OrderedCollection
				           with: 6
				           with: 2
				           with: 5
				           with: 8)).
	aGame moveNextPlayer.
	aGame moveNextPlayer.
	self assert: aGame positions equals: (OrderedCollection with: 7 with: 1).
]

{ #category : #tests }
CreateBoxesTest >> testN003SpeedUpBox [

	| aGame |
	aGame := self gameWith: (LoadedDie with: (OrderedCollection
				           with: 6
				           with: 1
				           with: 5
				           with: 8)).
	aGame moveNextPlayer.
	aGame moveNextPlayer.
	self assert: aGame positions equals: (OrderedCollection with: 7 with: 6).
]

{ #category : #tests }
CreateBoxesTest >> testN004MoonWalkBox [

	
	| aGame |
	aGame := self gameWith: (LoadedDie with: (OrderedCollection
				           with: 6
				           with: 4
				           with: 5
				           with: 8)).
	aGame moveNextPlayer.
	aGame moveNextPlayer.
	self deny: aGame positions equals: (OrderedCollection with: 7 with: 5).
]

{ #category : #tests }
CreateBoxesTest >> testN005AtomicBombBox [

	
	| aGame |
	aGame := self gameWith: (LoadedDie with: (OrderedCollection
				           with: 6
				           with: 7
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
	self deny: aGame positions equals: (OrderedCollection with: 6 with: 6).
	
]
