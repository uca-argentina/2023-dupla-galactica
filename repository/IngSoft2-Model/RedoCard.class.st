Class {
	#name : #RedoCard,
	#superclass : #Object,
	#instVars : [
		'objectiveCard',
		'owner'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'Instance creation' }
RedoCard class >> owner: anObjectivePlayer [

	^ self new initializeOwner: anObjectivePlayer
]

{ #category : #'Instance creation' }
RedoCard class >> owner: anObjectivePlayer ofCard: anObjectiveCard [

	^ self new initializeOwner: anObjectivePlayer ofCard: anObjectiveCard
]

{ #category : #Initialization }
RedoCard >> initializeOwner: anOwner [

	owner := anOwner
]

{ #category : #Initialization }
RedoCard >> initializeOwner: anObjectivePlayer ofCard: anObjectiveCard [

	owner := anObjectivePlayer.
	objectiveCard := anObjectiveCard
]

{ #category : #Information }
RedoCard >> isPermanent [

	^ false
]

{ #category : #Information }
RedoCard >> owner [
	^ owner
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
		        CancellationCard owner: owner ofCard: objectiveCard ]
		        ifFalse: [ 
			        aCard toString = 'Acceleration'
				        ifTrue: [ AccelerationCard new ]
				        ifFalse: [ 
					        aCard toString = 'Speed'
						        ifTrue: [ SpeedCard owner: owner ]
						        ifFalse: [ 
							        aCard toString = 'Overload'
								        ifTrue: [ OverloadCard owner: owner ]
								        ifFalse: [ RepeatCard owner: owner ] ] ] ].
	^card.
]
