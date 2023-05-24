Class {
	#name : #MoonWalkBox,
	#superclass : #Object,
	#instVars : [
		'effectValue'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'Instance creation' }
MoonWalkBox class >> with: aValue [

	^ self new initializeWith: aValue
]

{ #category : #Effect }
MoonWalkBox >> effect: aGame [

	aGame moveOthers: effectValue.

	"aBoard players do: [ :player | 
		player color asSymbol == aBoard nextOne color asSymbol ifFalse: [ 
			player effect: effectValue check: aBoard length ] ]"
]

{ #category : #Initialization }
MoonWalkBox >> initializeWith: aValue [

	effectValue := aValue.
]
