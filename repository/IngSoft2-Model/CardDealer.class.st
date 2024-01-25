Class {
	#name : #CardDealer,
	#superclass : #Object,
	#instVars : [
		'cardsProbabilitiesToDeal'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'Instance creation' }
CardDealer class >> with: aCardCollection [ 
	^ self new intializeWith: aCardCollection.
]

{ #category : #Cards }
CardDealer >> dealCards: aCardManager to: aColorsCollection [

	| randomCardGenerator |
	randomCardGenerator := RandomCardGenerator dealing: cardsProbabilitiesToDeal.

	aColorsCollection do: [ :color | 
		aCardManager addCard: (randomCardGenerator createCardFor: color).
		aCardManager addCard: (randomCardGenerator createCardFor: color) ]
]

{ #category : #Initialization }
CardDealer >> intializeWith: aCardProbabilityCollection [ 
	cardsProbabilitiesToDeal:= aCardProbabilityCollection.
]
