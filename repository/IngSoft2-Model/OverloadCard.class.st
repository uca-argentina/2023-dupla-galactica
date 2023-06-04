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

{ #category : #Information }
OverloadCard >> addOwner: aPlayerColor [

	owners addLast: aPlayerColor
]

{ #category : #Effect }
OverloadCard >> applyCardAt: aGame using: aCardManager [

	| res |
	res := false.
	aCardManager activeCards do: [ :card | 
		card toString = 'Overload' ifTrue: [ 
			card addOwner: aCardManager objective.
			res := true ] ].
	res ifTrue: [ ^ self ].
	owners := OrderedCollection with: aCardManager objective.
	aCardManager activeCards addLast: self
]

{ #category : #Effect }
OverloadCard >> applyEffect [

	
	^(-2)
]

{ #category : #Information }
OverloadCard >> eliminateOwner: aPlayerColor [
	|i|
	i:=0.
	owners do: [ :owner | (owner = aPlayerColor and: i=0) ifTrue:[owners remove: owner. i:=1] ]
]

{ #category : #Initialization }
OverloadCard >> initializeOwner: anOwner [

	owners := OrderedCollection with: anOwner.
]

{ #category : #Information }
OverloadCard >> isOwner: aPlayerColor [

	^ owners anySatisfy: [ :owner | owner = aPlayerColor ]
]

{ #category : #Information }
OverloadCard >> isPermanent [

	^ true
]

{ #category : #Information }
OverloadCard >> owners [

	^ owners
]

{ #category : #Information }
OverloadCard >> toString [

	^ 'Overload'
]

{ #category : #Information }
OverloadCard >> transformTo: aCard [

	^ self
]
