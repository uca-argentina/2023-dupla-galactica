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
AccelerationCard >> applyCardAt: aGame using: aCardManager [

	| res |
	res := false.
	aCardManager activeCards do: [ :card | 
		card toString = 'Acceleration' ifTrue: [ 
			aGame playersColors do: [:playerColor | card addOwner: playerColor].
			res := true ] ].
	res ifTrue: [ ^ self ].
	owners := aGame playersColors.
	aCardManager activeCards addLast: self
]

{ #category : #Effect }
AccelerationCard >> applyEffect [

	^ 1
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
AccelerationCard >> isOwner: aPlayerColor [

	^ owners anySatisfy: [ :owner | owner = aPlayerColor ]
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
