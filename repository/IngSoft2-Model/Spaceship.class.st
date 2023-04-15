Class {
	#name : #Spaceship,
	#superclass : #Object,
	#instVars : [
		'position'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
Spaceship class >> putItOnTheBeginning [
	^(self new) initializePutItOnTheBeginning.
]

{ #category : #initialization }
Spaceship >> initializePutItOnTheBeginning [
	position:=0.
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
Spaceship >> whereItIs [
	^0.
]
