Class {
	#name : #OverloadCard,
	#superclass : #Object,
	#instVars : [
		'holder',
		'target'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'Instance creation' }
OverloadCard class >> holder: aHolder [

	^ self new initializeHolder: aHolder
]

{ #category : #Information }
OverloadCard >> = aCard [

	(aCard isKindOf: self class)
		ifTrue: [ ^ aCard isHolder:holder ]
		ifFalse: [ ^ false ]
]

{ #category : #Effect }
OverloadCard >> applyCardUsing: cardManager at: aGame [

	
	aGame isValidPlayer: target.
	cardManager activeCard: (self class holder: target).
]

{ #category : #Effect }
OverloadCard >> applyEffect [

	^ -2
]

{ #category : #Information }
OverloadCard >> haveEffect [

	^ true
]

{ #category : #Initialization }
OverloadCard >> initializeHolder: aHolder [

	holder := aHolder.
	target := EmptyPlayer new.
]

{ #category : #Information }
OverloadCard >> isHolder: aColorPlayer [

	^ holder = aColorPlayer
]

{ #category : #Information }
OverloadCard >> isPermanent [

	^ true
]

{ #category : #Information }
OverloadCard >> selectTarget: aNewTarget [

	target:= aNewTarget.
]
