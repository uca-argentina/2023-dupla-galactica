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
	|res|
	res:=0.
	(aValue<2) ifTrue: [Error signal: 'Cannot create with negative values at faces'].
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
