Class {
	#name : #RandomCardGenerator,
	#superclass : #Object,
	#instVars : [
		'cardsProbabilities'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'Instance creation' }
RandomCardGenerator class >> dealing: aCardsProbabilitiesCollection [

	^ self new initializeCards: aCardsProbabilitiesCollection
]

{ #category : #'Card creation' }
RandomCardGenerator >> createCardFor: aPlayerColor [

	| selectedCard aRandomValue sum |
	sum := 0.
	aRandomValue := 100 atRandom.
	selectedCard := (cardsProbabilities detect: [ :card | 
		   sum := sum + card probability.
		   aRandomValue <= sum ]) cardClass.
	^ selectedCard holder: aPlayerColor.
]

{ #category : #Initialization }
RandomCardGenerator >> initializeCards: aCardsProbabilitiesCollection [

	cardsProbabilities := aCardsProbabilitiesCollection
]
