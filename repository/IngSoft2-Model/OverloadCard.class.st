Class {
	#name : #OverloadCard,
	#superclass : #Object,
	#instVars : [
		'owner',
		'objective'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'Instance creation' }
OverloadCard class >> owner: anOwner [

	^ self new initializeOwner: anOwner
]

{ #category : #Information }
OverloadCard >> = aCard [

	(aCard isKindOf: self class)
		ifTrue: [ ^ aCard owner = owner ]
		ifFalse: [ ^ false ]
]

{ #category : #Effect }
OverloadCard >> applyCardUsing: cardManager at: aGame to: anObjective [

	aGame isValidPlayer: anObjective.
	cardManager activeCard: (self class owner: anObjective).
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

{ #category : #Initialization }
OverloadCard >> initializeOwner: anOwner [

	owner := anOwner.
	objective:= EmptyPlayer new.
]

{ #category : #Information }
OverloadCard >> isPermanent [

	^ true
]

{ #category : #Information }
OverloadCard >> owner [

	^ owner
]
