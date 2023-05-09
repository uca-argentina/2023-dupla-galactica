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
Board class >> with: aValue and: aCollectionOfSpaceships [
	(aValue <0 or: aValue==0) ifTrue: [Error signal: 'Cannot create a board with that value'].
	^(self new) initializeWithSizeOf:aValue and: aCollectionOfSpaceships.
]

{ #category : #Players }
Board >> changeTurn [

	turn := turn == self players size
		        ifTrue: [ 1 ]
		        ifFalse: [ turn + 1 ]
]

{ #category : #Initialization }
Board >> initializeWithSizeOf:aValue and: aPlayersCollection [
	length:=aValue.
	players:=aPlayersCollection.
	turn:= 1.
	parsecs:=100.
	boxes:= (OrderedCollection with:(NoEffectBox new) with:(SpeedUpBox new) with:(WormHoleBox new) with:(NoEffectBox new) with:(MoonWalkBox with: -2) with:(HyperJumpBox with: (OrderedCollection with: 40 with:20))).
	boxes addLast: (AtomicBombBox new).
	boxes addLast:(NoEffectBox new).
	boxes addLast:(NoEffectBox new).
	boxes addLast: (NoEffectBox new).
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

{ #category : #Information }
Board >> parsecsAmount [
	^parsecs.
]

{ #category : #Players }
Board >> passTurn: aDiceCollection [

	(self players at: turn) move: aDiceCollection.
	(self players at: turn) updateLap: (self length).
	(boxes at: ((self players at: turn) position)) effect: (self players) affects: (self players at: turn) parsecs: 100. 
	self changeTurn.
]

{ #category : #Initialization }
Board >> players [
	^ players.
]
