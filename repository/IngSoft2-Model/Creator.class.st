Class {
	#name : #Creator,
	#superclass : #Object,
	#instVars : [
		'objects'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'Instance creation' }
Creator class >> use: anObjectProbabilitiesCollection [

	(anObjectProbabilitiesCollection sum: #probability) = 100 ifFalse: [ 
		Error signal: 'The sum of probabilities must be 100' ].
	^ self new initializeUse: anObjectProbabilitiesCollection
]

{ #category : #Creation }
Creator >> create: aNumberOfObjects [

	| anObjectCollection |
	anObjectCollection := OrderedCollection new.
	aNumberOfObjects timesRepeat: [ 
		anObjectCollection addLast: self oneRandomObject ].
	^ anObjectCollection
]

{ #category : #Initialization }
Creator >> initializeUse: anObjectProbabilityCollection [

	objects := anObjectProbabilityCollection
]

{ #category : #Creation }
Creator >> oneRandomObject [

	| sum |
	sum := 0.
	^ (objects detect: [ :object | 
		   sum := sum + object probability.
		   100 atRandom <= sum ]) object deepCopy
]
