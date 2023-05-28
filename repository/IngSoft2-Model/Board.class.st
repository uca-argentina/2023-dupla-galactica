Class {
	#name : #Board,
	#superclass : #Object,
	#instVars : [
		'parsecs',
		'boxes'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'Intance creation' }
Board class >> with: aValue effects: aBoxCollection measure: aParsecAmount [
	(aParsecAmount) <= 0 ifTrue: [ 
		Error signal: 'Cannot create a game a negative parsec amount' ].
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
Board >> effectAt: aPlayerPosition In: aGame [

	(self boxes at: aPlayerPosition) effect: aGame
]

{ #category : #Initialization }
Board >> initializeWithSizeOf: aValue effects: aBoxCollection measure: aParsecAmount [

	"length := aValue."
	parsecs := aParsecAmount.
	boxes := aBoxCollection
]

{ #category : #Information }
Board >> parsecs [

	^ parsecs
]
