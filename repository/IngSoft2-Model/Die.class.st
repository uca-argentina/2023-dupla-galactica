Class {
	#name : #Die,
	#superclass : #Object,
	#instVars : [
		'faces'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'Instance creation' }
Die class >> with: aNumberOfFaces [

	aNumberOfFaces < 3 ifTrue: [ 
		Error signal:
			'Cannot create with negative values at faces or less than 2 faces' ].
	^ self new initializeWith: aNumberOfFaces
]

{ #category : #Information }
Die >> faces [

	^ faces
]

{ #category : #Initialization }
Die >> initializeWith: aNumberOfFaces [

	faces := aNumberOfFaces
]

{ #category : #Throw }
Die >> throw [

	^ faces atRandom
]
