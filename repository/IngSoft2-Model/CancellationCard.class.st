Class {
	#name : #CancellationCard,
	#superclass : #Object,
	#instVars : [
		'holder'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'Instance creation' }
CancellationCard class >> holder: aHolder [

	^ self new initializeHolder: aHolder
]

{ #category : #Information }
CancellationCard >> = aCard [

	(aCard isKindOf: self class)
		ifTrue: [ ^ aCard holder = holder ]
		ifFalse: [ ^ false ]
]

{ #category : #Effect }
CancellationCard >> applyCardUsing: cardManager at: aGame to: objective [

	cardManager desactivate: objective
]

{ #category : #Information }
CancellationCard >> generalObjective [

	^ false.
]

{ #category : #Information }
CancellationCard >> haveEffect [

	^ true
]

{ #category : #Information }
CancellationCard >> holder [

	^ holder
]

{ #category : #Initialization }
CancellationCard >> initializeHolder: aHolder [

	holder := aHolder.
	
]

{ #category : #Information }
CancellationCard >> isPermanent [

	^ false
]
