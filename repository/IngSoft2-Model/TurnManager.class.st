Class {
	#name : #TurnManager,
	#superclass : #Object,
	#instVars : [
		'max',
		'current'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'Instance creation' }
TurnManager class >> with: anAmount [

	^ self new initializeWith: anAmount
]

{ #category : #ManageTurns }
TurnManager >> current [

	^ current
]

{ #category : #ManageTurns }
TurnManager >> goNext [

	current := current == max
		           ifTrue: [ 1 ]
		           ifFalse: [ current + 1 ]
]

{ #category : #Initialization }
TurnManager >> initializeWith: anAmount [

	max := anAmount.
	current := 1
]
