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

	^color
]

{ #category : #Initialization }
Player >> initializeWith: aColor [
	color:= aColor.
	position:=1.
	lap := 0
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
Player >> move: aPositionToMove andCheck: aValue [

	(self lap == 0 and:
		 (aPositionToMove  < 0 and: aPositionToMove abs > position))
		ifTrue: [ self moveToTheBeginning ]
		ifFalse: [ self move: aPositionToMove ].
	self updateLap: aValue
]

{ #category : #LapControl }
Player >> moveToTheBeginning [

	position:=1.
]

{ #category : #LapControl }
Player >> negativePosition: aLength [

	| entireLaps |
	entireLaps := (position + 1) abs // aLength + 1.
	lap := lap - entireLaps.
	^ aLength - position abs
]

{ #category : #Information }
Player >> position [
	^ position
]

{ #category : #LapControl }
Player >> positivePosition: aLength [

	| entireLaps |
	entireLaps := position // aLength.
	lap := lap + entireLaps.
	^ position - (aLength * entireLaps)
]

{ #category : #LapControl }
Player >> updateLap: aLength [

	position > aLength ifTrue: [ 
		position := self positivePosition: aLength ].

	position <= 0 ifFalse: [ ^ self ].
	position := self negativePosition: aLength
]
