Class {
	#name : #CancellationCard,
	#superclass : #Object,
	#instVars : [
		'objective',
		'objectiveCard'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'Instance creation' }
CancellationCard class >> to: anObjectivePlayer ofCard: anObjectiveCard [

	^ self new initializeTo: anObjectivePlayer ofCard: anObjectiveCard
]

{ #category : #Effect }
CancellationCard >> applyCard: activeCardsCollection [

	| i cardCollection |
	i := 1.
	cardCollection := OrderedCollection new.
	activeCardsCollection isEmpty ifTrue: [ 
		Error signal: 'There are no permanent cards' ].
	activeCardsCollection do: [ :card | 
		(card toString = objectiveCard and: i = 1)
			ifTrue: [ i := 2 ]
			ifFalse: [ cardCollection addLast: card ] ].
	i = 1 ifTrue: [ 
		Error signal:
			'There are no that type of cards activate in this player' ].
	^ cardCollection
]

{ #category : #Initialization }
CancellationCard >> initializeTo: anObjectivePlayer ofCard: anObjectiveCard [

	objective := anObjectivePlayer.
	objectiveCard := anObjectiveCard
]

{ #category : #Information }
CancellationCard >> isPermanent [

	^ false
]

{ #category : #Information }
CancellationCard >> objective [
	^ objective
]

{ #category : #Information }
CancellationCard >> objectiveCard [
	^ objectiveCard
]

{ #category : #Information }
CancellationCard >> toString [

	^ 'Cancellation'
]
