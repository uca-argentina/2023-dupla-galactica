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
RepeatCard class >> holder: aPlayer [

	^ self new initializeWith: aPlayer
]

{ #category : #Information }
RepeatCard >> = aCard [

	^ (aCard isKindOf: self class) and: [ aCard isHolder: holder ]
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

{ #category : #Information }
RepeatCard >> holder [

	^ holder
]

{ #category : #Initialization }
RepeatCard >> initializeWith: aHolder [

	holder := aHolder.
	target := EmptyPlayer new
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

	target := aNewTarget
]
