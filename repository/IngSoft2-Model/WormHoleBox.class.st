Class {
	#name : #WormHoleBox,
	#superclass : #Object,
	#instVars : [
		'probability'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'Instance creation' }
WormHoleBox class >> withChance: aProbability [ 
	^self new initializeWithChance: aProbability 
]

{ #category : #Effect }
WormHoleBox >> effect: aGame [

	aGame moveCurrent: -4
]

{ #category : #Initialization }
WormHoleBox >> initializeWithChance: aProbability [

	probability := aProbability
]

{ #category : #Information }
WormHoleBox >> probability [
	^ probability
]
