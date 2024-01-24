Class {
	#name : #AccelerationCard,
	#superclass : #Object,
	#instVars : [
		'owner',
		'objective'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'Instance creation' }
AccelerationCard class >> owner: anOwner [

	^ self new initializeOwner: anOwner
]

{ #category : #Information }
AccelerationCard >> = aCard [

	(aCard isKindOf: self class)
		ifTrue: [ ^ aCard owner = owner ]
		ifFalse: [ ^ false ]
]

{ #category : #Effect }
AccelerationCard >> applyCardUsing: cardManager at: aGame to: anObjective [

	anObjective = 'all' ifFalse: [ 
		Error signal: 'The objective must be all' ].
	aGame playersColors do: [ :color | 
		cardManager activeCard: (self class owner: color) ]
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
AccelerationCard >> initializeOwner: anOwner [

	owner := anOwner.
	objective:= EmptyPlayer new.
]

{ #category : #Information }
AccelerationCard >> isPermanent [

	^ true
]

{ #category : #Information }
AccelerationCard >> owner [
	^owner
]
