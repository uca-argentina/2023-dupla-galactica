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

{ #category : #Information }
SpeedCard >> addOwner: aPlayerColor [

	owners addLast: aPlayerColor
]

{ #category : #Effect }
SpeedCard >> applyCard: aGame to: aPlayerColor [

	| res |
	res := false.
	aGame activeCards do: [ :card | 
		card toString = 'Speed' ifTrue: [ 
			card addOwner: aPlayerColor.
			res := true ] ].
	res ifTrue: [ ^ self ].
	owners := OrderedCollection with: aPlayerColor.
	aGame activeCards addLast: self
]

{ #category : #Effect }
SpeedCard >> applyEffect: aPosition [

	^ aPosition + 1
]

{ #category : #Information }
SpeedCard >> eliminateOwner: aPlayerColor [
	|i|
	i:=0.
	owners do: [ :owner | (owner = aPlayerColor and: i=0) ifTrue:[owners remove: owner. i:=1] ]
]

{ #category : #Initialization }
SpeedCard >> initializeOwner: anOwner [

	owners := OrderedCollection with: anOwner.
]

{ #category : #Information }
SpeedCard >> isPermanent [

	^ true
]

{ #category : #Information }
SpeedCard >> owners [

	^ owners
]

{ #category : #Information }
SpeedCard >> toString [

	^ 'Speed'
]

{ #category : #Information }
SpeedCard >> transformTo: aCard [

	^ self
]
