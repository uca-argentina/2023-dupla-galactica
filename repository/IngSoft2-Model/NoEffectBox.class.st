Class {
	#name : #NoEffectBox,
	#superclass : #Object,
	#instVars : [
		'probability'
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

	probability := anApaearranceProbabilitie
]

{ #category : #Information }
NoEffectBox >> probability [

	^ probability
]
