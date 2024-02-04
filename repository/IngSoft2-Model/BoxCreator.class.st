Class {
	#name : #BoxCreator,
	#superclass : #Object,
	#instVars : [
		'boxes',
		'probabilities'
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

	^ (1 to: aNumberOfBoxes) collect: [ :eachNumber | 
		  self oneRandomBoxOf ]
]

{ #category : #Initialization }
BoxCreator >> initializeUse: aBoxesProbabilitiesCollection [

	boxes := aBoxesProbabilitiesCollection
]

{ #category : #Creation }
BoxCreator >> oneRandomBoxOf [

	| sum |
	sum := 0.
	^ (boxes detect: [ :box | 
		   (sum := sum + box probability) >= 100 atRandom ]) box
]
