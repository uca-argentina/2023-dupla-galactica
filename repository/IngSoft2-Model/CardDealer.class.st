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

	(aCardCollection sum: [ :cardProbability | 
		 cardProbability probability ]) = 100 ifFalse: [ 
		Error signal: 'The sum of probabilities must be 100' ].
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
