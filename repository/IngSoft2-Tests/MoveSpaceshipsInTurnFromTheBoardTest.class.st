Class {
	#name : #MoveSpaceshipsInTurnFromTheBoardTest,
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
MoveSpaceshipsInTurnFromTheBoardTest >> setUp [

	super setUp.

	aColorCollection := OrderedCollection with: 'red' with: 'blue'.
	aLoadedDie := LoadedDie with:
		              (OrderedCollection with: 1 with: 2 with: 3).

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
		               throwing: (OrderedCollection with: aLoadedDie)
							winningWhen: 1.
]

{ #category : #tests }
MoveSpaceshipsInTurnFromTheBoardTest >> testJ001CheckTheNextSpacheshipToPlay [

	self assert: aGame nextPlayer equals: 'red'
]

{ #category : #tests }
MoveSpaceshipsInTurnFromTheBoardTest >> testJ002CheckTheNextSpacheshipToPlayAfterMovingOne [

	aGame moveNextPlayer.
	self assert: aGame nextPlayer equals: 'blue'
]

{ #category : #tests }
MoveSpaceshipsInTurnFromTheBoardTest >> testJ003CheckTheNextSpacheshipToPlayOnceAllTheSpaceshipsThrowOneTime [

	aGame moveNextPlayer.
	aGame moveNextPlayer.
	self assert: aGame nextPlayer equals: 'red'
]
