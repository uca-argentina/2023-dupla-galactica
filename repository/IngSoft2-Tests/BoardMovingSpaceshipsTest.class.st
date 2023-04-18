Class {
	#name : #BoardMovingSpaceshipsTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
BoardMovingSpaceshipsTest >> testC001BoardMovesASpaceship [
| aSpaceshipRed aSpaceshipCollection aBoard|
	aSpaceshipRed := Spaceship putItOnThePosition: 0 withColor: 'red' withTurn: 1.
	aSpaceshipCollection := OrderedCollection with: aSpaceshipRed.
	aBoard := Board withSizeOf: 10 and: aSpaceshipCollection.
	aBoard moveSpaceship: 6.
	self assert: aSpaceshipRed whereItIs  identicalTo: 6
]

{ #category : #tests }
BoardMovingSpaceshipsTest >> testC002BoardMovesTwoSpaceships [
| aSpaceshipRed aSpaceshipBlue aSpaceshipCollection aBoard|
	aSpaceshipRed := Spaceship putItOnThePosition: 0 withColor: 'red' withTurn: 1.
	aSpaceshipBlue := Spaceship putItOnThePosition: 0 withColor: 'blue' withTurn: 2.
	aSpaceshipCollection := OrderedCollection with: aSpaceshipRed with: aSpaceshipBlue.
	aBoard := Board withSizeOf: 10 and: aSpaceshipCollection.
	aBoard moveSpaceship: 6.
	aBoard moveSpaceship: 3.
	self assert: aSpaceshipBlue whereItIs identicalTo: 3
]
