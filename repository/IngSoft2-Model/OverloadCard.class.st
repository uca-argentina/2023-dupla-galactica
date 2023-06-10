Class {
	#name : #OverloadCard,
	#superclass : #Object,
	#instVars : [
		'owner',
		'id'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'Instance creation' }
OverloadCard class >> owner: anOwner number: anId [

	^ self new initializeOwner: anOwner number: anId
]

{ #category : #Information }
OverloadCard >> = aCard [

	(aCard isKindOf: self class)
		ifTrue: [ ^ id = aCard id and: aCard owner = owner ]
		ifFalse: [ ^ false ]
]

{ #category : #Effect }
OverloadCard >> applyCardUsing: cardManager at: aGame to: objective [

	aGame isValidPlayer: objective.
	cardManager activeCards addLast: (OverloadCard owner: objective number: id).
]

{ #category : #Effect }
OverloadCard >> applyEffect [

	
	^(-2)
]

{ #category : #Effect }
OverloadCard >> haveEffect [

	^ true
]

{ #category : #Information }
OverloadCard >> id [

	^ id
]

{ #category : #Initialization }
OverloadCard >> initializeOwner: anOwner number: anId [

	owner := anOwner.
	id:= anId.
]

{ #category : #Information }
OverloadCard >> isPermanent [

	^ true
]

{ #category : #Information }
OverloadCard >> owner [

	^ owner
]
