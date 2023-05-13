Class {
	#name : #MoveSpaceshipsInTurnFromTheBoardTest,
	#superclass : #TestCase,
	#instVars : [
		'aColorCollection',
		'aBoxesCollection',
		'aLoadedDie',
		'aGame'
	],
	#category : #'IngSoft2-Tests'
}

{ #category : #running }
MoveSpaceshipsInTurnFromTheBoardTest >> setUp [

	super setUp.

	aColorCollection := OrderedCollection with: 'red' with: 'blue'.
	aBoxesCollection := OrderedCollection
		                    with: NoEffectBox new
		                    with: NoEffectBox new
		                    with: WormHoleBox new
		                    with: NoEffectBox new
		                    with: NoEffectBox new
		                    with: NoEffectBox new.
	aBoxesCollection addLast: NoEffectBox new.
	aBoxesCollection addLast: NoEffectBox new.
	aBoxesCollection addLast: NoEffectBox new.
	aBoxesCollection addLast: NoEffectBox new.
	
	aLoadedDie:= LoadedDie with: (OrderedCollection with: 1 with:2 with:3).

	aGame := LoadedGame
		         with: aColorCollection
		         and: 10
		         throwing: (OrderedCollection with: aLoadedDie)
		         winningWhen: 1
		         effects: aBoxesCollection
]

{ #category : #tests }
MoveSpaceshipsInTurnFromTheBoardTest >> testJ001CheckTheNextSpacheshipToPlay [

	self assert: aGame nextPlayer color asSymbol identicalTo: 'red' asSymbol.
]

{ #category : #tests }
MoveSpaceshipsInTurnFromTheBoardTest >> testJ002CheckTheNextSpacheshipToPlayAfterMovingOne [

	aGame moveNextPlayer.
	self assert: aGame nextPlayer color asSymbol identicalTo: 'blue' asSymbol.
]

{ #category : #tests }
MoveSpaceshipsInTurnFromTheBoardTest >> testJ003CheckTheNextSpacheshipToPlayOnceAllTheSpaceshipsThrowOneTime [

	aGame moveNextPlayer.
	aGame moveNextPlayer.
	self assert: aGame  nextPlayer color asSymbol identicalTo: 'red' asSymbol.
]
