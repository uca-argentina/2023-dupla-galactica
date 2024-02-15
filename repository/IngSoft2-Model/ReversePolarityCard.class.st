Class {
	#name : #ReversePolarityCard,
	#superclass : #Object,
	#instVars : [
		'holder',
		'effect'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'Instance creation' }
ReversePolarityCard class >> holder: aPlayer [

	^ self new initializeWith: aPlayer
]

{ #category : #Initialization }
ReversePolarityCard >> = aCard [

	^ (aCard isKindOf: self class) and: [ aCard isHolder: holder ]
]

{ #category : #Effect }
ReversePolarityCard >> applyCardUsing: cardManager to: anObjective at: aGame [

	aGame changePolarity: anObjective
]

{ #category : #Information }
ReversePolarityCard >> haveEffect [

	^ true
]

{ #category : #Initialization }
ReversePolarityCard >> initializeWith: aHolder [

	holder := aHolder.
	effect := true
]

{ #category : #Information }
ReversePolarityCard >> isHolder: aPlayer [

	^ holder = aPlayer
]

{ #category : #Information }
ReversePolarityCard >> isPermanent [

	^ true
]
