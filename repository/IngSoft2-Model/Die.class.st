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
