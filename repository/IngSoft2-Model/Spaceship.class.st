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
Spaceship class >> putOn: aPosition with: aColor [
	^(self new) initializePutItOnThePosition: aPosition withColor: aColor.
]

{ #category : #'instance creation' }
Spaceship class >> putOn: aPosition with: aColor and: aTurn [ 
	^(self new) initializePutItOnThePosition: aPosition withColor: aColor withTurn:aTurn.
]

{ #category : #information }
Spaceship >> color [
	^color.
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

{ #category : #initialization }
Spaceship >> isCreatedSuccessfully [
	^true.
]

{ #category : #turn }
Spaceship >> moveOn: aDiceCollection [

	| value |
	value := 0.
	aDiceCollection do: [ :die | value := value + die throw ].
	position := position + value
]

{ #category : #turn }
Spaceship >> moveOnValue: aNumber [

	position := position + aNumber
]

{ #category : #turn }
Spaceship >> nextTurn: amountOfSpaceships [
	self someonePlays.
	self verifyTurn: amountOfSpaceships.
]

{ #category : #information }
Spaceship >> position [
	^position.
]

{ #category : #turn }
Spaceship >> someonePlays [
	turn:=turn-1.
]

{ #category : #information }
Spaceship >> turn [
	^turn
]

{ #category : #turn }
Spaceship >> verifyTurn: numberOfSpaceshipsOnBoard [
	self turn==0 ifTrue: [ turn := numberOfSpaceshipsOnBoard  ]
]
