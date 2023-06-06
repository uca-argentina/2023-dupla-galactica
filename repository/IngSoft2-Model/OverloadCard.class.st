Class {
	#name : #OverloadCard,
	#superclass : #Object,
	#instVars : [
		'owner'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'Instance creation' }
OverloadCard class >> owner: anOwner [

	^ self new initializeOwner: anOwner
]

{ #category : #Effect }
OverloadCard >> applyCardUsing: cardManager at: aGame to: objective [

	| i |
	i := false.
	aGame playersColors do: [ :color | 
		color = objective ifTrue: [ i := true ] ].
	i ifFalse: [ Error signal: 'That is not a valid objective for an overload card' ].
	cardManager activeCards addLast: (OverloadCard owner: objective).
]

{ #category : #Effect }
OverloadCard >> applyEffect [

	
	^(-2)
]

{ #category : #Information }
OverloadCard >> equals: aCard [

	^ 'Overload' = aCard toString and: aCard owner = owner
]

{ #category : #Initialization }
OverloadCard >> initializeOwner: anOwner [

	owner := anOwner.
]

{ #category : #Information }
OverloadCard >> isPermanent [

	^ true
]

{ #category : #Information }
OverloadCard >> owner [

	^ owner
]

{ #category : #Information }
OverloadCard >> toString [

	^ 'Overload'
]
