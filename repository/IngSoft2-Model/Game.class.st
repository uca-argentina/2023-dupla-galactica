Class {
	#name : #Game,
	#superclass : #Object,
	#instVars : [
		'board',
		'die'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
Game class >> with: aSpaceshipCollection and: aSize [ 
	^(self new) initializeWith: aSpaceshipCollection and: aSize.
]

{ #category : #'instance creation' }
Game class >> with: aSpaceshipCollection and: aValue throwing: aDie [ 
	^self new initializeWith: aSpaceshipCollection and: aValue throwing: aDie.
]

{ #category : #finalization }
Game >> finalMessage [
	^(board finalPositions).
]

{ #category : #initialization }
Game >> initializeWith: aSpaceshipCollection and: aSize [ 
	board:= Board with: aSize  and: aSpaceshipCollection.
]

{ #category : #initialization }
Game >> initializeWith: aSpaceshipCollection and: aValue throwing: aDie [

	board := Board with: aValue and: aSpaceshipCollection.
	die := aDie
]

{ #category : #player }
Game >> moveNextPlayer [

	^(board moveSpaceship: die throw)
]

{ #category : #player }
Game >> movePlayer: aValue [ 
	board moveSpaceship: aValue.
]

{ #category : #player }
Game >> nextPlayer [
	^(board nextPlayer).
]

{ #category : #finalization }
Game >> winner [
	^(board winner).
]
