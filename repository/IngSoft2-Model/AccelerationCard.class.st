Class {
	#name : #AccelerationCard,
	#superclass : #Object,
	#instVars : [
		'holder',
		'effect'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'Instance creation' }
AccelerationCard class >> holder: aColorPlayer [

	^ self new initializeWith: aColorPlayer
]

{ #category : #Initialization }
AccelerationCard >> = aCard [

	^ (aCard isKindOf: self class) and: [ aCard isHolder: holder ]
]

{ #category : #Effect }
AccelerationCard >> applyCardUsing: aCardManager at: aGame [

	aCardManager activate: (self class holder: 'everyone')
]

{ #category : #Effect }
AccelerationCard >> applyEffect [

	^ effect
]

{ #category : #Effect }
AccelerationCard >> boostEffect [

	effect := effect * 2
]

{ #category : #Information }
AccelerationCard >> haveEffect [

	^ true
]

{ #category : #Initialization }
AccelerationCard >> initializeWith: aHolder [

	holder := aHolder.
	effect := 1
]

{ #category : #Information }
AccelerationCard >> isHolder: aColorPlayer [

	^ holder = aColorPlayer
]

{ #category : #Information }
AccelerationCard >> isPermanent [

	^ true
]

{ #category : #Effect }
AccelerationCard >> selectTarget: anEmptyPlayer [
]
