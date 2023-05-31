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

	| card |
	card := aGame lastCardPlay toString = 'Cancellation'
		        ifTrue: [ 
		        CancellationCard to: objective ofCard: objectiveCard ]
		        ifFalse: [ 
			        aGame lastCardPlay toString = 'Acceleration'
				        ifTrue: [ AccelerationCard new ]
				        ifFalse: [ 
					        aGame lastCardPlay toString = 'Speed'
						        ifTrue: [ SpeedCard to: objective ]
						        ifFalse: [ 
							        aGame lastCardPlay toString = 'Overload'
								        ifTrue: [ OverloadCard to: objective ]
								        ifFalse: [ RepeatCard to: objective ] ] ] ].
	card applyCards: aGame
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
