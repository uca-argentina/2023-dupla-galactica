Class {
	#name : #MovePlayersInTurnFromTheGameTest,
	#superclass : #TestCase,
	#instVars : [
		'aColorCollection',
		'aLoadedDie',
		'aGame',
		'boxes',
		'aBoard'
	],
	#category : #'IngSoft2-Tests'
}

{ #category : #running }
MovePlayersInTurnFromTheGameTest >> setUp [

	super setUp.

	aColorCollection := OrderedCollection with: 'red' with: 'blue'.
	aLoadedDie := LoadedDie with:
		              (OrderedCollection with: 1 with: 2 with: 3).
	boxes:= (BoxCreator use: (OrderedCollection with: (NoEffectBox withChance: 100))) create: 10.
	aBoard:= Board with:boxes measure: 100.
	aGame := DuplaGalacticaGameProxy 
		               with: aColorCollection
		               and: aBoard
		               throwing: aLoadedDie
							winningWhen: 1
							using: CardDealer new.
]

{ #category : #tests }
MovePlayersInTurnFromTheGameTest >> testJ001CheckTheCurrentPlayerTurn [

	self assert: aGame currentPlayer equals: 'red'
]

{ #category : #tests }
MovePlayersInTurnFromTheGameTest >> testJ002CheckTheCurrentPlayerAfterMovingTheFirstOne [

	aGame movePlayer.
	self assert: aGame currentPlayer equals: 'blue'
]

{ #category : #tests }
MovePlayersInTurnFromTheGameTest >> testJ003CheckTheCurrentPlayerOnceAllThePlayersThrowOneTime [

	aGame movePlayer.
	aGame movePlayer.
	self assert: aGame currentPlayer equals: 'red'
]
