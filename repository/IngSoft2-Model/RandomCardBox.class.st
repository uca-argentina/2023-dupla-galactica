Class {
	#name : #RandomCardBox,
	#superclass : #Object,
	#instVars : [
		'cardsProbabilities'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'Instance creation' }
RandomCardBox class >> with: aCardsProbabilitiesCollection [

	(aCardsProbabilitiesCollection sum: #probability) = 100 ifFalse: [ 
		Error signal: 'The sum of probabilities must be 100' ].
	^ self new intializeUsing: aCardsProbabilitiesCollection
]

{ #category : #Effect }
RandomCardBox >> effect: aGame [

	aGame add: (Hand
			 of: aGame currentPlayer
			 with: ((Creator use: cardsProbabilities) create: 1))
]

{ #category : #Initialization }
RandomCardBox >> intializeUsing: aCardsProbabilitiesCollection [

	cardsProbabilities := aCardsProbabilitiesCollection
]
