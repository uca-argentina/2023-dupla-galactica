Class {
	#name : #SpeedCard,
	#superclass : #Object,
	#instVars : [
		'owners'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'Instance creation' }
SpeedCard class >> owner: anOwner [

	^ self new initializeOwner: anOwner
]

{ #category : #Effect }
SpeedCard >> applyCardUsing: cardManager at: aGame to: objective [

	cardManager activeCards addLast: (SpeedCard owner: objective)
]

{ #category : #Effect }
SpeedCard >> applyEffect [

	^ 1
]

{ #category : #Initialization }
SpeedCard >> initializeOwner: anOwner [

	owners :=anOwner.
]

{ #category : #Information }
SpeedCard >> isPermanent [

	^ true
]

{ #category : #Information }
SpeedCard >> owner [

	^ owners
]

{ #category : #Information }
SpeedCard >> toString [

	^ 'Speed'
]
