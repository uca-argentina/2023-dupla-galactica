Class {
	#name : #Player,
	#superclass : #Object,
	#instVars : [
		'lap',
		'color',
		'position'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'Instance creation' }
Player class >> with: aSpaceship [

	^ self new initializeWith: aSpaceship
]

{ #category : #Information }
Player >> color [

	^ color
]

{ #category : #Initialization }
Player >> initializeWith: aColor [

	color := aColor.
	position := Position atTheBeginning.
	lap := 0.
]

{ #category : #PositionControl }
Player >> move: aValue andUpdateLap: aLength [
	
	(position lap == 0 and:
		 (aValue < 0 and: (aValue abs >= position box)))
		ifTrue: [ position moveToTheBeginning ]
		ifFalse: [ position move: aValue ].
	self updateLap: aLength
]

{ #category : #PositionControl }
Player >> moveToTheBeginning [

	position moveToTheBeginning.
]

{ #category : #Information }
Player >> position [

	^ position
]

{ #category : #Information }
Player >> updateLap: aLength [

	position box  > aLength ifTrue: [ 
		position moveForwardLaps: aLength ].

	position box <= 0 ifFalse: [ ^ self ].
		position moveBackwardsLaps: aLength
]
