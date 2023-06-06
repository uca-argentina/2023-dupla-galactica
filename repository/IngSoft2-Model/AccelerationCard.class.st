Class {
	#name : #AccelerationCard,
	#superclass : #Object,
	#instVars : [
		'owner'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'Instance creation' }
AccelerationCard class >> owner: anOwner [ 
	^self new initializeOwner: anOwner
]

{ #category : #Effect }
AccelerationCard >> applyCardUsing: cardManager at: aGame to: objective [

	objective = 'all' ifFalse: [ Error signal: 'The objective must be all'].
	aGame playersColors do: [ :color | 
		cardManager activeCards addLast: (AccelerationCard owner: color) ]
]

{ #category : #Effect }
AccelerationCard >> applyEffect [

	^ 1
]

{ #category : #Information }
AccelerationCard >> equals: aCard [

	^ 'Acceleration' = aCard toString and: aCard owner = owner
]

{ #category : #Initialization }
AccelerationCard >> initializeOwner: anOwner [

	owner := anOwner.
]

{ #category : #Information }
AccelerationCard >> isPermanent [

	^ true
]

{ #category : #Information }
AccelerationCard >> owner [
	^owner
]

{ #category : #Information }
AccelerationCard >> toString [

	^ 'Acceleration'
]
