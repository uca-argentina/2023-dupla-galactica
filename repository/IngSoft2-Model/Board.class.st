Class {
	#name : #Board,
	#superclass : #Object,
	#instVars : [
		'sizeOfBoard',
		'players',
		'turn'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
Board class >> with: aValue and: aCollectionOfSpaceships [ 
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
Board >> initializeWithSizeOf:aValue and: aCollectionOfSpaceships [
	sizeOfBoard:=aValue.
	players:=aCollectionOfSpaceships.
	turn:= 1.
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

{ #category : #Information }
Board >> sizeIs [
	^sizeOfBoard.
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
Board >> winningCondition: spaceship [

	^ (spaceship position > self sizeIs or:
		  spaceship position == self sizeIs)
]
