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
	position := 1.
	lap := 0.
]

{ #category : #Information }
Player >> lap [

	^ lap
]

{ #category : #LapControl }
Player >> move: value [

	position := position + value
]

{ #category : #LapControl }
Player >> move: aPosition andUpdateLap: aValue [

	(self lap == 0 and:
		 (aPosition < 0 and: aPosition abs >= position))
		ifTrue: [ self moveToTheBeginning ]
		ifFalse: [ self move: aPosition ].
	self updateLap: aValue
]

{ #category : #LapControl }
Player >> moveBackwardsLaps: aLength [

	| entireLaps |
	entireLaps := (position + 1) abs // aLength + 1.
	lap := lap - entireLaps.
	position:= aLength - position abs
]

{ #category : #LapControl }
Player >> moveForwardLaps: aLength [

	| entireLaps |
	entireLaps := position // aLength.
	lap := lap + entireLaps.
	position:= position - (aLength * entireLaps)
]

{ #category : #LapControl }
Player >> moveToTheBeginning [

	position := 1
]

{ #category : #Information }
Player >> position [

	^ position
]

{ #category : #LapControl }
Player >> updateLap: aLength [

	position > aLength ifTrue: [ 
		self moveForwardLaps: aLength ].

	position <= 0 ifFalse: [ ^ self ].
		self moveBackwardsLaps: aLength
]
