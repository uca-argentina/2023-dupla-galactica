Class {
	#name : #AtomicBombBox,
	#superclass : #Object,
	#instVars : [
		'polarity'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'Instance creation' }
AtomicBombBox class >> initializeNew [

	^ self new initializeNew
]

{ #category : #Effect }
AtomicBombBox >> changePolarity [

	polarity := polarity not
]

{ #category : #Effect }
AtomicBombBox >> effect: aDuplaGalacticaGame [

	polarity ifTrue: [ aDuplaGalacticaGame moveAllToTheStart ]
]

{ #category : #Initialization }
AtomicBombBox >> initializeNew [

	polarity := true
]

{ #category : #Effect }
AtomicBombBox >> resetPolarity [

	polarity := true
]
