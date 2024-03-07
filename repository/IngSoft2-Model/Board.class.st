Class {
	#name : #Board,
	#superclass : #Object,
	#instVars : [
		'boxes',
		'lengthMeasure',
		'lastBoxInvoked'
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

{ #category : #BoxManager }
Board >> changePolarityOf: aBoxNumber [

	(boxes at: aBoxNumber) changePolarity
]

{ #category : #BoxManager }
Board >> effectAt: aBoxNumber In: aDuplaGalacticaGame [

	(boxes at: aBoxNumber) effect: aDuplaGalacticaGame.
	lastBoxInvoked := aBoxNumber
]

{ #category : #Initialization }
Board >> initializeWith: aBoxesCollection measure: aLengthMeasure [

	lengthMeasure := aLengthMeasure.
	boxes := aBoxesCollection.
	lastBoxInvoked := 0
]

{ #category : #Information }
Board >> lastBoxInvoked [

	^ lastBoxInvoked
]

{ #category : #Information }
Board >> length [

	^ boxes size
]

{ #category : #Information }
Board >> lightYears [

	^ lengthMeasure lightYears
]

{ #category : #Information }
Board >> parsecs [

	^ lengthMeasure parsecs
]

{ #category : #BoxManager }
Board >> resetPolarities [

	boxes do: [ :box | box resetPolarity ]
]
