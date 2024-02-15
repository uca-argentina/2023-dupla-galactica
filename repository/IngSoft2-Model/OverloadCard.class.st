Class {
	#name : #OverloadCard,
	#superclass : #Object,
	#instVars : [
		'holder',
		'effect'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'Instance creation' }
OverloadCard class >> holder: aPlayer [

	^ self new initializeWith: aPlayer
]

{ #category : #Initialization }
OverloadCard >> = aCard [

	^ (aCard isKindOf: self class) and: [ aCard isHolder: holder ]
]

{ #category : #Effect }
OverloadCard >> applyCardUsing: cardManager to: anObjective at: aGame [

	aGame isValidPlayer: anObjective.
	cardManager activate: (self class holder: anObjective)
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
OverloadCard >> initializeWith: aHolder [

	holder := aHolder.
	effect := -2
]

{ #category : #Information }
OverloadCard >> isHolder: aColorPlayer [

	^ holder = aColorPlayer
]

{ #category : #Information }
OverloadCard >> isPermanent [

	^ true
]
