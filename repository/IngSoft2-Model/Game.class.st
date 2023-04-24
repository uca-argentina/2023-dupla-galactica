Class {
	#name : #Game,
	#superclass : #Object,
	#instVars : [
		'board',
		'diceCollection'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
Game class >> with: aSpaceshipCollection and: aSize [ 
	^(self new) initializeWith: aSpaceshipCollection and: aSize.
]

{ #category : #'instance creation' }
Game class >> with: aSpaceshipCollection and: aValue throwing: aDiceCollection [ 
	^self new initializeWith: aSpaceshipCollection and: aValue throwing: aDiceCollection.
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
Game >> initializeWith: aSpaceshipCollection and: aValue throwing: aDiceCollection [

	board := Board with: aValue and: aSpaceshipCollection.
	diceCollection := aDiceCollection.
]

{ #category : #player }
Game >> moveNextPlayer [
	|value|
	value:=0.
	diceCollection do: [:die| value:= value+ (die throw)].
	(board moveSpaceship: value)
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
