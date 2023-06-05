Class {
	#name : #OverloadCard,
	#superclass : #Object,
	#instVars : [
		'owners'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'Instance creation' }
OverloadCard class >> owner: anOwner [

	^ self new initializeOwner: anOwner
]

{ #category : #Effect }
OverloadCard >> applyCardUsing: cardManager at: aGame to: objective [

	cardManager activeCards addLast: (OverloadCard owner: objective).
]

{ #category : #Effect }
OverloadCard >> applyEffect [

	
	^(-2)
]

{ #category : #Initialization }
OverloadCard >> initializeOwner: anOwner [

	owners := anOwner.
]

{ #category : #Information }
OverloadCard >> isPermanent [

	^ true
]

{ #category : #Information }
OverloadCard >> owner [

	^ owners
]

{ #category : #Information }
OverloadCard >> toString [

	^ 'Overload'
]
