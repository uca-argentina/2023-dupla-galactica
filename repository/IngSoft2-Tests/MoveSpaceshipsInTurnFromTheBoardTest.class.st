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
