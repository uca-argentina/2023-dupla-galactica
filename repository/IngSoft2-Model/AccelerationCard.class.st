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
AccelerationCard >> applyCard: aGame to: aPlayerColor [

	owner := aPlayerColor.
	aGame activeCards addLast: self.
]

{ #category : #Effect }
AccelerationCard >> applyEffect: aPosition [

	^ aPosition + 1
]

{ #category : #Initialization }
AccelerationCard >> initializeOwner: anOwner [

	owner := anOwner
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

{ #category : #Information }
AccelerationCard >> transformTo: aCard [

	^ self
]
