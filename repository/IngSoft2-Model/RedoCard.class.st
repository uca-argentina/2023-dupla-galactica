Class {
	#name : #RedoCard,
	#superclass : #Object,
	#instVars : [
		'owner',
		'id'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'Instance creation' }
RedoCard class >> owner: anOwner number: anId [

	^ self new initializeOwner: anOwner number: anId
]

{ #category : #Information }
RedoCard >> = aCard [

	(aCard isKindOf: self class)
		ifTrue: [ ^ id = aCard id and: aCard owner = owner ]
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
RedoCard >> id [

	^ id
]

{ #category : #Initialization }
RedoCard >> initializeOwner: anOwner number: anId [

	owner := anOwner.
	id:= anId.
]

{ #category : #Information }
RedoCard >> isPermanent [

	^ false
]

{ #category : #Information }
RedoCard >> owner [
	^ owner
]
