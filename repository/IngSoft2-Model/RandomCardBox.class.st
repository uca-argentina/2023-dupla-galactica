Class {
	#name : #RandomCardBox,
	#superclass : #Object,
	#instVars : [
		'cardsProbabilities',
		'polarity'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'Instance creation' }
RandomCardBox class >> with: aCardsProbabilitiesCollection [

	(aCardsProbabilitiesCollection sum: #probability) = 100 ifFalse: [ 
		Error signal: 'The sum of probabilities must be 100' ].
	^ self new initializeWith: aCardsProbabilitiesCollection
]

{ #category : #Effect }
RandomCardBox >> changePolarity [

	polarity := polarity not
]

{ #category : #Effect }
RandomCardBox >> effect: aGame [

	polarity
		ifTrue: [ 
			aGame add: (Hand
					 of: aGame currentPlayer
					 with: ((Creator use: cardsProbabilities) create: 1)) ]
		ifFalse: [ 
		aGame addToOthers: ((Creator use: cardsProbabilities) create: 1) ]
]

{ #category : #Initialization }
RandomCardBox >> initializeWith: aCardsProbabilitiesCollection [

	cardsProbabilities := aCardsProbabilitiesCollection.
	polarity := true
]
