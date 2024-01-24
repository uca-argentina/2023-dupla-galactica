Class {
	#name : #CardDealer,
	#superclass : #Object,
	#instVars : [
		'cardsToDeal'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'Instance creation' }
CardDealer class >> with: aCardCollection [ 
	^ self new intializeWith: aCardCollection.
]

{ #category : #Cards }
CardDealer >> dealCards: aCardManager to: aColorsCollection [

	| idValue randomCardGenerator|
	randomCardGenerator := RandomCardGenerator dealing: cardsToDeal.
	idValue := 1.
	aColorsCollection do: [ :color | 
		aCardManager addCard:
			(randomCardGenerator createCard: idValue for: color).
		idValue := idValue + 1.
		aCardManager addCard:
			(randomCardGenerator createCard: idValue for: color).
		idValue := idValue + 1 ]
]

{ #category : #Initialization }
CardDealer >> intializeWith: aCollection [ 
	cardsToDeal:= aCollection.
]
