Class {
	#name : #RepeatCard,
	#superclass : #Object,
	#instVars : [
		'owner',
		'id'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'Instance creation' }
RepeatCard class >> owner: anOwner number: anId [

	^ self new initializeOwner: anOwner number: anId
]

{ #category : #Information }
RepeatCard >> = aCard [

	(aCard isKindOf: self class)
		ifTrue: [ ^ id = aCard id and: aCard owner = owner ]
		ifFalse: [ ^ false ]
]

{ #category : #Information }
RepeatCard >> applyCardUsing: cardManager at: aGame to: objective [

	aGame isValidPlayer: objective.
	aGame repeatEffectTo: objective
]

{ #category : #Information }
RepeatCard >> haveEffect [

	^ true
]

{ #category : #Information }
RepeatCard >> id [

	^ id
]

{ #category : #Initialization }
RepeatCard >> initializeOwner: anOwner number: anId [

	owner := anOwner.
	id:= anId.
]

{ #category : #Information }
RepeatCard >> isPermanent [

	^ false
]

{ #category : #Information }
RepeatCard >> owner [
	^owner .
]
