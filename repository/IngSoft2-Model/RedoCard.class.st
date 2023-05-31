Class {
	#name : #RedoCard,
	#superclass : #Object,
	#instVars : [
		'objective',
		'objectiveCard'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'Instance creation' }
RedoCard class >> to: anObjectivePlayer [

	^ self new initializeTo: anObjectivePlayer
]

{ #category : #'Instance creation' }
RedoCard class >> to: anObjectivePlayer ofCard: anObjectiveCard [

	^ self new initializeTo: anObjectivePlayer ofCard: anObjectiveCard
]

{ #category : #Effect }
RedoCard >> applyCards: aGame [

	aGame lastCardPlay toString = 'Cancellation'
		ifTrue: [ aGame lastCardPlay changeObjectivePlayer: objective andCard: objectiveCard ]
		ifFalse: [ aGame lastCardPlay changeObjective: objective ].
	aGame lastCardPlay applyCards: aGame
]

{ #category : #Initialization }
RedoCard >> initializeTo: anObjectivePlayer [

	objective := anObjectivePlayer
]

{ #category : #Initialization }
RedoCard >> initializeTo: anObjectivePlayer ofCard: anObjectiveCard [

	objective := anObjectivePlayer.
	objectiveCard := anObjectiveCard
]

{ #category : #Information }
RedoCard >> isPermanent [

	^ false
]

{ #category : #Information }
RedoCard >> toString [

	^ 'Redo'
]
