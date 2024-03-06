Class {
	#name : #ReversePolarityCard,
	#superclass : #Object,
	#instVars : [
		'effect'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'Instance creation' }
ReversePolarityCard class >> initializeNew [

	^ self new initializeNew
]

{ #category : #Initialization }
ReversePolarityCard >> = aCard [

	^ aCard isKindOf: self class
]

{ #category : #Effect }
ReversePolarityCard >> applyCardUsing: cardManager to: anObjective at: aGame [

	cardManager activate: (Hand of: anObjective with: self initializeNew)
]

{ #category : #Effect }
ReversePolarityCard >> changePolarity: aBoxNumber at: aDuplaGalacticaGame [

	effect ifFalse: [ ^ self ].
	aDuplaGalacticaGame changePolarity: aBoxNumber.
	effect := false
]

{ #category : #Information }
ReversePolarityCard >> haveEffect [

	^ true
]

{ #category : #Initialization }
ReversePolarityCard >> initializeNew [

	effect := true
]

{ #category : #Information }
ReversePolarityCard >> isPermanent [

	^ true
]
