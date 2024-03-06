Class {
	#name : #SpeedBoostCard,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #'Instance creation' }
SpeedBoostCard class >> initializeNew [

	^ self new initializeNew
]

{ #category : #Initialization }
SpeedBoostCard >> = aCard [

	^ aCard isKindOf: self class
]

{ #category : #Effect }
SpeedBoostCard >> applyCardUsing: cardManager to: anObjective at: aGame [

	cardManager duplicateEffectOf: anObjective
]

{ #category : #Information }
SpeedBoostCard >> haveEffect [

	^ true
]

{ #category : #Initialization }
SpeedBoostCard >> initializeNew [
]

{ #category : #Information }
SpeedBoostCard >> isPermanent [

	^ false
]
