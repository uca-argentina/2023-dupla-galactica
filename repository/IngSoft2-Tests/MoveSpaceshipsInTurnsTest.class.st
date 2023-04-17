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

{ #category : #tests }
MoveSpaceshipsInTurnsTest >> testB002CreateOtherSpaceshipWithOtherTimeToTurn [
| aSpaceshipRed aSpaceshipBlue |
	aSpaceshipRed := Spaceship putItOnThePosition: 0 withColor: 'red' withTurn: 1.
	aSpaceshipBlue := Spaceship putItOnThePosition: 0 withColor: 'blue' withTurn: 2.
	self assert: aSpaceshipBlue timeToTurn identicalTo: 2
]

{ #category : #tests }
MoveSpaceshipsInTurnsTest >> testB003PassATurnInAGameWithTwoSpaceships [
| aSpaceshipRed aSpaceshipBlue |
	aSpaceshipRed := Spaceship putItOnThePosition: 0 withColor: 'red' withTurn: 1.
	aSpaceshipBlue := Spaceship putItOnThePosition: 0 withColor: 'blue' withTurn: 2.
	aSpaceshipRed hasPassedATurn.
	aSpaceshipBlue hasPassedATurn.
	self assert: aSpaceshipBlue timeToTurn identicalTo: 1
]

{ #category : #tests }
MoveSpaceshipsInTurnsTest >> testB004PassATurnInAGameWithTwoSpaceshipsAndResetTimeToTurn [
| aSpaceshipRed aSpaceshipBlue aSpaceshipCollection aBoard |
	aSpaceshipRed := Spaceship putItOnThePosition: 0 withColor: 'red' withTurn: 1.
	aSpaceshipBlue := Spaceship putItOnThePosition: 0 withColor: 'blue' withTurn: 2.
	
	aSpaceshipCollection := OrderedCollection with: aSpaceshipRed with: aSpaceshipBlue.
	aBoard := Board withSizeOf: 10 and: aSpaceshipCollection.
	aBoard someoneMoves.
	self assert: aSpaceshipRed timeToTurn identicalTo: 2
]

{ #category : #tests }
MoveSpaceshipsInTurnsTest >> testB005PassATurnInAGameWithThreeSpaceshipsAndABoardWhichResetTimeToTurn [
| aSpaceshipRed aSpaceshipBlue aSpaceshipBlack aSpaceshipCollection aBoard |
	aSpaceshipRed := Spaceship putItOnThePosition: 0 withColor: 'red' withTurn: 1.
	aSpaceshipBlue := Spaceship putItOnThePosition: 0 withColor: 'blue' withTurn: 2.
	aSpaceshipBlack := Spaceship putItOnThePosition: 0 withColor: 'black' withTurn: 3.
	
	aSpaceshipCollection := OrderedCollection with: aSpaceshipRed with: aSpaceshipBlue with:aSpaceshipBlack.
	aBoard := Board withSizeOf: 10 and: aSpaceshipCollection.
	aBoard someoneMoves.
	self assert: aSpaceshipRed  timeToTurn identicalTo: 3
]
