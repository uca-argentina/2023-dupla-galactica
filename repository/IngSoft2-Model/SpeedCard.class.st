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
SpeedCard >> applyCardUsing: cardManager at: aGame to: objective [

	| i |
	i := false.
	aGame playersColors do: [ :color | 
		color = objective ifTrue: [ i := true ] ].
	i ifFalse: [ 
		Error signal:
			 'That is not a valid objective for a speed card' ].
	cardManager activeCards addLast: (SpeedCard owner: objective)
]

{ #category : #Effect }
SpeedCard >> applyEffect [

	^ 1
]

{ #category : #Information }
SpeedCard >> equals: aCard [

	^ 'Speed' = aCard toString and: aCard owner = owner
]

{ #category : #Initialization }
SpeedCard >> initializeOwner: anOwner [

	owner :=anOwner.
]

{ #category : #Information }
SpeedCard >> isPermanent [

	^ true
]

{ #category : #Information }
SpeedCard >> owner [

	^ owner
]

{ #category : #Information }
SpeedCard >> toString [

	^ 'Speed'
]
