Class {
	#name : #CreateAFunctionalGameTest,
	#superclass : #TestCase,
	#instVars : [
		'aColorCollection'
	],
	#category : #'IngSoft2-Tests'
}

{ #category : #Games }
CreateAFunctionalGameTest >> gameWithLoadedDie [
| aGame aLoadedDie boxesCollection |
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 10
			               with: 5
			               with: 7
			               with: 9).
	boxesCollection := OrderedCollection
		                   with: NoEffectBox new
		                   with: NoEffectBox new
		                   with: NoEffectBox new
		                   with: NoEffectBox new
		                   with: NoEffectBox new
		                   with: NoEffectBox new.
	boxesCollection addLast: NoEffectBox new.
	boxesCollection addLast: NoEffectBox new.
	boxesCollection addLast: NoEffectBox new.
	boxesCollection addLast: NoEffectBox new.
	aGame := Game
		         with: aColorCollection
		         and: 10
		         throwing: (OrderedCollection with: aLoadedDie)
		         winningWhen: 1
		         effects: boxesCollection.
	^ aGame
]

{ #category : #Games }
CreateAFunctionalGameTest >> gameWithTwoLoadedDie [

	| aLoadedDie aSecondLoadedDie aLoadedDiceCollection aGame aBoxesCollection |
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 5
			               with: 5
			               with: 7
			               with: 9).
	aSecondLoadedDie := LoadedDie with: (OrderedCollection
			                     with: 5
			                     with: 7
			                     with: 5
			                     with: 8).
	aLoadedDiceCollection := OrderedCollection
		                         with: aLoadedDie
		                         with: aSecondLoadedDie.
	aBoxesCollection := OrderedCollection
		                    with: NoEffectBox new
		                    with: NoEffectBox new
		                    with: NoEffectBox new
		                    with: NoEffectBox new
		                    with: NoEffectBox new
		                    with: NoEffectBox new.
	aBoxesCollection addLast: NoEffectBox new.
	aBoxesCollection addLast: NoEffectBox new.
	aBoxesCollection addLast: NoEffectBox new.
	aBoxesCollection addLast: NoEffectBox new.
	aGame := Game
		         with: aColorCollection
		         and: 10
		         throwing: aLoadedDiceCollection
		         winningWhen: 1
		         effects: aBoxesCollection.
	^ aGame
]

{ #category : #running }
CreateAFunctionalGameTest >> setUp [
	
	super setUp.


	aColorCollection := OrderedCollection with: 'red' with: 'blue'.
	
]

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

	| aGame |
	aGame := self gameWithLoadedDie.
	self
		assert: aGame nextPlayer color asSymbol
		identicalTo: 'red' asSymbol
]

{ #category : #tests }
CreateAFunctionalGameTest >> testD002CreateGameAndAskForWinner [

	| aGame |
	aGame:= self gameWithLoadedDie.
	aGame moveNextPlayer.
	aGame moveNextPlayer.
	aGame moveNextPlayer.
	self assert: aGame winner asSymbol identicalTo: 'red' asSymbol
]

{ #category : #tests }
CreateAFunctionalGameTest >> testF001CreateGameWithLoadedDie [

	| aGame |
	aGame:= self gameWithLoadedDie.
	aGame moveNextPlayer.
	self
		assert: aGame positions
		equals: (OrderedCollection with: 10 with: 0)
]

{ #category : #tests }
CreateAFunctionalGameTest >> testF002CreateGameWithLoadedDieAndThrowItThreeTimes [

	| aGame |
	aGame := self gameWithLoadedDie.
	aGame moveNextPlayer.
	aGame moveNextPlayer.
	aGame moveNextPlayer.
	self
		assert: aGame positions
		equals: (OrderedCollection with: 7 with: 5)
]

{ #category : #tests }
CreateAFunctionalGameTest >> testG001CreateGameWithTwoDice [

	| aGame |
	aGame:= self gameWithTwoLoadedDie.	
	aGame moveNextPlayer.
	self
		assert: aGame positions
		equals: (OrderedCollection with: 10 with: 0)
]

{ #category : #tests }
CreateAFunctionalGameTest >> testG002CreateGameWithTwoDiceAndThrowThemTwoTimes [

	| aGame |
	aGame:= self gameWithTwoLoadedDie.
	aGame moveNextPlayer.
	aGame moveNextPlayer.
		
	self
		assert: aGame positions
		equals: (OrderedCollection with: 10 with: 2)
]

{ #category : #tests }
CreateAFunctionalGameTest >> testH001TheMovesDoNotHaveEffectAfterSomeoneWins [

	| aGame |
	aGame:= self gameWithTwoLoadedDie.
	aGame moveNextPlayer.
	aGame moveNextPlayer.
	aGame moveNextPlayer.

	self
		assert: aGame positions
		equals: (OrderedCollection with: 10 with: 2)
]

{ #category : #tests }
CreateAFunctionalGameTest >> testL002AskForWinnerWhenNoOneWinsAndReturnAnError [
	| aGame |
	aGame:= self gameWithLoadedDie.
	aGame moveNextPlayer.
	self should: [ aGame winner ] raise: Error withMessage: 'There is no winner'.
]
