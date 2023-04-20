Class {
	#name : #Game,
	#superclass : #Object,
	#instVars : [
		'board'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
Game class >> with: aSpaceshipCollection and: aSize [ 
	^(self new) initializeWith: aSpaceshipCollection and: aSize.
]

{ #category : #initialization }
Game >> initializeWith: aSpaceshipCollection and: aSize [ 
	board:= Board with: aSize  and: aSpaceshipCollection.
]

{ #category : #player }
Game >> movePlayer: aValue [ 
	board moveSpaceship: aValue.
]

{ #category : #player }
Game >> nextPlayer [
	^(board nextPlayer).
]

{ #category : #winner }
Game >> winner [
	^(board winner).
]
