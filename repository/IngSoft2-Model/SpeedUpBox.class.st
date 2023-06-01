Class {
	#name : #SpeedUpBox,
	#superclass : #Object,
	#instVars : [
		'probabilitie'
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

	probabilitie := anApaearranceProbabilitie
]

{ #category : #Information }
SpeedUpBox >> probabilitie [
	^ probabilitie
]
