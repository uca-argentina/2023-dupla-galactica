Class {
	#name : #ReversePolarityCard,
	#superclass : #Object,
	#instVars : [
		'holder',
		'target',
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
ReversePolarityCard >> applyCardUsing: cardManager at: aGame [

	aGame changePolarity: target
]

{ #category : #Information }
ReversePolarityCard >> haveEffect [

	^ true
]

{ #category : #Initialization }
ReversePolarityCard >> initializeWith: aHolder [

	holder := aHolder.
	target := NoEffectBox initializeNew.
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

{ #category : #Effect }
ReversePolarityCard >> selectTarget: aBoxNumber [

	target := aBoxNumber
]
