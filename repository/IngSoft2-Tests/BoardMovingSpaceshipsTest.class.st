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
