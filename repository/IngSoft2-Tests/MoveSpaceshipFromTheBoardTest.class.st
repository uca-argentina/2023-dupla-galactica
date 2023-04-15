Class {
	#name : #MoveSpaceshipFromTheBoardTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
MoveSpaceshipFromTheBoardTest >> testA001CreateBoard [
	| aBoard |
	aBoard := Board new.
	self assert: (aBoard isCreatedSuccessfully).
]

{ #category : #tests }
MoveSpaceshipFromTheBoardTest >> testA002CreateSpaceship [
	| aSpaceship |
	aSpaceship := Spaceship new.
	self assert: (aSpaceship isCreatedSuccessfully).
]
