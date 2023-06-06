Class {
	#name : #NoEffectBox,
	#superclass : #Object,
	#instVars : [
		'probability'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'Instance creation' }
NoEffectBox class >> withChance: aProbability [

	^ self new initializeWithChance: aProbability
]

{ #category : #Effect }
NoEffectBox >> effect: aBoard [

	
]

{ #category : #Initialization }
NoEffectBox >> initializeWithChance: aProbability [

	probability := aProbability
]

{ #category : #Information }
NoEffectBox >> probability [

	^ probability
]
