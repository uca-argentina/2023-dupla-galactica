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

	| aLoadedGame aLoadedDie aBoard boxes|
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 9
			               with: 6
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
	aBoard:= Board with: 10 effects: boxes measure: 100.
	aLoadedGame := DuplaGalacticaGame 
		               with: aColorCollection
		               and: aBoard
		               throwing: aLoadedDie
							winningWhen: 1.
	^ aLoadedGame
]

{ #category : #Games }
CreateAFunctionalGameTest >> gameWithTwoLoadedDie [

	| aLoadedDie aSecondLoadedDie aLoadedDiceCollection aGame boxes aBoard|
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 4
			               with: 5
			               with: 1
			               with: 9).
	aSecondLoadedDie := LoadedDie with: (OrderedCollection
			                     with: 5
			                     with: 7
			                     with: 0
			                     with: 8).
	aLoadedDiceCollection := OrderedCollection
		                         with: aLoadedDie
		                         with: aSecondLoadedDie.
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
	aBoard:= Board with: 10 effects: boxes measure: 100.
	aGame := DuplaGalacticaGame 
		               with: aColorCollection
		               and: aBoard
		               throwing: (OrderedCollection with: aLoadedDie with: aSecondLoadedDie)
							winningWhen: 2.
	^ aGame
]

{ #category : #running }
CreateAFunctionalGameTest >> setUp [

	super setUp.


	aColorCollection := OrderedCollection with: 'red' with: 'blue'
]

{ #category : #tests }
CreateAFunctionalGameTest >> should: anErrorBlock raise: anExceptionClass withMessage: anErrorMessage [

	self
		should: anErrorBlock
		raise: anExceptionClass
		withExceptionDo: [ :error | 
		self assert: error messageText equals: anErrorMessage ]
]

{ #category : #tests }
CreateAFunctionalGameTest >> testD001CreateGameAndAskForNextPlayer [

	| aLoadedGame |
	aLoadedGame := self gameWithLoadedDie.
	self
		assert: aLoadedGame currentPlayer 
		equals: 'red' 
]

{ #category : #tests }
CreateAFunctionalGameTest >> testD002CreateGameAndAskForWinner [

	| aLoadedGame |
	aLoadedGame := self gameWithLoadedDie.
	aLoadedGame moveNextPlayer.
	aLoadedGame moveNextPlayer.
	aLoadedGame moveNextPlayer.
	self assert: aLoadedGame winner equals: 'red'
]

{ #category : #tests }
CreateAFunctionalGameTest >> testF001CreateGameWithLoadedDie [

	| aGame |
	aGame := self gameWithLoadedDie.
	aGame moveNextPlayer.
	self
		assert: aGame positions
		equals: (OrderedCollection with: 10 with: 1)
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
		equals: (OrderedCollection with: 7 with: 7)
]

{ #category : #tests }
CreateAFunctionalGameTest >> testG001CreateGameWithTwoDice [

	| aGame |
	aGame := self gameWithTwoLoadedDie.
	aGame moveNextPlayer.
	self
		assert: aGame positions
		equals: (OrderedCollection with: 10 with: 1)
]

{ #category : #tests }
CreateAFunctionalGameTest >> testG002CreateGameWithTwoDiceAndThrowThemTwoTimes [

	| aGame |
	aGame := self gameWithTwoLoadedDie.
	aGame moveNextPlayer.
	aGame moveNextPlayer.

	self
		assert: aGame positions
		equals: (OrderedCollection with: 10 with: 9)
]

{ #category : #tests }
CreateAFunctionalGameTest >> testH001TheMovesDoNotHaveEffectAfterSomeoneWins [

	| aGame |
	aGame := self gameWithTwoLoadedDie.
	aGame moveNextPlayer.
	aGame moveNextPlayer.
	aGame moveNextPlayer.

	self
		assert: aGame positions
		equals: (OrderedCollection with: 1 with: 9)
]

{ #category : #tests }
CreateAFunctionalGameTest >> testL002AskForWinnerWhenNoOneWinsAndReturnAnError [

	| aGame |
	aGame := self gameWithLoadedDie.
	aGame moveNextPlayer.
	self
		should: [ aGame winner ]
		raise: Error
		withMessage: 'There is no winner'
]

{ #category : #tests }
CreateAFunctionalGameTest >> testP010VerifyRankingAtLoadedGame [

	| aGame |
	aGame := self gameWithTwoLoadedDie.
	aGame moveNextPlayer.
	aGame moveNextPlayer.
	aGame moveNextPlayer.
	aGame moveNextPlayer.
	self
		assert: aGame ranking
		equals: (OrderedCollection with: 'blue' with: 'red')
]
