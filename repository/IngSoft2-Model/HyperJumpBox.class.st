Class {
	#name : #HyperJumpBox,
	#superclass : #Object,
	#instVars : [
		'parsecs',
		'parsecManager'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'Instance creation' }
HyperJumpBox class >> with: aParsecsCollection [

	^ self new initializeWith: aParsecsCollection
]

{ #category : #Effect }
HyperJumpBox >> effect: aGame [

	aGame moveNext: (self parsecs at: (parsecManager current)) // (aGame parsecs // (aGame boxes size)).
	parsecManager updateTurn.
]

{ #category : #Initialization }
HyperJumpBox >> initializeWith: aParsecsCollection [

	parsecs:=aParsecsCollection.
	parsecManager:= TurnManager with: (parsecs size).
]

{ #category : #Information }
HyperJumpBox >> parsecs [

	^ parsecs
]
