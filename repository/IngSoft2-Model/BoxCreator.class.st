Class {
	#name : #BoxCreator,
	#superclass : #Object,
	#instVars : [
		'boxesProbabilities'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'Instance creation' }
BoxCreator class >> use: aBoxesProbabilitiesCollection [

	(aBoxesProbabilitiesCollection sum: #probability) = 100 ifFalse: [ 
		Error signal: 'The sum of probabilities must be 100' ].
	^ self new initializeUse: aBoxesProbabilitiesCollection
]

{ #category : #Creation }
BoxCreator >> create: aNumberOfBoxes [

	^ (1 to: aNumberOfBoxes) collect: [ :eachNumber | self oneRandomBox ]
]

{ #category : #Initialization }
BoxCreator >> initializeUse: aBoxesProbabilitiesCollection [

	boxesProbabilities := aBoxesProbabilitiesCollection
]

{ #category : #Creation }
BoxCreator >> oneRandomBox [

	| sum |
	sum := 0.
	^ (boxesProbabilities detect: [ :box | 
		   (sum := sum + box probability) >= 100 atRandom ]) boxClass
		  
]
