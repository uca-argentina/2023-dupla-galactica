Class {
	#name : #MoveSpaceshipFromTheBoardTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
MoveSpaceshipFromTheBoardTest >> testCreateBoard [
	| aBoard |
	aBoard := Board new.
	self assert: (aBoard isCreatedSuccessfully).
]

{ #category : #tests }
MoveSpaceshipFromTheBoardTest >> testCreateSpaceship [
	| aSpaceship |
	aSpaceship := Spaceship new.
	self assert: (aSpaceship isCreatedSuccessfully).
]
