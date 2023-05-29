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
LoadedCardDealer >> dealCards: aPlayerCollection [

	| i k |
	i := 1.
	k := 1.
	cards do: [ :card | 
		(aPlayerCollection at: i) addCard: card.
		k := k + 1.
		k = 3 ifTrue: [ 
			k := 1.
			i := i + 1 ] ]
]

{ #category : #Initialization }
LoadedCardDealer >> initializeWith: aCardCollection [

	cards := aCardCollection
]
