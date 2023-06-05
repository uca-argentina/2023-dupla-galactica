Class {
	#name : #WormHoleBox,
	#superclass : #Object,
	#instVars : [
		'probabilitie'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'Instance creation' }
WormHoleBox class >> withChance: anApaearranceProbabilitie [ 
	^self new initializeWithChance: anApaearranceProbabilitie 
]

{ #category : #Effect }
WormHoleBox >> effect: aGame [

	aGame moveCurrent: -4
]

{ #category : #Initialization }
WormHoleBox >> initializeWithChance: anApaearranceProbabilitie [

	probabilitie := anApaearranceProbabilitie
]

{ #category : #Information }
WormHoleBox >> probability [
	^ probabilitie
]
