Class {
	#name : #MoonWalkBox,
	#superclass : #Object,
	#instVars : [
		'effectValue'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
MoonWalkBox class >> with: aValue [ 
	^(self new) initializeWith: aValue.
]

{ #category : #Effect }
MoonWalkBox >> effect: aPlayerCollection affects: aPlayer [

	aPlayerCollection do: [ :player | 
		player == aPlayer ifFalse: [ player effect: effectValue ] ]
]

{ #category : #Initialization }
MoonWalkBox >> initializeWith: aValue [ 
	effectValue:= aValue.
]
