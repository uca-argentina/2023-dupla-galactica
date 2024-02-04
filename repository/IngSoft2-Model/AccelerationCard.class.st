Class {
	#name : #AccelerationCard,
	#superclass : #Object,
	#instVars : [
		'holder'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'Instance creation' }
AccelerationCard class >> holder: aPlayer [

	^ self new initializeWith: aPlayer
]

{ #category : #Information }
AccelerationCard >> = aCard [

	^ (aCard isKindOf: self class) and: [ aCard isHolder: holder ]
]

{ #category : #Effect }
AccelerationCard >> applyCardUsing: cardManager at: aGame [

	aGame playersColors do: [ :color | 
		cardManager activate: (self class holder: color) ]
]

{ #category : #Effect }
AccelerationCard >> applyEffect [

	^ 1
]

{ #category : #Information }
AccelerationCard >> haveEffect [

	^ true
]

{ #category : #Initialization }
AccelerationCard >> initializeWith: aHolder [

	holder := aHolder
]

{ #category : #Information }
AccelerationCard >> isHolder: aColorPlayer [

	^ holder = aColorPlayer
]

{ #category : #Information }
AccelerationCard >> isPermanent [

	^ true
]

{ #category : #Effect }
AccelerationCard >> selectTarget: anEmptyPlayer [ 
	
]
