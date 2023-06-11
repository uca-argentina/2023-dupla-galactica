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

	position move: aValue andUpdateLap: aLength
]

{ #category : #PositionControl }
Player >> moveToTheBeginning [

	position moveToTheBeginning.
]

{ #category : #Information }
Player >> position [

	^ position
]
