Class {
	#name : #QueueManager,
	#superclass : #Object,
	#instVars : [
		'max',
		'current',
		'values'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'Instance creation' }
QueueManager class >> with: aPlayersCollection [

	^ self new initializeWith: aPlayersCollection
]

{ #category : #ManageTurns }
QueueManager >> current [

	^ values at: current 
]

{ #category : #ManageTurns }
QueueManager >> goNext [

	current := current == max
		           ifTrue: [ 1 ]
		           ifFalse: [ current + 1 ]
]

{ #category : #Initialization }
QueueManager >> initializeWith: aValuesCollection [

	values	:= aValuesCollection.
	max := aValuesCollection size.
	current := 1
]

{ #category : #Information }
QueueManager >> valuesOnQueue [

	^ max
]
