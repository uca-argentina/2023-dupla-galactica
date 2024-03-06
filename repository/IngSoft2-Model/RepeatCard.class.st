Class {
	#name : #RepeatCard,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #'Instance creation' }
RepeatCard class >> initializeNew [

	^ self new initializeNew
]

{ #category : #Initialization }
RepeatCard >> = aCard [

	^ aCard isKindOf: self class
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
RepeatCard >> initializeNew [

	
]

{ #category : #Information }
RepeatCard >> isPermanent [

	^ false
]
