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
MoonWalkBox class >> with: aValue chance: aProbability [

	^ self new initializeWith: aValue chance: aProbability
]

{ #category : #Effect }
MoonWalkBox >> effect: aGame [

	aGame moveOthers: effectValue
]

{ #category : #Initialization }
MoonWalkBox >> initializeWith: aValue chance: aProbability [

	effectValue := aValue.
	probability := aProbability
]

{ #category : #Information }
MoonWalkBox >> probability [

	^ probability
]
