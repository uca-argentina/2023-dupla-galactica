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
AccelerationCard >> addOwner: aPlayerColor [

	owners addLast: aPlayerColor
]

{ #category : #Effect }
AccelerationCard >> applyCard: aGame to: aPlayerColor [

	| res |
	res := false.
	aGame activeCards do: [ :card | 
		card toString = 'Acceleration' ifTrue: [ 
			card addOwner: aPlayerColor.
			res := true ] ].
	res ifTrue: [ ^ self ].
	owners := OrderedCollection with: aPlayerColor.
	aGame activeCards addLast: self
]

{ #category : #Effect }
AccelerationCard >> applyEffect: aPosition [

	^ aPosition + 1
]

{ #category : #Information }
AccelerationCard >> eliminateOwner: aPlayerColor [
	|i|
	i:=0.
	owners do: [ :owner | (owner = aPlayerColor and: i=0) ifTrue:[owners remove: owner. i:=1] ]
]

{ #category : #Initialization }
AccelerationCard >> initializeOwner: anOwner [

	owners := OrderedCollection with: anOwner.
]

{ #category : #Information }
AccelerationCard >> isPermanent [

	^ true
]

{ #category : #Information }
AccelerationCard >> owners [
	^owners
]

{ #category : #Information }
AccelerationCard >> toString [

	^ 'Acceleration'
]

{ #category : #Information }
AccelerationCard >> transformTo: aCard [

	^ self
]
