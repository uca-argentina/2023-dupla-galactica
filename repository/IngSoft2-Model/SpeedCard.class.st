Class {
	#name : #SpeedCard,
	#superclass : #Object,
	#instVars : [
		'holder',
		'target',
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
SpeedCard >> applyCardUsing: cardManager at: aGame [

	aGame isValidPlayer: target.
	cardManager activate: (self class holder: target).
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
	target := EmptyPlayer new.
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

{ #category : #Effect }
SpeedCard >> selectTarget: aNewTarget [

	target := aNewTarget
]
