Class {
	#name : #RepeatCard,
	#superclass : #Object,
	#instVars : [
		'owner'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'Instance creation' }
RepeatCard class >> owner: anOwner [

	^ self new initializeOwner: anOwner
]

{ #category : #Information }
RepeatCard >> = aCard [

	(aCard isKindOf: self class)
		ifTrue: [ ^ aCard owner = owner ]
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

{ #category : #Initialization }
RepeatCard >> initializeOwner: anOwner [

	owner := anOwner.
]

{ #category : #Information }
RepeatCard >> isPermanent [

	^ false
]

{ #category : #Information }
RepeatCard >> owner [

	^ owner
]
