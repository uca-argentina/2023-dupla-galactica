Class {
	#name : #Player,
	#superclass : #Object,
	#instVars : [
		'spaceship',
		'lap'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'Instance creation' }
Player class >> with: aSpaceship [

	^ self new initializeWith: aSpaceship
]

{ #category : #Information }
Player >> color [

	^ self spaceship color
]

{ #category : #LapControl }
Player >> effect: aPositionToMove check: aValue [

	(self lap == 0 and:
		 (aPositionToMove  < 0 and: aPositionToMove abs > self spaceship position))
		ifTrue: [ self moveToTheBeginning ]
		ifFalse: [ self spaceship move: aPositionToMove ].
	self updateLap: aValue
]

{ #category : #Initialization }
Player >> initializeWith: aSpaceship [

	spaceship := aSpaceship.
	lap := 0
]

{ #category : #Information }
Player >> lap [

	^ lap
]

{ #category : #LapControl }
Player >> move: aDiceCollection check: aValue [

	self spaceship move: (aDiceCollection sumNumbers: [ :die | die throw ]).
	self updateLap: aValue.
]

{ #category : #LapControl }
Player >> moveToTheBeginning [

	self spaceship moveTo: 1
]

{ #category : #LapControl }
Player >> negativePosition: aLength [

	| entireLaps |
	entireLaps := (self spaceship position + 1) abs // aLength + 1.
	lap := lap - entireLaps.
	^ aLength - self spaceship position abs
]

{ #category : #LapControl }
Player >> positivePosition: aLength [

	| entireLaps |
	entireLaps := self spaceship position // aLength.
	lap := lap + entireLaps.
	^ self spaceship position - (aLength * entireLaps)
]

{ #category : #Information }
Player >> spaceship [

	^ spaceship
]

{ #category : #LapControl }
Player >> updateLap: aLength [

	| position |

	self spaceship position > aLength ifTrue: [ 
		position := self positivePosition: aLength.
		self spaceship moveTo: position ].

	self spaceship position <= 0 ifFalse: [ ^ self ].
	position := self negativePosition: aLength.
	self spaceship moveTo: position
]
