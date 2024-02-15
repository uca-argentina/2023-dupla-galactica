Class {
	#name : #RepeatCard,
	#superclass : #Object,
	#instVars : [
		'holder'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'Instance creation' }
RepeatCard class >> holder: aPlayer [

	^ self new initializeWith: aPlayer
]

{ #category : #Initialization }
RepeatCard >> = aCard [

	^ (aCard isKindOf: self class) and: [ aCard isHolder: holder ]
]

{ #category : #Effect }
RepeatCard >> applyCardUsing: cardManager to: anObjective at: aGame [

	aGame isValidPlayer: anObjective.
	aGame repeatEffectTo: anObjective
]

{ #category : #Information }
RepeatCard >> haveEffect [

	^ true
]

{ #category : #Initialization }
RepeatCard >> initializeWith: aHolder [

	holder := aHolder
]

{ #category : #Information }
RepeatCard >> isHolder: aColorPlayer [

	^ holder = aColorPlayer
]

{ #category : #Information }
RepeatCard >> isPermanent [

	^ false
]
