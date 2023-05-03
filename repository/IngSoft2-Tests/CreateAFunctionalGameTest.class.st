Class {
	#name : #CreateAFunctionalGameTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
CreateAFunctionalGameTest >> testD001CreateGameAndAskForNextPlayer [
	| aSpaceshipRed aSpaceshipBlue aSpaceshipCollection aLoadedDie aGame|
	aSpaceshipRed := Spaceship putOn: 0 with: 'red' and: 1.
	aSpaceshipBlue := Spaceship putOn: 0 with: 'blue' and: 2.
	aSpaceshipCollection := OrderedCollection with: aSpaceshipRed with: aSpaceshipBlue.
	aLoadedDie:= LoadedDie with: (OrderedCollection with:8 with:5 with:7 with:9).
	aGame := Game with: aSpaceshipCollection and: 8 throwing: aLoadedDie.
	
	self assert: aGame nextPlayer asSymbol identicalTo: 'red' asSymbol
]

{ #category : #tests }
CreateAFunctionalGameTest >> testD002CreateGameAndAskForWinner [
	| aSpaceshipRed aSpaceshipBlue aSpaceshipCollection aLoadedDie aGame|
	aSpaceshipRed := Spaceship putOn: 0 with: 'red' and: 1.
	aSpaceshipBlue := Spaceship putOn: 0 with: 'blue' and: 2.
	aSpaceshipCollection := OrderedCollection with: aSpaceshipRed with: aSpaceshipBlue.
	aLoadedDie:= LoadedDie with: (OrderedCollection with:8 with:5 with:7 with:9).
	aGame := Game with: aSpaceshipCollection and: 8 throwing: aLoadedDie.
	aGame movePlayer: 8.
	self assert: aGame winner asSymbol identicalTo: 'red' asSymbol
]

{ #category : #tests }
CreateAFunctionalGameTest >> testD003CreateGameAndAskForFinalMessage [
	| aSpaceshipRed aSpaceshipBlue aSpaceshipCollection aLoadedDie aGame|
	aSpaceshipRed := Spaceship putOn: 0 with: 'red' and: 1.
	aSpaceshipBlue := Spaceship putOn: 0 with: 'blue' and: 2.
	aSpaceshipCollection := OrderedCollection with: aSpaceshipRed with: aSpaceshipBlue.
	aLoadedDie:= LoadedDie with: (OrderedCollection with:8 with:5 with:7 with:9).
	aGame := Game with: aSpaceshipCollection and: 8 throwing: aLoadedDie.
	aGame movePlayer: 8.
	self assert: aGame finalPositions asSymbol identicalTo: 'red:8 blue:0 ' asSymbol
]

{ #category : #tests }
CreateAFunctionalGameTest >> testF001CreateGameWithLoadedDie [
	| aSpaceshipRed aSpaceshipBlue aSpaceshipCollection aLoadedDie aGame|
	aSpaceshipRed := Spaceship putOn: 0 with: 'red' and: 1.
	aSpaceshipBlue := Spaceship putOn: 0 with: 'blue' and: 2.
	aSpaceshipCollection := OrderedCollection with: aSpaceshipRed with: aSpaceshipBlue.
	aLoadedDie:= LoadedDie with: (OrderedCollection with:8 with:5 with:7 with:9).
	aGame := Game with: aSpaceshipCollection and: 9 throwing: (OrderedCollection with: aLoadedDie) .
	aGame moveNextPlayer.
	aGame moveNextPlayer.
	aGame moveNextPlayer.
	self assert: aGame finalPositions asSymbol identicalTo: 'red:15 blue:5 ' asSymbol
]

{ #category : #tests }
CreateAFunctionalGameTest >> testF002CreateGameWithLoadedDieAndThrowItThreeTimes [
	| aSpaceshipRed aSpaceshipBlue aSpaceshipCollection aLoadedDie aGame|
	aSpaceshipRed := Spaceship putOn: 0 with: 'red' and: 1.
	aSpaceshipBlue := Spaceship putOn: 0 with: 'blue' and: 2.
	aSpaceshipCollection := OrderedCollection with: aSpaceshipRed with: aSpaceshipBlue.
	aLoadedDie:= LoadedDie with: (OrderedCollection with:8 with:5 with:7 with:9).
	aGame := Game with: aSpaceshipCollection and: 9 throwing:( OrderedCollection with: aLoadedDie).
	aGame moveNextPlayer.
	aGame moveNextPlayer.
	aGame moveNextPlayer.
	self assert: aGame finalPositions asSymbol identicalTo: 'red:15 blue:5 ' asSymbol
]

{ #category : #tests }
CreateAFunctionalGameTest >> testG001CreateGameWithTwoDice [

	| aSpaceshipRed aSpaceshipBlue aSpaceshipCollection aLoadedDie aSecondLoadedDie aLoadedDiceCollection aGame |
	aSpaceshipRed := Spaceship putOn: 0 with: 'red' and: 1.
	aSpaceshipBlue := Spaceship putOn: 0 with: 'blue' and: 2.
	aSpaceshipCollection := OrderedCollection
		                        with: aSpaceshipRed
		                        with: aSpaceshipBlue.
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
		         with: aSpaceshipCollection
		         and: 9
		         throwing: aLoadedDiceCollection.
	aGame moveNextPlayer.
	self
		assert: aGame finalPositions asSymbol
		identicalTo: 'red:17 blue:0 ' asSymbol
]

{ #category : #tests }
CreateAFunctionalGameTest >> testG002CreateGameWithTwoDiceAndThrowThemThreeTimes [

	| aSpaceshipRed aSpaceshipBlue aSpaceshipCollection aLoadedDie aSecondLoadedDie aLoadedDiceCollection aGame |
	aSpaceshipRed := Spaceship putOn: 0 with: 'red' and: 1.
	aSpaceshipBlue := Spaceship putOn: 0 with: 'blue' and: 2.
	aSpaceshipCollection := OrderedCollection
		                        with: aSpaceshipRed
		                        with: aSpaceshipBlue.
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
		         with: aSpaceshipCollection
		         and: 20
		         throwing: aLoadedDiceCollection.
	aGame moveNextPlayer.
	aGame moveNextPlayer.
	aGame moveNextPlayer.
		
	self
		assert: aGame finalPositions asSymbol
		identicalTo: 'red:29 blue:12 ' asSymbol
]

{ #category : #tests }
CreateAFunctionalGameTest >> testH001TheMovesDoNotHaveEffectAfterSomeoneWins [
	| aSpaceshipRed aSpaceshipBlue aSpaceshipCollection aLoadedDie aSecondLoadedDie aLoadedDiceCollection aGame |
	aSpaceshipRed := Spaceship putOn: 0 with: 'red' and: 1.
	aSpaceshipBlue := Spaceship putOn: 0 with: 'blue' and: 2.
	aSpaceshipCollection := OrderedCollection
		                        with: aSpaceshipRed
		                        with: aSpaceshipBlue.
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
		         with: aSpaceshipCollection
		         and: 17
		         throwing: aLoadedDiceCollection.
	aGame moveNextPlayer.
	aGame moveNextPlayer.
	aGame moveNextPlayer.
		
	self
		assert: aGame finalPositions asSymbol
		identicalTo: 'red:17 blue:0 ' asSymbol
]
