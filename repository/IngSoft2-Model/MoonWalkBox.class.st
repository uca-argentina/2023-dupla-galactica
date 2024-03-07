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
MoonWalkBox >> effect: aDuplaGalacticaGame [

	polarity
		ifTrue: [ aDuplaGalacticaGame moveOthers: effectValue ]
		ifFalse: [ aDuplaGalacticaGame moveCurrent: effectValue ]
]

{ #category : #Initialization }
MoonWalkBox >> initializeWith: aValue [

	effectValue := aValue.
	polarity := true
]

{ #category : #Effect }
MoonWalkBox >> resetPolarity [

	polarity := true
]
