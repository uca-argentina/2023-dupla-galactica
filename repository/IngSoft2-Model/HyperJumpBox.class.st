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
HyperJumpBox class >> with: aParsecCollection [

	aParsecCollection isEmpty ifTrue: [ 
		Error signal: 'There are no values to use in the hyper jump box' ].
	^ self new initializeWith: aParsecCollection
]

{ #category : #Effect }
HyperJumpBox >> currentValue [

	^ parsecs at: parsecManager current
]

{ #category : #Effect }
HyperJumpBox >> effect: aGame [

	aGame moveCurrent: self currentValue parsecs nominalValue
		// (aGame parsecs nominalValue // aGame boxes size).

	parsecManager goNext
]

{ #category : #Initialization }
HyperJumpBox >> initializeWith: aParsecCollection [

	parsecs := aParsecCollection.
	parsecManager := TurnManager with: parsecs size
]
