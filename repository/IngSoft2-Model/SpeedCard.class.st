Class {
	#name : #SpeedCard,
	#superclass : #Object,
	#instVars : [
		'owner'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'Instance creation' }
SpeedCard class >> owner: anOwner [

	^ self new initializeOwner: anOwner
]

{ #category : #Effect }
SpeedCard >> applyCard: aGame to: aPlayerColor [

	owner := aPlayerColor.
	aGame activeCards addLast: self.
]

{ #category : #Effect }
SpeedCard >> applyEffect: aPosition [

	^ aPosition + 1
]

{ #category : #Initialization }
SpeedCard >> initializeOwner: anOwner [

	owner := anOwner.
]

{ #category : #Information }
SpeedCard >> isPermanent [

	^ true
]

{ #category : #Information }
SpeedCard >> owner [
	^owner
]

{ #category : #Information }
SpeedCard >> toString [

	^ 'Speed'
]

{ #category : #Information }
SpeedCard >> transformTo: aCard [

	^ self
]
