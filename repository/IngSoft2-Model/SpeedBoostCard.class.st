Class {
	#name : #SpeedBoostCard,
	#superclass : #Object,
	#instVars : [
		'holder',
		'target'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'Instance creation' }
SpeedBoostCard class >> holder: aPlayer [

	^ self new initializeWith: aPlayer
]

{ #category : #Initialization }
SpeedBoostCard >> = aCard [

	^ (aCard isKindOf: self class) and: [ aCard isHolder: holder ]
]

{ #category : #Effect }
SpeedBoostCard >> applyCardUsing: cardManager at: aGame [

	cardManager duplicateEffectOf: target
]

{ #category : #Information }
SpeedBoostCard >> haveEffect [

	^ true
]

{ #category : #Initialization }
SpeedBoostCard >> initializeWith: aPlayer [

	holder := aPlayer.
	target := EmptyCard new
]

{ #category : #Information }
SpeedBoostCard >> isHolder: aColorPlayer [

	^ holder = aColorPlayer
]

{ #category : #Information }
SpeedBoostCard >> isPermanent [

	^ false
]

{ #category : #Effect }
SpeedBoostCard >> selectTarget: aNewTarget [

	target := aNewTarget
]
