Class {
	#name : #OverloadCard,
	#superclass : #Object,
	#instVars : [
		'effect'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'Instance creation' }
OverloadCard class >> initializeNew [

	^ self new initializeNew
]

{ #category : #Initialization }
OverloadCard >> = aCard [

	^ aCard isKindOf: self class
]

{ #category : #Effect }
OverloadCard >> applyCardUsing: cardManager to: anObjective at: aGame [

	aGame isValidPlayer: anObjective.
	cardManager activate: (Hand of: anObjective with: self initializeNew)
]

{ #category : #Effect }
OverloadCard >> applyEffect [

	^ effect
]

{ #category : #Effect }
OverloadCard >> boostEffect [

	effect := effect * 2
]

{ #category : #Information }
OverloadCard >> haveEffect [

	^ true
]

{ #category : #Initialization }
OverloadCard >> initializeNew [

	effect := -2
]

{ #category : #Information }
OverloadCard >> isPermanent [

	^ true
]
