Class {
	#name : #RepeatCard,
	#superclass : #Object,
	#instVars : [
		'holder'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'Instance creation' }
RepeatCard class >> holder: aHolder [

	^ self new initializeHolder: aHolder
]

{ #category : #Information }
RepeatCard >> = aCard [

	(aCard isKindOf: self class)
		ifTrue: [ ^ aCard holder = holder ]
		ifFalse: [ ^ false ]
]

{ #category : #Effect }
RepeatCard >> applyCardUsing: cardManager at: aGame to: objective [

	aGame isValidPlayer: objective.
	aGame repeatEffectTo: objective
]

{ #category : #Initialization }
RepeatCard >> generalObjective [

	^ false.
]

{ #category : #Information }
RepeatCard >> haveEffect [

	^ true
]

{ #category : #Information }
RepeatCard >> holder [

	^ holder
]

{ #category : #Initialization }
RepeatCard >> initializeHolder: aHolder [

	holder := aHolder.
]

{ #category : #Information }
RepeatCard >> isPermanent [

	^ false
]
