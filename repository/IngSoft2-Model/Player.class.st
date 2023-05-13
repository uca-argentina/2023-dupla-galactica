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

	self lap == 0
		ifTrue: [ 
			aValue abs < self spaceship position
				ifTrue: [ self spaceship move: aValue ]
				ifFalse: [ 
					aValue > 0
						ifTrue: [ self spaceship move: aValue ]
						ifFalse: [ self spaceship moveTo: 1 ] ] ]
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

	self spaceship move: (self throwDice: aDiceCollection)
]

{ #category : #LapControl }
Player >> moveToTheBeginning [

	self spaceship moveTo: 1
]

{ #category : #Information }
Player >> position [

	^ self spaceship position
]

{ #category : #Information }
Player >> spaceship [

	^ spaceship
]

{ #category : #LapControl }
Player >> throwDice: aDiceCollection [

	^ aDiceCollection sumNumbers: [ :die | die throw ]
]

{ #category : #LapControl }
Player >> updateLap: aLength [

	| entireLaps position |
	position := self position.
	entireLaps := position // aLength.
	position > aLength
		ifTrue: [ 
			position := position - (aLength * entireLaps).
			self spaceship moveTo: position.
			lap := lap + entireLaps ]
		ifFalse: [ 
			self position < 0 ifTrue: [ 
				entireLaps := self position abs // aLength + 1.
				lap := lap - entireLaps.
				position := aLength - self position abs.
				self spaceship moveTo: position ] ]
]
