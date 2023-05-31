Class {
	#name : #NoEffectBox,
	#superclass : #Object,
	#instVars : [
		'probabilitie'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'Instance creation' }
NoEffectBox class >> withChance: anApaearranceProbabilitie [

	^ self new initializeWithChance: anApaearranceProbabilitie
]

{ #category : #Effect }
NoEffectBox >> effect: aBoard [

	
]

{ #category : #Initialization }
NoEffectBox >> initializeWithChance: anApaearranceProbabilitie [

	probabilitie := anApaearranceProbabilitie
]

{ #category : #Information }
NoEffectBox >> probabilitie [

	^ probabilitie
]
