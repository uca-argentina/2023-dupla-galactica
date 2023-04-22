Class {
	#name : #LoadedDie,
	#superclass : #Object,
	#instVars : [
		'faces'
	],
	#category : #'IngSoft2-Tests'
}

{ #category : #'instance creation' }
LoadedDie class >> with: aValue [

	^ self new initializeWith: aValue
]

{ #category : #information }
LoadedDie >> faces [

	^ faces.
]

{ #category : #initialization }
LoadedDie >> initializeWith: aValue [

	faces := aValue.
]
