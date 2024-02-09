Class {
	#name : #WormHoleBox,
	#superclass : #Object,
	#instVars : [
		'polarity'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'Instance creation' }
WormHoleBox class >> initializeNew [

	^ self new initializeNew
]

{ #category : #Effect }
WormHoleBox >> changePolarity [

	polarity := polarity not
]

{ #category : #Effect }
WormHoleBox >> effect: aGame [

	polarity
		ifTrue: [ aGame moveCurrent: -4 ]
		ifFalse: [ aGame moveOthers: -4 ]
]

{ #category : #Initialization }
WormHoleBox >> initializeNew [

	polarity := true
]
