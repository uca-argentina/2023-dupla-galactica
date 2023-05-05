Class {
	#name : #Die,
	#superclass : #Object,
	#instVars : [
		'faces'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
Die class >> with: aValue [
	(aValue<3) ifTrue: [Error signal: 'Cannot create with negative values at faces or less than 2 faces'].
	^ self new initializeWith: aValue
]

{ #category : #Information }
Die >> faces [
	^ faces.
]

{ #category : #Initialization }
Die >> initializeWith: aValue [

	faces := aValue
]

{ #category : #Throw }
Die >> throw [
	^ faces atRandom.
]
