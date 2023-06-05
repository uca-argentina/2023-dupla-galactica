Class {
	#name : #AtomicBombBox,
	#superclass : #Object,
	#instVars : [
		'probability'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'Instance creation' }
AtomicBombBox class >> withChance: aProbabilitie [

	^ self new initializeWithChance: aProbabilitie
]

{ #category : #Effect }
AtomicBombBox >> effect: aGame [

	aGame moveAllToTheStart
]

{ #category : #Initialization }
AtomicBombBox >> initializeWithChance: aProbabilitie [

	probability := aProbabilitie
]

{ #category : #Information }
AtomicBombBox >> probability [
	^ probability
]
