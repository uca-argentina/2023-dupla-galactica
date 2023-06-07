Class {
	#name : #Board,
	#superclass : #Object,
	#instVars : [
		'boxes',
		'lengthMeasure'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'Intance creation' }
Board class >> with: aBoxCollection measure: aLengthMeasure [

	aLengthMeasure nominalValue <= 0 ifTrue: [ 
		Error signal: 'Cannot create a game a negative parsec amount' ].
	aBoxCollection size < 4 ifTrue: [ 
		Error signal: 'Cannot create a board with that value' ].
	^ self new initializeWith: aBoxCollection measure: aLengthMeasure
]

{ #category : #Information }
Board >> boxes [

	^ boxes
]

{ #category : #BoxManager }
Board >> effectAt: aPlayerPosition In: aGame [

	(self boxes at: aPlayerPosition boxNumber) effect: aGame
]

{ #category : #Initialization }
Board >> initializeWith: aBoxCollection measure: aLengthMeasure [

	lengthMeasure := aLengthMeasure.
	boxes := aBoxCollection
]

{ #category : #Information }
Board >> lightYears [

	^ lengthMeasure lightYears
]

{ #category : #Information }
Board >> parsecs [

	^ lengthMeasure parsecs
]
