Class {
	#name : #MoonWalkBox,
	#superclass : #Object,
	#instVars : [
		'effectValue',
		'polarity'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'Instance creation' }
MoonWalkBox class >> with: aValue [

	^ self new initializeWith: aValue
]

{ #category : #Effect }
MoonWalkBox >> changePolarity [

	polarity := polarity not
]

{ #category : #Effect }
MoonWalkBox >> effect: aGame [

	polarity
		ifTrue: [ aGame moveOthers: effectValue ]
		ifFalse: [ aGame moveCurrent: effectValue ]
]

{ #category : #Initialization }
MoonWalkBox >> initializeWith: aValue [

	effectValue := aValue.
	polarity := true
]
