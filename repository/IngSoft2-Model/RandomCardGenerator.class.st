Class {
	#name : #RandomCardGenerator,
	#superclass : #Object,
	#instVars : [
		'cards'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'Instance creation' }
RandomCardGenerator class >> dealing: aCollection [ 
	^ self new initializeCards: aCollection.
]

{ #category : #'Card creation' }
RandomCardGenerator >> createCard: idValue for: aPlayerColor [

	|value selectedClass |
	
	value := cards size atRandom.

	selectedClass := cards  detect: [ :class | 
		                 value <= (cards  indexOf: class) ].

	^ selectedClass owner: aPlayerColor number: idValue
]

{ #category : #Initialization }
RandomCardGenerator >> initializeCards: aCollection [ 
	cards:= aCollection.
]
