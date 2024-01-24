Class {
	#name : #AccelerationCard,
	#superclass : #Object,
	#instVars : [
		'holder'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'Instance creation' }
AccelerationCard class >> holder: aHolder [

	^ self new initializeHolder: aHolder
]

{ #category : #Information }
AccelerationCard >> = aCard [

	(aCard isKindOf: self class)
		ifTrue: [ ^ aCard isHolder: holder ]
		ifFalse: [ ^ false ]
]

{ #category : #Effect }
AccelerationCard >> applyCardUsing: cardManager at: aGame [ 

	aGame playersColors do: [ :color | 
		cardManager activeCard: (self class holder: color) ]
]

{ #category : #Effect }
AccelerationCard >> applyEffect [

	^ 1
]

{ #category : #Effect }
AccelerationCard >> generalObjective [

	^ true.
]

{ #category : #Information }
AccelerationCard >> haveEffect [

	^ true
]

{ #category : #Initialization }
AccelerationCard >> initializeHolder: aHolder [

	holder := aHolder.
]

{ #category : #Information }
AccelerationCard >> isHolder: aColorPlayer [

	^ holder = aColorPlayer
]

{ #category : #Information }
AccelerationCard >> isPermanent [

	^ true
]
