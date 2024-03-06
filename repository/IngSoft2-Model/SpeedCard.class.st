Class {
	#name : #SpeedCard,
	#superclass : #Object,
	#instVars : [
		'effect'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'Instance creation' }
SpeedCard class >> holder: aPlayer [

	^ self new initializeWith: aPlayer
]

{ #category : #'Instance creation' }
SpeedCard class >> initializeNew [

	^ self new initializeNew
]

{ #category : #Initialization }
SpeedCard >> = aCard [

	^ aCard isKindOf: self class
]

{ #category : #Effect }
SpeedCard >> applyCardUsing: cardManager to: anObjective at: aGame [

	aGame isValidPlayer: anObjective.
	cardManager activate: (Hand of: anObjective with: self initializeNew)
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
SpeedCard >> initializeNew [

	effect := 1
]

{ #category : #Information }
SpeedCard >> isPermanent [

	^ true
]
