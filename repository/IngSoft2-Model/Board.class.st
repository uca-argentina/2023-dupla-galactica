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

{ #category : #Players }
Board >> fartherPosition [

	| maxValue  |
	maxValue := 0.
	self players do: [ :spaceship | 
		maxValue := maxValue max: spaceship position ].
	^ maxValue.
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
Board >> moveAndCheck: aDiceCollection [

	(self players at: turn) moveOn: aDiceCollection.
	turn := turn == self players size
		        ifTrue: [ 1 ]
		        ifFalse: [ turn + 1 ]
]

{ #category : #Players }
Board >> movePlayer: aDiceCollection [

	self winnerExists ifFalse: [ self moveAndCheck: aDiceCollection ]
]

{ #category : #Information }
Board >> nextPlayer [
	^ (self players at: turn) color .
	 
]

{ #category : #Information }
Board >> players [
	^ players.
]

{ #category : #Players }
Board >> someoneMoves [

	 self players do: [ :spaceship | 
		spaceship nextTurn: self players size ]
]

{ #category : #Finalization }
Board >> winnerExists [

	^ self players anySatisfy: [ :spaceship | 
		  self winningCondition: spaceship ]
]

{ #category : #Finalization }
Board >> winningCondition: player [

	^ (player position > self length or:
		  player position == self length)
]
