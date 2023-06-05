Class {
	#name : #HyperJumpBox,
	#superclass : #Object,
	#instVars : [
		'parsecs',
		'parsecManager',
		'probability'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'Instance creation' }
HyperJumpBox class >> with: aParsecCollection chance: aProbabilitie [

	aParsecCollection isEmpty ifTrue: [ 
		Error signal: 'There are no values to use in the hyper jump box' ].
	^ self new initializeWith: aParsecCollection chance: aProbabilitie
]

{ #category : #Effect }
HyperJumpBox >> currentValue [

	^ self parsecs at: parsecManager current
]

{ #category : #Effect }
HyperJumpBox >> effect: aGame [

	aGame moveCurrent: self currentValue parsecs nominalValue
		// (aGame parsecs nominalValue // aGame boxes size).

	parsecManager goNext
]

{ #category : #Initialization }
HyperJumpBox >> initializeWith: aParsecCollection chance: aProbabilitie [

	probability := aProbabilitie.
	parsecs := aParsecCollection.
	parsecManager := TurnManager with: parsecs size
]

{ #category : #Information }
HyperJumpBox >> parsecs [

	^ parsecs
]

{ #category : #Information }
HyperJumpBox >> probability [
	^ probability
]
