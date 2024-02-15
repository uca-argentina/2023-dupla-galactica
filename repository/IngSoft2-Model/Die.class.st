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

{ #category : #Initialization }
Die >> initializeWith: aNumberOfFaces [

	faces := aNumberOfFaces
]

{ #category : #Information }
Die >> numberOfFaces [

	^ faces
]

{ #category : #Throw }
Die >> throw [

	^ faces atRandom
]
