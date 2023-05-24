Class {
	#name : #Board,
	#superclass : #Object,
	#instVars : [
		'length',
		'parsecs',
		'boxes'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'Intance creation' }
Board class >> with: aValue effects: aBoxCollection measure: aParsecAmount [

	aValue < 4 ifTrue: [ 
		Error signal: 'Cannot create a board with that value' ].
	^ self new
		  initializeWithSizeOf: aValue
		  effects: aBoxCollection
		  measure: aParsecAmount
]

{ #category : #Information }
Board >> boxes [

	^ boxes
]

{ #category : #BoxManager }
Board >> effect: aPlayer with: aGame [ 
	(self boxes at: aPlayer position) effect: aGame. 
]

{ #category : #Initialization }
Board >> initializeWithSizeOf: aValue effects: aBoxCollection measure: aParsecAmount [
	length := aValue.
	parsecs := aParsecAmount.
	boxes := aBoxCollection
]

{ #category : #Information }
Board >> length [

	^ length
]

{ #category : #Information }
Board >> parsecs [

	^ parsecs
]
