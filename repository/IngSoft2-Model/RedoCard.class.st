Class {
	#name : #RedoCard,
	#superclass : #Object,
	#instVars : [
		'objectiveCard',
		'owners'
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

{ #category : #Effect }
RedoCard >> addOwner: aPlayerColor [

	owners addLast: aPlayerColor
]

{ #category : #Information }
RedoCard >> eliminateOwner: aPlayerColor [
	|i|
	i:=0.
	owners do: [ :owner | (owner = aPlayerColor and: i=0) ifTrue:[owners remove: owner. i:=1] ]
]

{ #category : #Initialization }
RedoCard >> initializeOwner: anOwner [

	owners := OrderedCollection with: anOwner.
]

{ #category : #Initialization }
RedoCard >> initializeOwner: anObjectivePlayer ofCard: anObjectiveCard [

	owners := OrderedCollection with: anObjectivePlayer.
	objectiveCard := anObjectiveCard
]

{ #category : #Information }
RedoCard >> isOwner: aPlayerColor [

	^ owners anySatisfy: [ :owner | owner = aPlayerColor ]
]

{ #category : #Information }
RedoCard >> isPermanent [

	^ false
]

{ #category : #Information }
RedoCard >> owners [
	^ owners
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
		        CancellationCard owner: owners ofCard: objectiveCard ]
		        ifFalse: [ 
			        aCard toString = 'Acceleration'
				        ifTrue: [ AccelerationCard new ]
				        ifFalse: [ 
					        aCard toString = 'Speed'
						        ifTrue: [ SpeedCard owner: owners ]
						        ifFalse: [ 
							        aCard toString = 'Overload'
								        ifTrue: [ OverloadCard owner: owners ]
								        ifFalse: [ RepeatCard owner: owners ] ] ] ].
	^card.
]
