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
RedoCard class >> holder: aPlayer [

	^ self new initializeWith: aPlayer
]

{ #category : #Information }
RedoCard >> = aCard [

	^ (aCard isKindOf: self class) and: [ aCard isHolder: holder ]
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

{ #category : #Information }
RedoCard >> holder [

	^ holder
]

{ #category : #Initialization }
RedoCard >> initializeWith: aHolder [

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

	target := aNewTarget
]
