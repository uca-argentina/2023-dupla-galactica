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

	| res |
	res := false.
	cards do: [ :card | 
		cardsInPosetion do: [ :addedCard | 
			addedCard toString = card toString ifTrue: [ 
				addedCard addOwner: (card owners at: 1).
				res := true ] ].
		res ifFalse: [ cardsInPosetion addLast: card ].
		res := false ]
]

{ #category : #Initialization }
LoadedCardDealer >> initializeWith: aCardCollection [

	cards := aCardCollection
]
