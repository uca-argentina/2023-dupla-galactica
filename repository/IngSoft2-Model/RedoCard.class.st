Class {
	#name : #RedoCard,
	#superclass : #Object,
	#instVars : [
		'holder'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'Instance creation' }
RedoCard class >> holder: aHolder [

	^ self new initializeHolder: aHolder
]

{ #category : #Information }
RedoCard >> = aCard [

	(aCard isKindOf: self class)
		ifTrue: [ ^ aCard holder = holder ]
		ifFalse: [ ^ false ]
]

{ #category : #Effect }
RedoCard >> applyCardUsing: cardManager at: aGame to: objective [

	cardManager lastCardPlay
		applyCardUsing: cardManager
		at: aGame
		to: objective
]

{ #category : #Information }
RedoCard >> haveEffect [

	^ false
]

{ #category : #Information }
RedoCard >> holder [

	^ holder
]

{ #category : #Initialization }
RedoCard >> initializeHolder: aHolder [

	holder := aHolder.
]

{ #category : #Information }
RedoCard >> isPermanent [

	^ false
]
