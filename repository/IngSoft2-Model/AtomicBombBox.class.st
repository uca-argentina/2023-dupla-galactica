Class {
	#name : #AtomicBombBox,
	#superclass : #Object,
	#instVars : [
		'probabilitie'
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

	probabilitie := aProbabilitie
]

{ #category : #Information }
AtomicBombBox >> probabilitie [
	^ probabilitie
]
