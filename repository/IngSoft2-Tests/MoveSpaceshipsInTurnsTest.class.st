Class {
	#name : #MoveSpaceshipsInTurnsTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
MoveSpaceshipsInTurnsTest >> testB001CreateSpaceshipWithTimeToTurn [
| aSpaceshipRed |
	aSpaceshipRed := Spaceship putItOnThePosition: 0 withColor: 'red' withTurn: 1.
	self assert: aSpaceshipRed timeToTurn identicalTo: 1
	

]
