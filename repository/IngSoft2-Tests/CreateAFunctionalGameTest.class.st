Class {
	#name : #CreateAFunctionalGameTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
CreateAFunctionalGameTest >> testD001CreateGameAndAskForNextPlayer [
	| aColorCollection aLoadedDie aGame|
	aColorCollection := OrderedCollection with:'red' with:'blue'.
	
	aLoadedDie:= LoadedDie with: (OrderedCollection with:8 with:5 with:7 with:9).
	aGame := Game with: aColorCollection  and: 8 throwing: (OrderedCollection with: aLoadedDie).
	
	self assert: aGame nextPlayer asSymbol identicalTo: 'red' asSymbol
]

{ #category : #tests }
CreateAFunctionalGameTest >> testD002CreateGameAndAskForWinner [
	| aColorCollection aLoadedDie aGame|
	aColorCollection := OrderedCollection with:'red' with:'blue'.
	aLoadedDie:= LoadedDie with: (OrderedCollection with:8 with:5 with:7 with:9).
	aGame := Game with: aColorCollection  and: 8 throwing: (OrderedCollection with: aLoadedDie).
	aGame moveNextPlayer.
	self assert: aGame winner asSymbol identicalTo: 'red' asSymbol
]

{ #category : #tests }
CreateAFunctionalGameTest >> testD003CreateGameAndAskForFinalMessage [
	| aColorCollection aLoadedDie aGame|
	aColorCollection := OrderedCollection with:'red' with:'blue'.
	aLoadedDie:= LoadedDie with: (OrderedCollection with:8 with:5 with:7 with:9).
	aGame := Game with: aColorCollection and: 8 throwing: (OrderedCollection with: aLoadedDie).
	aGame moveNextPlayer.
	self
		assert: aGame finalPositions
		equals: (OrderedCollection with: 8 with: 0)
]

{ #category : #tests }
CreateAFunctionalGameTest >> testF001CreateGameWithLoadedDie [
	| aColorCollection aLoadedDie aGame|
	aColorCollection := OrderedCollection with:'red' with:'blue'.
	aLoadedDie:= LoadedDie with: (OrderedCollection with:8 with:5 with:7 with:9).
	aGame := Game with: aColorCollection and: 9 throwing: (OrderedCollection with: aLoadedDie) .
	aGame moveNextPlayer.
	aGame moveNextPlayer.
	aGame moveNextPlayer.
	self
		assert: aGame finalPositions
		equals: (OrderedCollection with: 15 with: 5)
]

{ #category : #tests }
CreateAFunctionalGameTest >> testF002CreateGameWithLoadedDieAndThrowItThreeTimes [
	| aColorCollection aLoadedDie aGame|
	aColorCollection := OrderedCollection with:'red' with:'blue'.
	aLoadedDie:= LoadedDie with: (OrderedCollection with:8 with:5 with:7 with:9).
	aGame := Game with: aColorCollection  and: 9 throwing:( OrderedCollection with: aLoadedDie).
	aGame moveNextPlayer.
	aGame moveNextPlayer.
	aGame moveNextPlayer.
	self
		assert: aGame finalPositions
		equals: (OrderedCollection with: 15 with: 5)
]

{ #category : #tests }
CreateAFunctionalGameTest >> testG001CreateGameWithTwoDice [

	| aColorCollection aLoadedDie aSecondLoadedDie aLoadedDiceCollection aGame |
	aColorCollection := OrderedCollection with:'red' with:'blue'.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 8
			               with: 5
			               with: 7
			               with: 9).
	aSecondLoadedDie := LoadedDie with: (OrderedCollection
			                     with: 9
			                     with: 7
			                     with: 5
			                     with: 8).
	aLoadedDiceCollection := OrderedCollection
		                         with: aLoadedDie
		                         with: aSecondLoadedDie.
	aGame := Game
		         with: aColorCollection 
		         and: 9
		         throwing: aLoadedDiceCollection.
	aGame moveNextPlayer.
	self
		assert: aGame finalPositions
		equals: (OrderedCollection with: 17 with: 0)
]

{ #category : #tests }
CreateAFunctionalGameTest >> testG002CreateGameWithTwoDiceAndThrowThemThreeTimes [

	| aColorCollection aLoadedDie aSecondLoadedDie aLoadedDiceCollection aGame |
	aColorCollection := OrderedCollection with:'red' with:'blue'.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 8
			               with: 5
			               with: 7
			               with: 9).
	aSecondLoadedDie := LoadedDie with: (OrderedCollection
			                     with: 9
			                     with: 7
			                     with: 5
			                     with: 8).
	aLoadedDiceCollection := OrderedCollection
		                         with: aLoadedDie
		                         with: aSecondLoadedDie.
	aGame := Game
		         with: aColorCollection 
		         and: 20
		         throwing: aLoadedDiceCollection.
	aGame moveNextPlayer.
	aGame moveNextPlayer.
	aGame moveNextPlayer.
		
	self
		assert: aGame finalPositions
		equals: (OrderedCollection with: 29 with: 12)
]

{ #category : #tests }
CreateAFunctionalGameTest >> testH001TheMovesDoNotHaveEffectAfterSomeoneWins [

	| aColorCollection aLoadedDie aSecondLoadedDie aLoadedDiceCollection aGame |
	aColorCollection := OrderedCollection with: 'red' with: 'blue'.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 8
			               with: 5
			               with: 7
			               with: 9).
	aSecondLoadedDie := LoadedDie with: (OrderedCollection
			                     with: 9
			                     with: 7
			                     with: 5
			                     with: 8).
	aLoadedDiceCollection := OrderedCollection
		                         with: aLoadedDie
		                         with: aSecondLoadedDie.
	aGame := Game
		         with: aColorCollection
		         and: 17
		         throwing: aLoadedDiceCollection.
	aGame moveNextPlayer.
	aGame moveNextPlayer.
	aGame moveNextPlayer.

	self
		assert: aGame finalPositions
		equals: (OrderedCollection with: 17 with: 0)
]

{ #category : #tests }
CreateAFunctionalGameTest >> testL001InformTheFinalPositionsFromTheGame [

	| aColorCollection aLoadedDie aSecondLoadedDie aLoadedDiceCollection aGame |
	aColorCollection := OrderedCollection with: 'red' with: 'blue'.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 8
			               with: 5
			               with: 7
			               with: 9).
	aSecondLoadedDie := LoadedDie with: (OrderedCollection
			                     with: 9
			                     with: 7
			                     with: 5
			                     with: 8).
	aLoadedDiceCollection := OrderedCollection
		                         with: aLoadedDie
		                         with: aSecondLoadedDie.
	aGame := Game
		         with: aColorCollection
		         and: 17
		         throwing: aLoadedDiceCollection.
	aGame moveNextPlayer.
	aGame moveNextPlayer.
	aGame moveNextPlayer.
	self
		assert: aGame finalPositions
		equals: (OrderedCollection with: 17 with: 0)
]
