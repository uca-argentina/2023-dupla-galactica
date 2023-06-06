Class {
	#name : #AtomicBombBox,
	#superclass : #Object,
	#instVars : [
		'probability'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'Instance creation' }
AtomicBombBox class >> withChance: aProbability [

	^ self new initializeWithChance: aProbability
]

{ #category : #Effect }
AtomicBombBox >> effect: aGame [

	aGame moveAllToTheStart
]

{ #category : #Initialization }
AtomicBombBox >> initializeWithChance: aProbability [

	probability := aProbability
]

{ #category : #Information }
AtomicBombBox >> probability [
	^ probability
]
