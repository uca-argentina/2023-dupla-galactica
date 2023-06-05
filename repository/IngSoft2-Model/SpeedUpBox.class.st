Class {
	#name : #SpeedUpBox,
	#superclass : #Object,
	#instVars : [
		'probability'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'Instance creation' }
SpeedUpBox class >> withChance: anApaearranceProbabilitie [

	^ self new initializeWithChance: anApaearranceProbabilitie
]

{ #category : #Effect }
SpeedUpBox >> effect: aGame [

	aGame moveCurrent: 4.
]

{ #category : #Initialization }
SpeedUpBox >> initializeWithChance: anApaearranceProbabilitie [

	probability := anApaearranceProbabilitie
]

{ #category : #Information }
SpeedUpBox >> probability [
	^ probability
]
