Class {
	#name : #CreateBoxesTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
CreateBoxesTest >> testN001NoEffectBox [

| aColorCollection aLoadedDie aSecondLoadedDie aLoadedDiceCollection aGame |
	aColorCollection := OrderedCollection with: 'red' with: 'blue'.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 8
			               with: 7
			               with: 9).
	aSecondLoadedDie := LoadedDie with: (OrderedCollection
			                     with: 7
			                     with: 1
			                     with: 5
			                     with: 8).
	aLoadedDiceCollection := OrderedCollection
		                         with: aLoadedDie
		                         with: aSecondLoadedDie.
	aGame := Game
		         with: aColorCollection
		         and: 10
		         throwing: aLoadedDiceCollection
					winningWhen: 1.
	aGame moveNextPlayer.
	aGame moveNextPlayer.
	self assert: aGame positions equals: (OrderedCollection with: 8 with: 9).
]

{ #category : #tests }
CreateBoxesTest >> testN002WormHoleBox [

	| aColorCollection aLoadedDie aSecondLoadedDie aLoadedDiceCollection aGame |
	aColorCollection := OrderedCollection with: 'red' with: 'blue'.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 1
			               with: 7
			               with: 9).
	aSecondLoadedDie := LoadedDie with: (OrderedCollection
			                     with: 7
			                     with: 2
			                     with: 5
			                     with: 8).
	aLoadedDiceCollection := OrderedCollection
		                         with: aLoadedDie
		                         with: aSecondLoadedDie.
	aGame := Game
		         with: aColorCollection
		         and: 10
		         throwing: aLoadedDiceCollection
					winningWhen: 1.
	aGame moveNextPlayer.
	aGame moveNextPlayer.
	self assert: aGame positions equals: (OrderedCollection with: 8 with: 0).
]

{ #category : #tests }
CreateBoxesTest >> testN003SpeedUpBox [

	| aColorCollection aLoadedDie aSecondLoadedDie aLoadedDiceCollection aGame |
	aColorCollection := OrderedCollection with: 'red' with: 'blue'.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 1
			               with: 7
			               with: 9).
	aSecondLoadedDie := LoadedDie with: (OrderedCollection
			                     with: 7
			                     with: 1
			                     with: 5
			                     with: 8).
	aLoadedDiceCollection := OrderedCollection
		                         with: aLoadedDie
		                         with: aSecondLoadedDie.
	aGame := Game
		         with: aColorCollection
		         and: 10
		         throwing: aLoadedDiceCollection
					winningWhen: 1.
	aGame moveNextPlayer.
	aGame moveNextPlayer.
	self assert: aGame positions equals: (OrderedCollection with: 8 with: 6).
]

{ #category : #tests }
CreateBoxesTest >> testN004MoonWalkBox [

	
	| aColorCollection aLoadedDie aSecondLoadedDie aLoadedDiceCollection aGame |
	aColorCollection := OrderedCollection with: 'red' with: 'blue'.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 2
			               with: 7
			               with: 9).
	aSecondLoadedDie := LoadedDie with: (OrderedCollection
			                     with: 7
			                     with: 3
			                     with: 5
			                     with: 8).
	aLoadedDiceCollection := OrderedCollection
		                         with: aLoadedDie
		                         with: aSecondLoadedDie.
	aGame := Game
		         with: aColorCollection
		         and: 10
		         throwing: aLoadedDiceCollection
					winningWhen: 1.
	aGame moveNextPlayer.
	aGame moveNextPlayer.
	self assert: aGame positions equals: (OrderedCollection with: 6 with: 5).
]

{ #category : #tests }
CreateBoxesTest >> testN005AtomicBombBox [

	
	| aColorCollection aLoadedDie aSecondLoadedDie aLoadedDiceCollection aGame |
	aColorCollection := OrderedCollection with: 'red' with: 'blue'.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 2
			               with: 7
			               with: 9).
	aSecondLoadedDie := LoadedDie with: (OrderedCollection
			                     with: 7
			                     with: 5
			                     with: 5
			                     with: 8).
	aLoadedDiceCollection := OrderedCollection
		                         with: aLoadedDie
		                         with: aSecondLoadedDie.
	aGame := Game
		         with: aColorCollection
		         and: 10
		         throwing: aLoadedDiceCollection
					winningWhen: 1.
	aGame moveNextPlayer.
	aGame moveNextPlayer.
	self assert: aGame positions equals: (OrderedCollection with: 1 with: 1).
]

{ #category : #tests }
CreateBoxesTest >> testN006HyperJumpBox [

	| aColorCollection aLoadedDie aSecondLoadedDie aLoadedDiceCollection aGame |
	aColorCollection := OrderedCollection with: 'red' with: 'blue'.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 1
			               with: 3
			               with: 7
			               with: 9).
	aSecondLoadedDie := LoadedDie with: (OrderedCollection
			                     with: 5
			                     with: 3
			                     with: 5
			                     with: 8).
	aLoadedDiceCollection := OrderedCollection
		                         with: aLoadedDie
		                         with: aSecondLoadedDie.
	aGame := Game
		         with: aColorCollection
		         and: 10
		         throwing: aLoadedDiceCollection
					winningWhen: 2.
	aGame moveNextPlayer.
	aGame moveNextPlayer.
	self assert: aGame positions equals: (OrderedCollection with: 10 with: 8).
	
]
