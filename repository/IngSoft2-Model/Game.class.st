Class {
	#name : #Game,
	#superclass : #Object,
	#instVars : [
		'spaceships',
		'board'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
Game class >> with: spaceshipsColors [
	^(self new) initializeWith: spaceshipsColors.
]

{ #category : #'instance creation' }
Game class >> with: aSpaceshipCollection and: aSize [ 
	^(self new) initializeWith: aSpaceshipCollection and: aSize.
]

{ #category : #winner }
Game >> finalMessage [
	^(board finalPositionOfSpaceShips).
]

{ #category : #initialization }
Game >> initializeWith: spaceshipsInstance [
	spaceships:= spaceshipsInstance.
]

{ #category : #initialization }
Game >> initializeWith: aSpaceshipCollection and: aSize [ 
	board:= Board with: aSize  and: aSpaceshipCollection.
]

{ #category : #move }
Game >> movePlayer: aValue [ 
	board moveSpaceship: aValue.
]

{ #category : #turns }
Game >> nextPlayer [
	^(board nextPlayer).
]

{ #category : #winner }
Game >> winner [
	^(board winner).
]
