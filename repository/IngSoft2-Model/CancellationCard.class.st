Class {
	#name : #CancellationCard,
	#superclass : #Object,
	#instVars : [
		'holder',
		'target'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'Instance creation' }
CancellationCard class >> holder: aPlayer [

	^ self new initializeWith: aPlayer
]

{ #category : #Information }
CancellationCard >> = aCard [

	^ (aCard isKindOf: self class) and: [ aCard isHolder: holder ]
]

{ #category : #Effect }
CancellationCard >> applyCardUsing: cardManager at: aGame [

	cardManager desactivate: target
]

{ #category : #Information }
CancellationCard >> haveEffect [

	^ true
]

{ #category : #Initialization }
CancellationCard >> initializeWith: aPlayer [

	holder := aPlayer.
	target := EmptyCard new
]

{ #category : #Information }
CancellationCard >> isHolder: aColorPlayer [

	^ holder = aColorPlayer
]

{ #category : #Information }
CancellationCard >> isPermanent [

	^ false
]

{ #category : #Information }
CancellationCard >> selectTarget: aNewTarget [

	target := aNewTarget
]
