Class {
	#name : #MoonWalkBox,
	#superclass : #Object,
	#instVars : [
		'effectValue',
		'probability'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'Instance creation' }
MoonWalkBox class >> with: aValue chance: aProbabilite [

	^ self new initializeWith: aValue chance: aProbabilite
]

{ #category : #Effect }
MoonWalkBox >> effect: aGame [

	aGame moveOthers: effectValue
]

{ #category : #Initialization }
MoonWalkBox >> initializeWith: aValue chance: aProbabilite [

	effectValue := aValue.
	probability := aProbabilite
]

{ #category : #Information }
MoonWalkBox >> probability [
	^ probability
]
