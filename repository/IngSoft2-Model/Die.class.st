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

{ #category : #information }
Die >> faces [
	^ faces.
]

{ #category : #initialization }
Die >> initializeWith: aValue [

	faces := aValue
]

{ #category : #initialization }
Die >> isCreatedSuccessfully [
	^true.
]
