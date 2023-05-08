Class {
	#name : #CreateAFunctionalGameTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
CreateAFunctionalGameTest >> should: anErrorBlock raise: anExceptionClass withMessage: anErrorMessage [ 
	self
		should: anErrorBlock
		raise: anExceptionClass 
		withExceptionDo: [ :error|
			self assert: error messageText equals: anErrorMessage ].
]

{ #category : #tests }
CreateAFunctionalGameTest >> testD001CreateGameAndAskForNextPlayer [
	| aColorCollection aLoadedDie aGame|
	aColorCollection := OrderedCollection with:'red' with:'blue'.
	
	aLoadedDie:= LoadedDie with: (OrderedCollection with:8 with:5 with:7 with:9).
	aGame := Game with: aColorCollection  and: 8 throwing: (OrderedCollection with: aLoadedDie) winningWhen: 1.
	
	self assert: aGame nextPlayer asSymbol identicalTo: 'red' asSymbol
]

{ #category : #tests }
CreateAFunctionalGameTest >> testD002CreateGameAndAskForWinner [
	| aColorCollection aLoadedDie aGame|
	aColorCollection := OrderedCollection with:'red' with:'blue'.
	aLoadedDie:= LoadedDie with: (OrderedCollection with:9 with:5 with:7 with:9).
	aGame := Game with: aColorCollection  and: 8 throwing: (OrderedCollection with: aLoadedDie) winningWhen: 1.
	aGame moveNextPlayer.
	self assert: aGame winner asSymbol identicalTo: 'red' asSymbol
]

{ #category : #tests }
CreateAFunctionalGameTest >> testD003CreateGameAndAskForFinalMessage [
	| aColorCollection aLoadedDie aGame|
	aColorCollection := OrderedCollection with:'red' with:'blue'.
	aLoadedDie:= LoadedDie with: (OrderedCollection with:8 with:5 with:7 with:9).
	aGame := Game with: aColorCollection and: 8 throwing: (OrderedCollection with: aLoadedDie) winningWhen: 1.
	aGame moveNextPlayer.
	self
		assert: aGame positions
		equals: (OrderedCollection with: 8 with: 0)
]

{ #category : #tests }
CreateAFunctionalGameTest >> testF001CreateGameWithLoadedDie [
	| aColorCollection aLoadedDie aGame|
	aColorCollection := OrderedCollection with:'red' with:'blue'.
	aLoadedDie:= LoadedDie with: (OrderedCollection with:8 with:5 with:7 with:9).
	aGame := Game with: aColorCollection and: 15 throwing: (OrderedCollection with: aLoadedDie) winningWhen: 1 .
	aGame moveNextPlayer.
	self
		assert: aGame positions
		equals: (OrderedCollection with: 8 with: 0)
]

{ #category : #tests }
CreateAFunctionalGameTest >> testF002CreateGameWithLoadedDieAndThrowItThreeTimes [
	| aColorCollection aLoadedDie aGame|
	aColorCollection := OrderedCollection with:'red' with:'blue'.
	aLoadedDie:= LoadedDie with: (OrderedCollection with:8 with:5 with:7 with:9).
	aGame := Game with: aColorCollection  and: 15 throwing:( OrderedCollection with: aLoadedDie) winningWhen: 1.
	aGame moveNextPlayer.
	aGame moveNextPlayer.
	aGame moveNextPlayer.
	self
		assert: aGame positions
		equals: (OrderedCollection with: 15 with: 5)
]

{ #category : #tests }
CreateAFunctionalGameTest >> testG001CreateGameWithTwoDice [

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
		         throwing: aLoadedDiceCollection
		         winningWhen: 1.
	aGame moveNextPlayer.
	self
		assert: aGame positions
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
		         and: 29
		         throwing: aLoadedDiceCollection
					winningWhen: 1.
	aGame moveNextPlayer.
	aGame moveNextPlayer.
	aGame moveNextPlayer.
		
	self
		assert: aGame positions
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
		         and: 16
		         throwing: aLoadedDiceCollection
					winningWhen: 1.
	aGame moveNextPlayer.
	aGame moveNextPlayer.
	aGame moveNextPlayer.

	self
		assert: aGame positions
		equals: (OrderedCollection with: 1 with: 0)
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
		         and: 16
		         throwing: aLoadedDiceCollection
					winningWhen: 1.
	aGame moveNextPlayer.
	aGame moveNextPlayer.
	aGame moveNextPlayer.
	self
		assert: aGame positions
		equals: (OrderedCollection with: 1 with: 0)
]

{ #category : #tests }
CreateAFunctionalGameTest >> testL002AskForWinnerWhenNoOneWinsAndReturnAnError [
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
		         and: 18
		         throwing: aLoadedDiceCollection
					winningWhen: 1.
	aGame moveNextPlayer.
	self should: [ aGame winner ] raise: Error withMessage: 'There is no winner'.
]
