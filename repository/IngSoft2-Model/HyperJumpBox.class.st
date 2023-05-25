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
HyperJumpBox >> currentValue [

	^ self parsecs at: parsecManager current
]

{ #category : #Effect }
HyperJumpBox >> effect: aGame [

	aGame moveCurrent:
		self currentValue // (aGame parsecs // aGame boxes size).

	parsecManager goNext
]

{ #category : #Initialization }
HyperJumpBox >> initializeWith: aParsecsCollection [

	parsecs := aParsecsCollection.
	parsecManager := TurnManager with: parsecs size
]

{ #category : #Information }
HyperJumpBox >> parsecs [

	^ parsecs
]
