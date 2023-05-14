Class {
	#name : #Player,
	#superclass : #Object,
	#instVars : [
		'spaceship',
		'lap'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
Player class >> with: aSpaceship [ 
	^(self new) initializeWith: aSpaceship.
]

{ #category : #Information }
Player >> color [

	^ self spaceship color
]

{ #category : #LapControl }
Player >> effect: aValue [

	(self lap == 0 and:
		 (aValue < 0 and: aValue abs > self spaceship position))
		ifTrue: [ self moveToTheBeginning ]
		ifFalse: [ self spaceship move: aValue ]
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
Player >> move: aDiceCollection [

	self spaceship move: (aDiceCollection sumNumbers: [ :die | die throw ]).
]

{ #category : #LapControl }
Player >> moveToTheBeginning [

	self spaceship moveTo: 1
]

{ #category : #Information }
Player >> spaceship [

	^ spaceship
]

{ #category : #LapControl }
Player >> updateLap: aLength [

	| entireLaps position |
	position := self spaceship position.
	entireLaps := position // aLength.

	position > aLength
		ifTrue: [ 
			position := position - (aLength * entireLaps).
			self spaceship moveTo: position.
			lap := lap + entireLaps ]
		ifFalse: [ 
			self spaceship position <= 0 ifTrue: [ 
				entireLaps := ((self spaceship position +1)  abs) // aLength + 1.
				lap := lap - entireLaps.
				lap < 0
					ifTrue: [ 
						lap := 0.
						self spaceship moveTo: 1 ]
					ifFalse: [ 
						position := aLength - self spaceship position abs.
						self spaceship moveTo: position ] ] ]
]
