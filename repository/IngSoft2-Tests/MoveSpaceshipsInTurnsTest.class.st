Class {
	#name : #MoveSpaceshipsInTurnsTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
MoveSpaceshipsInTurnsTest >> testB001CreateSpaceshipWithTimeToTurn [
| aSpaceshipRed |
	aSpaceshipRed := Spaceship putOn: 0 with: 'red' and: 1.
	self assert: aSpaceshipRed turn identicalTo: 1
	

]

{ #category : #tests }
MoveSpaceshipsInTurnsTest >> testB002CreateOtherSpaceshipWithOtherTimeToTurn [
| aSpaceshipRed aSpaceshipBlue |
	aSpaceshipRed := Spaceship putOn: 0 with: 'red' and: 1.
	aSpaceshipBlue := Spaceship putOn: 0 with: 'blue' and: 2.
	self assert: aSpaceshipBlue turn identicalTo: 2
]

{ #category : #tests }
MoveSpaceshipsInTurnsTest >> testB003PassATurnInAGameWithTwoSpaceships [
| aSpaceshipRed aSpaceshipBlue |
	aSpaceshipRed := Spaceship putOn: 0 with: 'red' and: 1.
	aSpaceshipBlue := Spaceship putOn: 0 with: 'blue' and: 2.
	aSpaceshipRed someonePlays.
	aSpaceshipBlue someonePlays.
	self assert: aSpaceshipBlue turn identicalTo: 1
]

{ #category : #tests }
MoveSpaceshipsInTurnsTest >> testB004PassATurnInAGameWithTwoSpaceshipsAndResetTimeToTurn [
| aSpaceshipRed aSpaceshipBlue aSpaceshipCollection aBoard |
	aSpaceshipRed := Spaceship putOn: 0 with: 'red' and: 1.
	aSpaceshipBlue := Spaceship putOn: 0 with: 'blue' and: 2.
	
	aSpaceshipCollection := OrderedCollection with: aSpaceshipRed with: aSpaceshipBlue.
	aBoard := Board with: 10 and: aSpaceshipCollection.
	aBoard someoneMoves.
	self assert: aSpaceshipRed turn identicalTo: 2
]

{ #category : #tests }
MoveSpaceshipsInTurnsTest >> testB005PassATurnInAGameWithThreeSpaceships [
| aSpaceshipRed aSpaceshipBlue aSpaceshipBlack aSpaceshipCollection aBoard |
	aSpaceshipRed := Spaceship putOn: 0 with: 'red' and: 1.
	aSpaceshipBlue := Spaceship putOn: 0 with: 'blue' and: 2.
	aSpaceshipBlack := Spaceship putOn: 0 with: 'black' and: 3.
	
	aSpaceshipCollection := OrderedCollection with: aSpaceshipRed with: aSpaceshipBlue with:aSpaceshipBlack.
	aBoard := Board with: 10 and: aSpaceshipCollection.
	aBoard someoneMoves.
	self assert: aSpaceshipBlack turn identicalTo: 2
]

{ #category : #tests }
MoveSpaceshipsInTurnsTest >> testB006PassATurnInAGameWithThreeSpaceshipsAndABoardWhichResetTimeToTurn [
| aSpaceshipRed aSpaceshipBlue aSpaceshipBlack aSpaceshipCollection aBoard |
	aSpaceshipRed := Spaceship putOn: 0 with: 'red' and: 1.
	aSpaceshipBlue := Spaceship putOn: 0 with: 'blue' and: 2.
	aSpaceshipBlack := Spaceship putOn: 0 with: 'black' and: 3.
	
	aSpaceshipCollection := OrderedCollection with: aSpaceshipRed with: aSpaceshipBlue with:aSpaceshipBlack.
	aBoard := Board with: 10 and: aSpaceshipCollection.
	aBoard someoneMoves.
	self assert: aSpaceshipRed  turn identicalTo: 3
]
