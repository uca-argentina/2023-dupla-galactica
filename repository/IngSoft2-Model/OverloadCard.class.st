Class {
	#name : #OverloadCard,
	#superclass : #Object,
	#instVars : [
		'owner',
		'objective'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'Instance creation' }
OverloadCard class >> owner: anOwner [

	^ self new initializeOwner: anOwner
]

{ #category : #Effect }
OverloadCard >> applyCard: aGame to: aPlayerColor [

	owner := aPlayerColor.
	aGame activeCards addLast: self.
]

{ #category : #Effect }
OverloadCard >> applyEffect: aPosition [

	^ aPosition - 2
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

{ #category : #Information }
OverloadCard >> transformTo: aCard [

	^ self
]
