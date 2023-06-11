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
Position >> > aPosition [

	lap > aPosition lap
		ifTrue: [ ^ true ]
		ifFalse: [ 
			box > aPosition boxNumber
				ifTrue: [ ^ true ]
				ifFalse: [ ^ false ] ]
]

{ #category : #Information }
Position >> boxNumber [

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
Position >> move: aValue andUpdateLap: aLength [

	(self lap == 0 and:
		 (aValue < 0 and: aValue abs >= box))
		ifTrue: [ self moveToTheBeginning ]
		ifFalse: [ self move: aValue ].
	self updateLap: aLength
]

{ #category : #Movement }
Position >> moveBackwardsLaps: aLength [

	lap := lap - ((box + 1) abs // aLength + 1).
	aLength - box abs <= 0
		ifTrue: [ self moveToTheBeginning ]
		ifFalse: [ box := aLength - box abs ]
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

{ #category : #Movement }
Position >> updateLap: aLength [

	box  > aLength ifTrue: [ 
		self moveForwardLaps: aLength ].

	box <= 0 ifFalse: [ ^ self ].
		self moveBackwardsLaps: aLength
]
