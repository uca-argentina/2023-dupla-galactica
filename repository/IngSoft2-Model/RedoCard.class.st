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
RedoCard >> objective [
	^ objective
]

{ #category : #Information }
RedoCard >> toString [

	^ 'Redo'
]

{ #category : #Effect }
RedoCard >> transformTo: aCard [

	| card |
	card := aCard toString = 'Cancellation'
		        ifTrue: [ 
		        CancellationCard to: objective ofCard: objectiveCard ]
		        ifFalse: [ 
			        aCard toString = 'Acceleration'
				        ifTrue: [ AccelerationCard new ]
				        ifFalse: [ 
					        aCard toString = 'Speed'
						        ifTrue: [ SpeedCard to: objective ]
						        ifFalse: [ 
							        aCard toString = 'Overload'
								        ifTrue: [ OverloadCard to: objective ]
								        ifFalse: [ RepeatCard to: objective ] ] ] ].
	^card.
]
