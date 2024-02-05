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

{ #category : #Initialization }
SpeedBoostCard >> applyCardUsing: cardManager at: aGame [

	cardManager duplicateEffectOf: target
]

{ #category : #Initialization }
SpeedBoostCard >> haveEffect [

	^ true
]

{ #category : #Initialization }
SpeedBoostCard >> holder [

	^ holder
]

{ #category : #Initialization }
SpeedBoostCard >> initializeWith: aPlayer [

	holder := aPlayer.
	target := EmptyCard new
]

{ #category : #Initialization }
SpeedBoostCard >> isHolder: aColorPlayer [

	^ holder = aColorPlayer
]

{ #category : #Initialization }
SpeedBoostCard >> isPermanent [

	^ false
]

{ #category : #Initialization }
SpeedBoostCard >> selectTarget: aNewTarget [

	target := aNewTarget
]
