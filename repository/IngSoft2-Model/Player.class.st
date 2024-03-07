Class {
	#name : #Player,
	#superclass : #Object,
	#instVars : [
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
Player >> aheadOf: aPlayer [

	^ aPlayer lap < position lap or:
		  (position lap = aPlayer lap and: position box > aPlayer box)
]

{ #category : #Information }
Player >> box [

	^ position box
]

{ #category : #Information }
Player >> color [

	^ color
]

{ #category : #Initialization }
Player >> initializeWith: aColor [

	color := aColor.
	position := PlayerPosition atTheBeginning
]

{ #category : #Information }
Player >> lap [ 

	^ position lap.
]

{ #category : #PositionControl }
Player >> move: aValue andUpdateLap: aLength [
	
	position move: aValue.
	self updateLap: aLength
]

{ #category : #PositionControl }
Player >> moveToTheBeginning [

	position moveToTheBeginning
]

{ #category : #PositionControl }
Player >> updateLap: aLength [

	position box  > aLength ifTrue: [ 
		position moveForwardLaps: aLength ].

	position box <= 0 ifFalse: [ ^ self ].
		position moveBackwardsLaps: aLength
]
