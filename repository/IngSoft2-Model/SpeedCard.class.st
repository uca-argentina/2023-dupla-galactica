Class {
	#name : #SpeedCard,
	#superclass : #Object,
	#instVars : [
		'owner',
		'id'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'Instance creation' }
SpeedCard class >> owner: anOwner number: anId [

	^ self new initializeOwner: anOwner number: anId
]

{ #category : #Information }
SpeedCard >> = aCard [

	(aCard isKindOf: self class)
		ifTrue: [ ^ id = aCard id and: aCard owner = owner ]
		ifFalse: [ ^ false ]
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
	cardManager activeCards addLast: (SpeedCard owner: objective number: id)
]

{ #category : #Effect }
SpeedCard >> applyEffect [

	^ 1
]

{ #category : #Initialization }
SpeedCard >> id [

	^ id
]

{ #category : #Initialization }
SpeedCard >> initializeOwner: anOwner number: anId [

	owner := anOwner.
	id:= anId.
]

{ #category : #Information }
SpeedCard >> isPermanent [

	^ true
]

{ #category : #Information }
SpeedCard >> owner [

	^ owner
]
