Class {
	#name : #Position,
	#superclass : #Object,
	#instVars : [
		'box',
		'lap'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'Instance creation' }
Position class >> atTheBeginning [

	^ self new initializeAtTheBeginning
]

{ #category : #Information }
Position >> box [

	^ box
]

{ #category : #Initialization }
Position >> initializeAtTheBeginning [

	box := 1.
	lap := 0
]

{ #category : #Information }
Position >> lap [

	^ lap
]

{ #category : #Movement }
Position >> move: aValue [

	box := box + aValue
]

{ #category : #Movement }
Position >> moveBackwardsLaps: aLength [

	lap := lap - (box abs // aLength + 1).
	lap < 0
		ifTrue: [ 
			lap := 0.
			box := 1 ]
		ifFalse: [ 
			box := aLength - box abs <= 0
				       ifTrue: [ aLength - (box abs % aLength) ]
				       ifFalse: [ aLength - box abs ] ]
]

{ #category : #Movement }
Position >> moveForwardLaps: aLength [

	lap := lap + (box // aLength).
	box := box % aLength
]

{ #category : #Movement }
Position >> moveToTheBeginning [

	box := 1
]
