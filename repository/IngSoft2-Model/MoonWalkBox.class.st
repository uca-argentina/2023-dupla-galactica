Class {
	#name : #MoonWalkBox,
	#superclass : #Object,
	#instVars : [
		'effectValue',
		'probabilitie'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'Instance creation' }
MoonWalkBox class >> with: aValue [

	^ self new initializeWith: aValue
]

{ #category : #'Instance creation' }
MoonWalkBox class >> with: aValue chance: aProbabilite [

	^ self new initializeWith: aValue chance: aProbabilite
]

{ #category : #Effect }
MoonWalkBox >> effect: aGame [

	aGame moveOthers: effectValue
]

{ #category : #Initialization }
MoonWalkBox >> initializeWith: aValue [

	effectValue := aValue
]

{ #category : #Initialization }
MoonWalkBox >> initializeWith: aValue chance: aProbabilite [

	effectValue := aValue.
	probabilitie := aProbabilite
]

{ #category : #Information }
MoonWalkBox >> probabilitie [
	^ probabilitie
]
