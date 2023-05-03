Class {
	#name : #Board,
	#superclass : #Object,
	#instVars : [
		'players',
		'turn',
		'length'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
Board class >> with: aValue and: aCollectionOfSpaceships [
	(aValue <0 or: aValue==0) ifTrue: [Error signal: 'Cannot create a board with that value'].
	^(self new) initializeWithSizeOf:aValue and: aCollectionOfSpaceships.
]

{ #category : #Initialization }
Board >> initializeWithSizeOf:aValue and: aPlayersCollection [
	length:=aValue.
	players:=aPlayersCollection.
	turn:= 1.
]

{ #category : #Information }
Board >> length [
	^length.
]

{ #category : #Players }
Board >> movePlayer: aDiceCollection [

	self passTurn: aDiceCollection.
]

{ #category : #Players }
Board >> nextPlayer [
	^ (self players at: turn) color .
	 
]

{ #category : #Players }
Board >> passTurn: aDiceCollection [

	(self players at: turn) move: aDiceCollection.
	turn := turn == self players size
		        ifTrue: [ 1 ]
		        ifFalse: [ turn + 1 ]
]

{ #category : #Information }
Board >> players [
	^ players.
]
