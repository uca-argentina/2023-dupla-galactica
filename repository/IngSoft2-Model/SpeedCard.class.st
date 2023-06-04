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
SpeedCard >> applyCardAt: aGame using: aCardManager [

	| res |
	res := false.
	aCardManager activeCards do: [ :card | 
		card toString = 'Speed' ifTrue: [ 
			card addOwner: aCardManager objective.
			res := true ] ].
	res ifTrue: [ ^ self ].
	owners := OrderedCollection with: aCardManager objective.
	aCardManager activeCards addLast: self
]

{ #category : #Effect }
SpeedCard >> applyEffect [

	^ 1
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
SpeedCard >> isOwner: aPlayerColor [

	^ owners anySatisfy: [ :owner | owner = aPlayerColor ]
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
