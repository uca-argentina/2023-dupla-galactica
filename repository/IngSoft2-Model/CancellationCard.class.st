Class {
	#name : #CancellationCard,
	#superclass : #Object,
	#instVars : [
		'objectiveCard',
		'owners'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'Instance creation' }
CancellationCard class >> owner: anOwner [ 

^(self new) initializeOwner: anOwner
]

{ #category : #'Instance creation' }
CancellationCard class >> owner: anObjectivePlayer ofCard: anObjectiveCard [

	^ self new initializeOwner: anObjectivePlayer ofCard: anObjectiveCard
]

{ #category : #Initialization }
CancellationCard >> addOwner: aPlayerColor [

	owners addLast: aPlayerColor
]

{ #category : #Effect }
CancellationCard >> applyCardAt: aGame using: aCardManager [

	| i |
	i := 1.
	aCardManager activeCards do: [ :card | 
		(card toString = objectiveCard and:
			 (i = 1 and: (card isOwner: aCardManager objective))) ifTrue: [ 
			i := 2.
			card eliminateOwner: aCardManager objective ] ].
	
	aCardManager activeCards isEmpty ifTrue: [ 
		Error signal: 'There are no permanent cards' ].
	i = 1 ifTrue: [ 
		Error signal:
			'There are no that type of cards activate in this player' ]
]

{ #category : #Initialization }
CancellationCard >> eliminateOwner: aPlayerColor [
	|i|
	i:=0.
	owners do: [ :owner | (owner = aPlayerColor and: i=0) ifTrue:[owners remove: owner. i:=1] ]
]

{ #category : #Initialization }
CancellationCard >> initializeOwner: anOwner [

	owners := OrderedCollection with: anOwner.
]

{ #category : #Initialization }
CancellationCard >> initializeOwner: anOwner ofCard: anObjectiveCard [

	owners := OrderedCollection with: anOwner.
	objectiveCard := anObjectiveCard
]

{ #category : #Initialization }
CancellationCard >> isOwner: aPlayerColor [

	^ owners anySatisfy: [ :owner | owner = aPlayerColor ]
]

{ #category : #Information }
CancellationCard >> isPermanent [

	^ false
]

{ #category : #Information }
CancellationCard >> owners [
	^ owners
]

{ #category : #Information }
CancellationCard >> toString [

	^ 'Cancellation'
]

{ #category : #Information }
CancellationCard >> transformTo: aCard [

	^ self
]
