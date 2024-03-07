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
]

{ #category : #Effect }
NoEffectCard >> applyCardUsing: aCardManager to: anObjective at: aDuplaGalacticaGame [

	Error signal:
		'Redo card cannot be played because there are no cards that have been played before'
]

{ #category : #Effect }
NoEffectCard >> applyEffect [
]

{ #category : #Information }
NoEffectCard >> haveEffect [
]

{ #category : #Initialization }
NoEffectCard >> initializeNew [
]

{ #category : #Information }
NoEffectCard >> isPermanent [
]
