Class {
	#name : #TurnManager,
	#superclass : #Object,
	#instVars : [
		'max',
		'current',
		'values'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'Instance creation' }
TurnManager class >> with: aPlayersCollection [

	^ self new initializeWith: aPlayersCollection
]

{ #category : #ManageTurns }
TurnManager >> current [

	^ values at: current 
]

{ #category : #ManageTurns }
TurnManager >> goNext [

	current := current == max
		           ifTrue: [ 1 ]
		           ifFalse: [ current + 1 ]
]

{ #category : #Initialization }
TurnManager >> initializeWith: aValuesCollection [

	values	:= aValuesCollection.
	max := aValuesCollection size.
	current := 1
]

{ #category : #Information }
TurnManager >> valuesSize [

	^ max
]
