Class {
	#name : #Board,
	#superclass : #Object,
	#instVars : [
		'boxes',
		'lengthMeasure'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'Instance creation' }
Board class >> with: aBoxCollection measure: aLengthMeasure [

	aLengthMeasure nominalValue <= 0 ifTrue: [ 
		Error signal: 'Cannot create a game with that parsec or lightYear value' ].
	aBoxCollection size < 4 ifTrue: [ 
		Error signal: 'Cannot create a board with that value' ].
	^ self new initializeWith: aBoxCollection measure: aLengthMeasure
]

{ #category : #Information }
Board >> boxes [

	^ boxes size
]

{ #category : #BoxManager }
Board >> changePolarity: aBoxNumber [

	(boxes at: aBoxNumber) changePolarity
]

{ #category : #BoxManager }
Board >> effectAt: aPosition In: aGame [

	(boxes at: aPosition) effect: aGame 
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
