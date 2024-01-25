Class {
	#name : #RandomCardBox,
	#superclass : #Object,
	#instVars : [
		'cards'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'Instance creation' }
RandomCardBox class >> withCards: cardsProbabilities [ 

	(cardsProbabilities sum: [ :cardProbability | 
		 cardProbability probability ]) = 100 ifFalse: [ 
		Error signal: 'The sum of probabilities must be 100' ].
	^ self new intializeUsing: cardsProbabilities.
]

{ #category : #Effect }
RandomCardBox >> effect: aGame [

	| randomCardGenerator  |
	
	randomCardGenerator := RandomCardGenerator dealing: cards.
	aGame addCard: (randomCardGenerator
			 createCardFor: aGame currentPlayer)
]

{ #category : #Initialization }
RandomCardBox >> intializeUsing: aCardsProbabilitiesCollection [

	cards := aCardsProbabilitiesCollection
]
