Class {
	#name : #SpeedCard,
	#superclass : #Object,
	#instVars : [
		'holder',
		'effect'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'Instance creation' }
SpeedCard class >> holder: aPlayer [

	^ self new initializeWith: aPlayer
]

{ #category : #Initialization }
SpeedCard >> = aCard [

	^ (aCard isKindOf: self class) and: [ aCard isHolder: holder ]
]

{ #category : #Effect }
SpeedCard >> applyCardUsing: cardManager to: anObjective at: aGame [

	aGame isValidPlayer: anObjective.
	cardManager activate: (self class holder: anObjective).
]

{ #category : #Effect }
SpeedCard >> applyEffect [

	^ effect
]

{ #category : #Effect }
SpeedCard >> boostEffect [

	effect := effect * 2
]

{ #category : #Information }
SpeedCard >> haveEffect [

	^ true
]

{ #category : #Initialization }
SpeedCard >> initializeWith: aHolder [

	holder := aHolder.
	effect := 1
]

{ #category : #Information }
SpeedCard >> isHolder: aColorPlayer [

	^ holder = aColorPlayer
]

{ #category : #Information }
SpeedCard >> isPermanent [

	^ true
]
