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

{ #category : #Information }
Game >> board [

	^ boardAtBox
]

{ #category : #Information }
Game >> dice [
	^(diceCollection).
]

{ #category : #Finalization }
Game >> finalMessage [
	^(self board finalPositions).
]

{ #category : #Initialization }
Game >> initializeWith: aSpaceshipCollection and: aSize [ 
	boardAtBox:= Board with: aSize  and: aSpaceshipCollection.
]

{ #category : #Initialization }
Game >> initializeWith: aSpaceshipCollection and: aValue throwing: aDiceCollection [

	boardAtBox := Board with: aValue and: aSpaceshipCollection.
	diceCollection := aDiceCollection.
]

{ #category : #Player }
Game >> moveNextPlayer [
	
	(self board movePlayer: self dice)
]

{ #category : #Player }
Game >> movePlayer: aValue [

	| aLoadedDie |
	aLoadedDie := LoadedDie with: (OrderedCollection with: aValue).
	self board movePlayer: (OrderedCollection with: aLoadedDie)
]

{ #category : #Player }
Game >> nextPlayer [
	^(self board nextPlayer).
]

{ #category : #Finalization }
Game >> winner [
	^(self board winner).
]
