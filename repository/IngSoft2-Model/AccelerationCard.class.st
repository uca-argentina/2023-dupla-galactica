Class {
	#name : #AccelerationCard,
	#superclass : #Object,
	#instVars : [
		'effect'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'Instance creation' }
AccelerationCard class >> initializeNew [

	^ self new initializeNew
]

{ #category : #comparing }
AccelerationCard >> = aCard [

	^ aCard isKindOf: self class
]

{ #category : #Effect }
AccelerationCard >> applyCardUsing: aCardManager to: anObjective at: aGame [

	aCardManager activate: (Hand of: 'everyone' with: self initializeNew)
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
AccelerationCard >> initializeNew [

	effect := 1
]

{ #category : #Information }
AccelerationCard >> isPermanent [

	^ true
]
