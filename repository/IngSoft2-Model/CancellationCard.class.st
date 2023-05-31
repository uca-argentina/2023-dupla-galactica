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
CancellationCard >> applyCards: aGame [

	(aGame findPlayer: objective) applyCancellCard: objectiveCard
]

{ #category : #Information }
CancellationCard >> changeObjectivePlayer: anObjectivePlayer andCard: anObjectiveCard [

	objective := anObjectivePlayer.
	objectiveCard := anObjectiveCard
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
CancellationCard >> toString [

	^ 'Cancellation'
]
