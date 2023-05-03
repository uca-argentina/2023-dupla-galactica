Class {
	#name : #MoveSpaceshipsInTurnFromTheBoardTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
MoveSpaceshipsInTurnFromTheBoardTest >> testJ001CheckTheNextSpacheshipToPlay [

	| aSpaceshipRed aSpaceshipBlue aSpaceshipCollection aBoard|
	aSpaceshipRed := Spaceship with: 'red'.
	aSpaceshipBlue :=Spaceship with: 'blue'.
	aSpaceshipCollection := OrderedCollection
		                        with: aSpaceshipRed
		                        with: aSpaceshipBlue.
		
	aBoard := Board with: 10 and: aSpaceshipCollection.
	self assert: aBoard nextPlayer asSymbol identicalTo: 'red' asSymbol.
]

{ #category : #tests }
MoveSpaceshipsInTurnFromTheBoardTest >> testJ002CheckTheNextSpacheshipToPlayAfterMovingOne [

	| aSpaceshipRed aSpaceshipBlue aBoard aLoadedDie|
	aSpaceshipRed := Spaceship with: 'red'.
	aSpaceshipBlue :=Spaceship with: 'blue'.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 8
			               with: 5
			               with: 7
			               with: 9).	
	aBoard := Board with: 10 and: (OrderedCollection with: (Player with: aSpaceshipRed ) with: (Player with: aSpaceshipBlue)).
	aBoard movePlayer: (OrderedCollection with: aLoadedDie).
	self assert: aBoard nextPlayer asSymbol identicalTo: 'blue' asSymbol.
]

{ #category : #tests }
MoveSpaceshipsInTurnFromTheBoardTest >> testJ003CheckTheNextSpacheshipToPlayOnceAllTheSpaceshipsThrowOneTime [

	| aSpaceshipRed aSpaceshipBlue aBoard aLoadedDie|
	aSpaceshipRed := Spaceship with: 'red'.
	aSpaceshipBlue :=Spaceship with: 'blue'.
	aLoadedDie := LoadedDie with: (OrderedCollection
			               with: 8
			               with: 5
			               with: 7
			               with: 9).
		
	aBoard := Board with: 10 and: (OrderedCollection with: (Player with: aSpaceshipRed ) with: (Player with: aSpaceshipBlue)).
	aBoard movePlayer: (OrderedCollection with: aLoadedDie).
	aBoard movePlayer: (OrderedCollection with: aLoadedDie).
	self assert: aBoard nextPlayer asSymbol identicalTo: 'red' asSymbol.
]
