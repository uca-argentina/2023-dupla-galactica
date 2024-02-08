Class {
	#name : #CardDealer,
	#superclass : #Object,
	#instVars : [
		'cardsProbabilitiesToDeal'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'Instance creation' }
CardDealer class >> with: aCardsProbabilitiesCollection [

	(aCardsProbabilitiesCollection sum: #probability) = 100 ifFalse: [ 
		Error signal: 'The sum of probabilities must be 100' ].
	^ self new intializeWith: aCardsProbabilitiesCollection
]

{ #category : #Cards }
CardDealer >> dealCards: aCardManager to: aColorsCollection [

	aColorsCollection do: [ :color | 
		2 timesRepeat: [ 
			aCardManager add:
				((RandomCardGenerator dealing: cardsProbabilitiesToDeal) 
					 createCardFor: color) ] ]
]

{ #category : #Initialization }
CardDealer >> intializeWith: aCardsProbabilitiesCollection [

	cardsProbabilitiesToDeal := aCardsProbabilitiesCollection
]
