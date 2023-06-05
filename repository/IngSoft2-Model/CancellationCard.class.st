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

{ #category : #Effect }
CancellationCard >> applyCardUsing: cardManager at: aGame to: objective [

	| i |
	i := 1.
	cardManager activeCards isEmpty ifTrue: [ 
		Error signal: 'There are no permanent cards' ].

	cardManager activeCards do: [ :card | 
		(i == 1) ifTrue: [
			(card toString = cardManager objectiveCard and: card owner = objective) ifTrue: [ 
			i := 2.
			cardManager activeCards remove: card ]].
		].
	i = 1 ifTrue: [ 
		Error signal:
			'There are no that type of cards activate in this player' ]
]

{ #category : #Initialization }
CancellationCard >> initializeOwner: anOwner [

	owners := anOwner.
]

{ #category : #Information }
CancellationCard >> isPermanent [

	^ false
]

{ #category : #Information }
CancellationCard >> owner [
	^ owners
]

{ #category : #Information }
CancellationCard >> toString [

	^ 'Cancellation'
]
