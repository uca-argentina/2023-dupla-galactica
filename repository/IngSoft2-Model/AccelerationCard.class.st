Class {
	#name : #AccelerationCard,
	#superclass : #Object,
	#instVars : [
		'owners'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'Instance creation' }
AccelerationCard class >> owner: anOwner [ 
	^self new initializeOwner: anOwner
]

{ #category : #Effect }
AccelerationCard >> applyCardUsing: cardManager at: aGame to: objective [


	aGame playersColors do: [ :owner | cardManager activeCards addLast: (AccelerationCard owner: owner) ].
]

{ #category : #Effect }
AccelerationCard >> applyEffect [

	^ 1
]

{ #category : #Initialization }
AccelerationCard >> initializeOwner: anOwner [

	owners := anOwner.
]

{ #category : #Information }
AccelerationCard >> isPermanent [

	^ true
]

{ #category : #Information }
AccelerationCard >> owner [
	^owners
]

{ #category : #Information }
AccelerationCard >> toString [

	^ 'Acceleration'
]
