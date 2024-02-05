Class {
	#name : #OverloadCard,
	#superclass : #Object,
	#instVars : [
		'holder',
		'target',
		'effect'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'Instance creation' }
OverloadCard class >> holder: aPlayer [

	^ self new initializeWith: aPlayer
]

{ #category : #Information }
OverloadCard >> = aCard [

	^ (aCard isKindOf: self class) and: [ aCard isHolder: holder ]
]

{ #category : #Effect }
OverloadCard >> applyCardUsing: cardManager at: aGame [

	aGame isValidPlayer: target.
	cardManager activate: (self class holder: target)
]

{ #category : #Effect }
OverloadCard >> applyEffect [

	^ effect
]

{ #category : #Information }
OverloadCard >> boostEffect [

	effect := effect * 2
]

{ #category : #Information }
OverloadCard >> haveEffect [

	^ true
]

{ #category : #Initialization }
OverloadCard >> initializeWith: aHolder [

	holder := aHolder.
	target := EmptyPlayer new.
	effect := -2
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

	target:= aNewTarget
]
