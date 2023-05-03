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
Spaceship class >> with: aColor and: aTurn [ 
	^(self new) initializeWith: aColor and: aTurn.
]

{ #category : #Information }
Spaceship >> color [
	^color.
]

{ #category : #Initialization }
Spaceship >> initializeWith: aColor and: aTurn [
	position:=0.
	color:=aColor.
	turn:=aTurn.
]

{ #category : #Turn }
Spaceship >> moveOn: aDiceCollection [

	| value |
	value := 0.
	aDiceCollection do: [ :die | value := value + die throw ].
	position := position + value
]

{ #category : #Turn }
Spaceship >> moveOnValue: aNumber [

	position := position + aNumber
]

{ #category : #Turn }
Spaceship >> nextTurn: amountOfSpaceships [
	self someonePlays.
	self verifyTurn: amountOfSpaceships.
]

{ #category : #Information }
Spaceship >> position [
	^position.
]

{ #category : #Turn }
Spaceship >> someonePlays [
	turn:=turn-1.
]

{ #category : #Information }
Spaceship >> turn [
	^turn
]

{ #category : #Turn }
Spaceship >> verifyTurn: numberOfSpaceshipsOnBoard [
	self turn==0 ifTrue: [ turn := numberOfSpaceshipsOnBoard  ]
]
