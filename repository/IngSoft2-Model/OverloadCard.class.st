Class {
	#name : #OverloadCard,
	#superclass : #Object,
	#instVars : [
		'holder'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'Instance creation' }
OverloadCard class >> holder: aHolder [

	^ self new initializeHolder: aHolder
]

{ #category : #Information }
OverloadCard >> = aCard [

	(aCard isKindOf: self class)
		ifTrue: [ ^ aCard holder = holder ]
		ifFalse: [ ^ false ]
]

{ #category : #Effect }
OverloadCard >> applyCardUsing: cardManager at: aGame to: anObjective [

	aGame isValidPlayer: anObjective.
	cardManager activeCard: (self class holder: anObjective).
]

{ #category : #Effect }
OverloadCard >> applyEffect [

	^ -2
]

{ #category : #Initialization }
OverloadCard >> generalObjective [

	^ false.
]

{ #category : #Information }
OverloadCard >> haveEffect [

	^ true
]

{ #category : #Information }
OverloadCard >> holder [

	^ holder
]

{ #category : #Initialization }
OverloadCard >> initializeHolder: aHolder [

	holder := aHolder.
]

{ #category : #Information }
OverloadCard >> isPermanent [

	^ true
]
