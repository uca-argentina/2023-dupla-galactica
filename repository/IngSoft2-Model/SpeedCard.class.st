Class {
	#name : #SpeedCard,
	#superclass : #Object,
	#instVars : [
		'holder'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'Instance creation' }
SpeedCard class >> holder: aHolder [

	^ self new initializeHolder: aHolder
]

{ #category : #Information }
SpeedCard >> = aCard [

	(aCard isKindOf: self class)
		ifTrue: [ ^ aCard holder = holder ]
		ifFalse: [ ^ false ]
]

{ #category : #Effect }
SpeedCard >> applyCardUsing: cardManager at: aGame to: anObjective [

	aGame isValidPlayer: anObjective.
	cardManager activeCard: (self class holder: anObjective).
]

{ #category : #Effect }
SpeedCard >> applyEffect [

	^ 1
]

{ #category : #Information }
SpeedCard >> generalObjective [

	^ false.
]

{ #category : #Information }
SpeedCard >> haveEffect [

	^ true
]

{ #category : #Information }
SpeedCard >> holder [

	^ holder
]

{ #category : #Initialization }
SpeedCard >> initializeHolder: aHolder [

	holder := aHolder.
]

{ #category : #Information }
SpeedCard >> isPermanent [

	^ true
]
