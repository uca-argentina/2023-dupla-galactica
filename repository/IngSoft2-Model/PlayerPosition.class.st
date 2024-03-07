Class {
	#name : #PlayerPosition,
	#superclass : #Object,
	#instVars : [
		'box',
		'lap'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'Instance creation' }
PlayerPosition class >> atTheBeginning [

	^ self new initializeAtTheBeginning
]

{ #category : #Information }
PlayerPosition >> box [

	^ box
]

{ #category : #Initialization }
PlayerPosition >> initializeAtTheBeginning [

	box := 1.
	lap := 0
]

{ #category : #Information }
PlayerPosition >> lap [

	^ lap
]

{ #category : #Movement }
PlayerPosition >> move: aValue [

	box := box + aValue
]

{ #category : #Movement }
PlayerPosition >> moveBackwardsLaps: aLength [

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
PlayerPosition >> moveForwardLaps: aLength [

	lap := lap + (box // aLength).
	box := box % aLength
]

{ #category : #Movement }
PlayerPosition >> moveToTheBeginning [

	box := 1
]
