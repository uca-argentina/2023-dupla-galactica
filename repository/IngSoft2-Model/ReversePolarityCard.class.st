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
ReversePolarityCard >> applyCardUsing: aCardManager to: anObjective at: aDuplaGalacticaGame [

	aDuplaGalacticaGame isValidBox: anObjective.
	aCardManager activate:
		(PlayerHand of: anObjective with: self initializeNew)
]

{ #category : #Effect }
ReversePolarityCard >> boostEffect [

	effect := effect + 1
]

{ #category : #Effect }
ReversePolarityCard >> changePolarity: aBoxNumber at: aDuplaGalacticaGame [

	effect timesRepeat: [ 
		aDuplaGalacticaGame changePolarityOf: aBoxNumber ]
]

{ #category : #Information }
ReversePolarityCard >> haveEffect [

	^ true
]

{ #category : #Initialization }
ReversePolarityCard >> initializeNew [

	effect := 1
]

{ #category : #Information }
ReversePolarityCard >> isPermanent [

	^ true
]
