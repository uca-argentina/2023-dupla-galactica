Class {
	#name : #BoardMovingSpaceshipsTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
BoardMovingSpaceshipsTest >> testC001BoardMovesASpaceship [
| aSpaceshipRed aSpaceshipCollection aBoard|
	aSpaceshipRed := Spaceship putOn: 0 with: 'red' and: 1.
	aSpaceshipCollection := OrderedCollection with: aSpaceshipRed.
	aBoard := Board with: 10 and: aSpaceshipCollection.
	aBoard moveSpaceship: 6.
	self assert: aSpaceshipRed position  identicalTo: 6
]

{ #category : #tests }
BoardMovingSpaceshipsTest >> testC002BoardMovesTwoSpaceships [
| aSpaceshipRed aSpaceshipBlue aSpaceshipCollection aBoard|
	aSpaceshipRed := Spaceship putOn: 0 with: 'red' and: 1.
	aSpaceshipBlue := Spaceship putOn: 0 with: 'blue' and: 2.
	aSpaceshipCollection := OrderedCollection with: aSpaceshipRed with: aSpaceshipBlue.
	aBoard := Board with: 10 and: aSpaceshipCollection.
	aBoard moveSpaceship: 6.
	aBoard moveSpaceship: 3.
	self assert: aSpaceshipBlue position identicalTo: 3
]

{ #category : #tests }
BoardMovingSpaceshipsTest >> testC003ASpaceshipAchieveTheGoalBeforeOthers [ 
| aSpaceshipRed aSpaceshipBlue aSpaceshipCollection aBoard|
	aSpaceshipRed := Spaceship putOn: 0 with: 'red' and: 1.
	aSpaceshipBlue := Spaceship putOn: 0 with: 'blue' and: 2.
	aSpaceshipCollection := OrderedCollection with: aSpaceshipRed with: aSpaceshipBlue.
	aBoard := Board with: 10 and: aSpaceshipCollection.
	aBoard moveSpaceship: 6.
	aBoard moveSpaceship: 10.
	aBoard moveSpaceship: 7.
	self assert: aBoard winner asSymbol identicalTo: 'blue' asSymbol
]
