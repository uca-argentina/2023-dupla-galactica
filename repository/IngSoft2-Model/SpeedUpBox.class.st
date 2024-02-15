Class {
	#name : #SpeedUpBox,
	#superclass : #Object,
	#instVars : [
		'polarity'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'Instance creation' }
SpeedUpBox class >> initializeNew [

	^ self new initializeNew
]

{ #category : #Effect }
SpeedUpBox >> changePolarity [

	polarity := polarity not
]

{ #category : #Effect }
SpeedUpBox >> effect: aGame [

	polarity
		ifTrue: [ aGame moveCurrent: 4 ]
		ifFalse: [ aGame moveOthers: 4 ]
]

{ #category : #Initialization }
SpeedUpBox >> initializeNew [

	polarity := true
]
