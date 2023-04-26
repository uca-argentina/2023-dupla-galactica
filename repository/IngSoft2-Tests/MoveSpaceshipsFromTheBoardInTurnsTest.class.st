Class {
	#name : #MoveSpaceshipsFromTheBoardInTurnsTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
MoveSpaceshipsFromTheBoardInTurnsTest >> testC001BoardMovesASpaceship [
| aSpaceshipRed aSpaceshipCollection aBoard|
	aSpaceshipRed := Spaceship putOn: 0 with: 'red' and: 1.
	aSpaceshipCollection := OrderedCollection with: aSpaceshipRed.
	aBoard := Board with: 10 and: aSpaceshipCollection.
	aBoard movePlayerTo: 6.
	self assert: aSpaceshipRed position  identicalTo: 6
]

{ #category : #tests }
MoveSpaceshipsFromTheBoardInTurnsTest >> testC002BoardMovesTwoSpaceships [
| aSpaceshipRed aSpaceshipBlue aSpaceshipCollection aBoard|
	aSpaceshipRed := Spaceship putOn: 0 with: 'red' and: 1.
	aSpaceshipBlue := Spaceship putOn: 0 with: 'blue' and: 2.
	aSpaceshipCollection := OrderedCollection with: aSpaceshipRed with: aSpaceshipBlue.
	aBoard := Board with: 10 and: aSpaceshipCollection.
	aBoard movePlayerTo: 6.
	aBoard movePlayerTo: 3.
	self assert: aSpaceshipBlue position identicalTo: 3
]

{ #category : #tests }
MoveSpaceshipsFromTheBoardInTurnsTest >> testC003ASpaceshipAchieveTheGoalBeforeOthers [
| aSpaceshipRed aSpaceshipBlue aSpaceshipCollection aBoard|
	aSpaceshipRed := Spaceship putOn: 0 with: 'red' and: 1.
	aSpaceshipBlue := Spaceship putOn: 0 with: 'blue' and: 2.
	aSpaceshipCollection := OrderedCollection with: aSpaceshipRed with: aSpaceshipBlue.
	aBoard := Board with: 10 and: aSpaceshipCollection.
	aBoard movePlayerTo: 6.
	aBoard movePlayerTo: 10.
	aBoard movePlayerTo: 7.
	self assert: aBoard winner asSymbol identicalTo: 'blue' asSymbol
]
