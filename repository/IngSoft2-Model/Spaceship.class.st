Class {
	#name : #Spaceship,
	#superclass : #Object,
	#instVars : [
		'position',
		'color'
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

{ #category : #initialization }
Spaceship >> initializePutItOnTheBeginning [
	position:=0.
]

{ #category : #initialization }
Spaceship >> initializePutItOnThePosition: aPosition withColor: aColor [
	position:=0.
	color:=aColor.
]

{ #category : #creation }
Spaceship >> isCreatedSuccessfully [
	^true.
]

{ #category : #position }
Spaceship >> moveOn: aValue [ 
	position := position + aValue.
]

{ #category : #information }
Spaceship >> spaceshipColor [
	^color.
]

{ #category : #position }
Spaceship >> whereItIs [
	^position.
]
