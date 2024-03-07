Class {
	#name : #NoEffectCard,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #'Instance creation' }
NoEffectCard class >> initializeNew [

	^ self new initializeNew
]

{ #category : #Information }
NoEffectCard >> = aCard [

	^ aCard isKindOf: self class
]

{ #category : #Effect }
NoEffectCard >> applyCardUsing: aCardManager to: anObjective at: aDuplaGalacticaGame [
]

{ #category : #Effect }
NoEffectCard >> applyEffect [
]

{ #category : #Information }
NoEffectCard >> haveEffect [

	^ true
]

{ #category : #Initialization }
NoEffectCard >> initializeNew [
]

{ #category : #Information }
NoEffectCard >> isPermanent [

	^ false
]
