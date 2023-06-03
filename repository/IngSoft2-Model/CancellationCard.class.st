Class {
	#name : #CancellationCard,
	#superclass : #Object,
	#instVars : [
		'objectiveCard',
		'owner'
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

{ #category : #Effect }
CancellationCard >> applyCard: aGame to: aPlayerColor [

	| i |
	i := 1.
	aGame activeCards isEmpty ifTrue: [ 
		Error signal: 'There are no permanent cards' ].
	aGame activeCards do: [ :card | 
		(card toString = objectiveCard and: (i = 1 and: aPlayerColor = card owner))
			ifTrue: [ i := 2. aGame activeCards remove: card]].
	i = 1 ifTrue: [ 
		Error signal:
			'There are no that type of cards activate in this player' ].
]

{ #category : #Initialization }
CancellationCard >> initializeOwner: anOwner [

	owner := anOwner
]

{ #category : #Initialization }
CancellationCard >> initializeOwner: anOwner ofCard: anObjectiveCard [

	owner := anOwner.
	objectiveCard := anObjectiveCard
]

{ #category : #Information }
CancellationCard >> isPermanent [

	^ false
]

{ #category : #Information }
CancellationCard >> objectiveCard [
	^ objectiveCard
]

{ #category : #Information }
CancellationCard >> owner [
	^ owner
]

{ #category : #Information }
CancellationCard >> toString [

	^ 'Cancellation'
]

{ #category : #Information }
CancellationCard >> transformTo: aCard [

	^ self
]
