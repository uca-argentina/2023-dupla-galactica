Class {
	#name : #RedoCard,
	#superclass : #Object,
	#instVars : [
		'holder'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'Instance creation' }
RedoCard class >> holder: aPlayer [

	^ self new initializeWith: aPlayer
]

{ #category : #Initialization }
RedoCard >> = aCard [

	^ (aCard isKindOf: self class) and: [ aCard isHolder: holder ]
]

{ #category : #Effect }
RedoCard >> applyCardUsing: aCardManager at: aGame [

	aCardManager lastCardPlay applyCardUsing: aCardManager at: aGame
]

{ #category : #Effect }
RedoCard >> applyCardUsing: aCardManager to: anObjective at: aGame [

	aCardManager lastCardPlay
		applyCardUsing: aCardManager
		to: anObjective
		at: aGame
]

{ #category : #Information }
RedoCard >> haveEffect [

	^ false
]

{ #category : #Initialization }
RedoCard >> initializeWith: aHolder [

	holder := aHolder
]

{ #category : #Information }
RedoCard >> isHolder: aColorPlayer [

	^ holder = aColorPlayer
]

{ #category : #Information }
RedoCard >> isPermanent [

	^ false
]
