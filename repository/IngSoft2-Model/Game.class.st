Class {
	#name : #Game,
	#superclass : #Object,
	#instVars : [
		'diceCollection',
		'boardAtBox'
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

{ #category : #information }
Game >> board [

	^ boardAtBox
]

{ #category : #information }
Game >> dice [
	^(diceCollection).
]

{ #category : #finalization }
Game >> finalMessage [
	^(self board finalPositions).
]

{ #category : #initialization }
Game >> initializeWith: aSpaceshipCollection and: aSize [ 
	boardAtBox:= Board with: aSize  and: aSpaceshipCollection.
]

{ #category : #initialization }
Game >> initializeWith: aSpaceshipCollection and: aValue throwing: aDiceCollection [

	boardAtBox := Board with: aValue and: aSpaceshipCollection.
	diceCollection := aDiceCollection.
]

{ #category : #player }
Game >> moveNextPlayer [
	|value|
	value:=0.
	self dice do: [:die| value:= value+ (die throw)].
	(self board moveSpaceship: value)
]

{ #category : #player }
Game >> movePlayer: aValue [ 
	self board moveSpaceship: aValue.
]

{ #category : #player }
Game >> nextPlayer [
	^(self board nextPlayer).
]

{ #category : #finalization }
Game >> winner [
	^(self board winner).
]
