Class {
	#name : #HyperJumpBox,
	#superclass : #Object,
	#instVars : [
		'parsecs',
		'nextParsec'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
HyperJumpBox class >> with: aParsecsCollection [ 
	^(self new) initializeWith: aParsecsCollection.
]

{ #category : #Effect }
HyperJumpBox >> effect: aBoard [
	| position |
	position := (parsecs at: nextParsec) // ((aBoard parsecsAmount) // (aBoard length)).
	self updateParsec.
	(aBoard players at: aBoard nextOne) effect: position.
]

{ #category : #Initialization }
HyperJumpBox >> initializeWith: aParsecsCollection [ 
	parsecs:= aParsecsCollection.
	nextParsec:= 1.
]

{ #category : #Effect }
HyperJumpBox >> updateParsec [

	nextParsec := nextParsec == parsecs size
		              ifTrue: [ 1 ]
		              ifFalse: [ nextParsec + 1 ]
]
