Class {
	#name : #ObjectCreator,
	#superclass : #Object,
	#instVars : [
		'objectsProbabilities'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'Instance creation' }
ObjectCreator class >> use: anObjectProbabilitiesCollection [

	(anObjectProbabilitiesCollection sum: #probability) = 100 ifFalse: [ 
		Error signal: 'The sum of probabilities must be 100' ].
	^ self new initializeUse: anObjectProbabilitiesCollection
]

{ #category : #Creation }
ObjectCreator >> create: aNumberOfObjects [

	| anObjectCollection |
	anObjectCollection := OrderedCollection new.
	aNumberOfObjects timesRepeat: [ 
		anObjectCollection addLast: self oneRandomObject ].
	^ anObjectCollection
]

{ #category : #Initialization }
ObjectCreator >> initializeUse: anObjectProbabilitiesCollection [

	objectsProbabilities := anObjectProbabilitiesCollection
]

{ #category : #Creation }
ObjectCreator >> oneRandomObject [

	| sum |
	sum := 0.
	^ (objectsProbabilities detect: [ :object | 
		   sum := sum + object probability.
		   100 atRandom <= sum ]) object deepCopy
]
