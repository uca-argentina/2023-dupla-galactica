Class {
	#name : #Board,
	#superclass : #Object,
	#instVars : [
		'sizeOfBoard',
		'players'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
Board class >> size: aSize [ 
	^(self new) initializeWithSizeOf: aSize.
]

{ #category : #'instance creation' }
Board class >> with: aSpaceship [ 
	^(self new) initializeWith: aSpaceship.
]

{ #category : #'instance creation' }
Board class >> with: aValue and: aCollectionOfSpaceships [ 
	^((self new) initializeWithSizeOf:aValue) initializeWith: aCollectionOfSpaceships.
]

{ #category : #Players }
Board >> fartherPosition [

	| maxValue  |
	maxValue := 0.
	self players do: [ :spaceship | 
		maxValue := maxValue max: spaceship position ].
	^ maxValue.
]

{ #category : #Finalization }
Board >> finalMessage [

	| color position message |
	message := ''.
	self players do: [ :spaceship | 
		color := spaceship color.
		position := spaceship position.
		message:= message, color, ':', position asString, ' '].
	^ message
]

{ #category : #Finalization }
Board >> finalPositions [

	self winnerExists
		ifTrue: [ ^ self finalMessage ]
		ifFalse: [ ^ 'the game has not finished yet' ]
]

{ #category : #Initialization }
Board >> initializeWith: aSpaceship [ 
	players:=aSpaceship.
]

{ #category : #Initialization }
Board >> initializeWithSizeOf: aSize [ 
	sizeOfBoard:=aSize.
]

{ #category : #Players }
Board >> moveAndCheck: aDiceCollection [

	(self players detect: [ :spaceship | spaceship turn == 1 ]) 
		moveOn: aDiceCollection.
	self someoneMoves
]

{ #category : #Players }
Board >> movePlayer: aDiceCollection [

	self winnerExists ifFalse: [ self moveAndCheck: aDiceCollection ]
]

{ #category : #Players }
Board >> movePlayerTo: aValue [

	self winnerExists ifTrue: [ ^ self ].
	(self players detect: [ :spaceship | spaceship turn == 1 ]) 
		moveOnValue: aValue.
	self someoneMoves
]

{ #category : #Information }
Board >> nextPlayer [
	^ (self players detect: [:spaceship | (spaceship turn == 1)]) color .
	 
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
Board >> winner [

	self winnerExists
		ifTrue: [ 
			^ (self players detect: [ :spaceship | 
				   self winningCondition: spaceship ]) color ]
		ifFalse: [ ^ 'Nobody' ]
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
