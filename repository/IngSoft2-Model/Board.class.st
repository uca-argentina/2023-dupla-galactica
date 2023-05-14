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
	(aValue <=0) ifTrue: [Error signal: 'Cannot create a board with that value'].
	^(self new) initializeWithSizeOf:aValue and: aCollectionOfSpaceships effects: aBoxCollection .
]

{ #category : #Information }
Board >> boxes [

	^ boxes
]

{ #category : #Initialization }
Board >> initializeWithSizeOf: aValue and: aPlayersCollection effects: aBoxCollection [

	length := aValue.
	players := aPlayersCollection.
	turn := 1.
	parsecs := 100.
	boxes := aBoxCollection
]

{ #category : #Information }
Board >> length [

	^ length
]

{ #category : #ManageTurns }
Board >> movePlayer: aDiceCollection [

	self passTurn: aDiceCollection.
	self updateTurn
]

{ #category : #Information }
Board >> nextOne [

	^ players at: turn.
]

{ #category : #Information }
Board >> parsecs [

	^ parsecs
]

{ #category : #ManageTurns }
Board >> passTurn: aDiceCollection [

	self nextOne move: aDiceCollection.
	self nextOne updateLap: self length.
	(self boxes at: (self nextOne spaceship position)) effect: self.
	self nextOne updateLap: self length.
]

{ #category : #Information }
Board >> players [
	^ players
]

{ #category : #ManageTurns }
Board >> updateTurn [

	turn := turn == players size
		        ifTrue: [ 1 ]
		        ifFalse: [ turn + 1 ]
]
