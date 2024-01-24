Class {
	#name : #RedoCard,
	#superclass : #Object,
	#instVars : [
		'owner',
		'objective'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'Instance creation' }
RedoCard class >> owner: anOwner [

	^ self new initializeOwner: anOwner
]

{ #category : #Information }
RedoCard >> = aCard [

	(aCard isKindOf: self class)
		ifTrue: [ ^ aCard owner = owner ]
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

{ #category : #Initialization }
RedoCard >> initializeOwner: anOwner [

	owner := anOwner.
	objective:= EmptyPlayer new.
]

{ #category : #Information }
RedoCard >> isPermanent [

	^ false
]

{ #category : #Information }
RedoCard >> owner [

	^ owner
]
