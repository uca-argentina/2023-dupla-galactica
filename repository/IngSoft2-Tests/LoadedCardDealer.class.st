Class {
	#name : #LoadedCardDealer,
	#superclass : #Object,
	#instVars : [
		'cards'
	],
	#category : #'IngSoft2-Tests'
}

{ #category : #'Instance creation' }
LoadedCardDealer class >> with: aCardCollection [ 
	^(self new) initializeWith: aCardCollection.
]

{ #category : #Cards }
LoadedCardDealer >> dealCards: cardsInPosetion to: aColorsCollection [

	cards do: [ :card | cardsInPosetion addLast: card ]
]

{ #category : #Initialization }
LoadedCardDealer >> initializeWith: aCardCollection [

	cards := aCardCollection
]
