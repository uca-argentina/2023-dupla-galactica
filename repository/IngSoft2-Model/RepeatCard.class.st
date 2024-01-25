Class {
	#name : #RepeatCard,
	#superclass : #Object,
	#instVars : [
		'holder',
		'target'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'Instance creation' }
RepeatCard class >> holder: aHolder [

	^ self new initializeHolder: aHolder
]

{ #category : #Information }
RepeatCard >> = aCard [

	(aCard isKindOf: self class)
		ifTrue: [ ^ aCard isHolder: holder ]
		ifFalse: [ ^ false ]
]

{ #category : #Effect }
RepeatCard >> applyCardUsing: cardManager at: aGame [

	aGame isValidPlayer: target.
	aGame repeatEffectTo: target.
]

{ #category : #Information }
RepeatCard >> haveEffect [

	^ true
]

{ #category : #Initialization }
RepeatCard >> initializeHolder: aHolder [

	holder := aHolder.
	target:= EmptyPlayer new.
]

{ #category : #Information }
RepeatCard >> isHolder: aColorPlayer [

	^ holder = aColorPlayer
]

{ #category : #Information }
RepeatCard >> isPermanent [

	^ false
]

{ #category : #Information }
RepeatCard >> selectTarget: aNewTarget [

	target:= aNewTarget.
]
