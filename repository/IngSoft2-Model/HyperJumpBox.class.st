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

	self updateParsec.
	aBoard nextOne effect:
		(parsecs at: nextParsec) // (aBoard parsecs // aBoard length)
]

{ #category : #Initialization }
HyperJumpBox >> initializeWith: aParsecsCollection [ 
	parsecs:= aParsecsCollection.
	nextParsec:= 1.
]

{ #category : #Information }
HyperJumpBox >> parsecs [
	^ parsecs
]

{ #category : #Effect }
HyperJumpBox >> updateParsec [

	nextParsec := nextParsec == parsecs size
		              ifTrue: [ 1 ]
		              ifFalse: [ nextParsec + 1 ]
]
