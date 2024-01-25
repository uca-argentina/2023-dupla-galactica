Class {
	#name : #SpeedCard,
	#superclass : #Object,
	#instVars : [
		'holder',
		'target'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'Instance creation' }
SpeedCard class >> holder: aHolder [

	^ self new initializeHolder: aHolder
]

{ #category : #Information }
SpeedCard >> = aCard [

	(aCard isKindOf: self class)
		ifTrue: [ ^ aCard isHolder: holder ]
		ifFalse: [ ^ false ]
]

{ #category : #Effect }
SpeedCard >> applyCardUsing: cardManager at: aGame [

	aGame isValidPlayer: target.
	cardManager activeCard: (self class holder: target).
]

{ #category : #Effect }
SpeedCard >> applyEffect [

	^ 1
]

{ #category : #Information }
SpeedCard >> haveEffect [

	^ true
]

{ #category : #Initialization }
SpeedCard >> initializeHolder: aHolder [

	holder := aHolder.
	target:= EmptyPlayer new.
]

{ #category : #Information }
SpeedCard >> isHolder: aColorPlayer [

	^ holder = aColorPlayer
]

{ #category : #Information }
SpeedCard >> isPermanent [

	^ true
]

{ #category : #Initialization }
SpeedCard >> selectTarget: aNewTarget [

	target:= aNewTarget.
]
