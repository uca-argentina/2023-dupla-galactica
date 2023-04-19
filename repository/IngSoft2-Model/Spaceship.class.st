Class {
	#name : #Spaceship,
	#superclass : #Object,
	#instVars : [
		'position',
		'color',
		'turn'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
Spaceship class >> putItOnTheBeginning [
	^(self new) initializePutItOnTheBeginning.
]

{ #category : #'instance creation' }
Spaceship class >> putItOnThePosition: aPosition withColor: aColor [
	^(self new) initializePutItOnThePosition: aPosition withColor: aColor.
]

{ #category : #'instance creation' }
Spaceship class >> putItOnThePosition: aPosition withColor: aColor withTurn: aTurn [ 
	^(self new) initializePutItOnThePosition: aPosition withColor: aColor withTurn:aTurn.
]

{ #category : #turn }
Spaceship >> hasPassedATurn [
	turn:=turn-1.
]

{ #category : #initialization }
Spaceship >> initializePutItOnTheBeginning [
	position:=0.
]

{ #category : #initialization }
Spaceship >> initializePutItOnThePosition: aPosition withColor: aColor [
	position:=aPosition.
	color:=aColor.
]

{ #category : #initialization }
Spaceship >> initializePutItOnThePosition: aPosition withColor: aColor withTurn: aTurn [
	position:=aPosition.
	color:=aColor.
	turn:=aTurn.
]

{ #category : #creation }
Spaceship >> isCreatedSuccessfully [
	^true.
]

{ #category : #position }
Spaceship >> moveOn: aValue [ 
	position := position + aValue.
]

{ #category : #position }
Spaceship >> position [
	^position.
]

{ #category : #information }
Spaceship >> spaceshipColor [
	^color.
]

{ #category : #information }
Spaceship >> timeToTurn [
	^turn
]

{ #category : #turn }
Spaceship >> verifyTurn: numberOfSpaceshipsOnBoard [
	turn=0 ifTrue: [ turn := numberOfSpaceshipsOnBoard  ]
]

{ #category : #turn }
Spaceship >> whichTurn [
	^turn
]
