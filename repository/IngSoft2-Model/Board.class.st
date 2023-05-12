Class {
	#name : #Board,
	#superclass : #Object,
	#instVars : [
		'players',
		'turn',
		'length',
		'parsecs',
		'boxes'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
Board class >> with: aValue and: aCollectionOfSpaceships effects: aBoxCollection [
	(aValue <0 or: aValue==0) ifTrue: [Error signal: 'Cannot create a board with that value'].
	^(self new) initializeWithSizeOf:aValue and: aCollectionOfSpaceships effects: aBoxCollection .
]

{ #category : #Players }
Board >> changeTurn [

	turn := turn == self players size
		        ifTrue: [ 1 ]
		        ifFalse: [ turn + 1 ]
]

{ #category : #Initialization }
Board >> initializeWithSizeOf: aValue and: aPlayersCollection effects: aBoxCollection [ 
	length:=aValue.
	players:=aPlayersCollection.
	turn:= 1.
	parsecs:=100.
	boxes:= aBoxCollection.
]

{ #category : #Information }
Board >> length [
	^length.
]

{ #category : #Players }
Board >> movePlayer: aDiceCollection [

	self passTurn: aDiceCollection.
]

{ #category : #Information }
Board >> nextOne [
	^turn.
]

{ #category : #Players }
Board >> nextPlayer [
	^ (self players at: turn) color .
	 
]

{ #category : #Information }
Board >> parsecsAmount [
	^parsecs.
]

{ #category : #Players }
Board >> passTurn: aDiceCollection [

	(self players at: turn) move: aDiceCollection.
	(self players at: turn) updateLap: (self length).
	(boxes at: ((self players at: turn) position)) effect: self. 
	(self players at: turn) updateLap: (self length).
	self changeTurn.
]

{ #category : #Initialization }
Board >> players [
	^ players.
]
