Class {
	#name : #RedoCard,
	#superclass : #Object,
	#instVars : [
		'holder',
		'target'
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
		ifTrue: [ ^ aCard isHolder: holder ]
		ifFalse: [ ^ false ]
]

{ #category : #Initialization }
RedoCard >> applyCardUsing: cardManager at: aGame [

	(cardManager lastCardPlay selectTarget: target)
		applyCardUsing: cardManager
		at: aGame
]

{ #category : #Information }
RedoCard >> haveEffect [

	^ false
]

{ #category : #Initialization }
RedoCard >> initializeHolder: aHolder [

	holder := aHolder.
	target:= EmptyPlayer new.
]

{ #category : #Information }
RedoCard >> isHolder: aColorPlayer [

	^ holder = aColorPlayer
]

{ #category : #Information }
RedoCard >> isPermanent [

	^ false
]

{ #category : #Information }
RedoCard >> selectTarget: aNewTarget [

	target:= aNewTarget.
]
