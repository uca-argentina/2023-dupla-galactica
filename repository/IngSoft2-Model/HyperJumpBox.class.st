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
HyperJumpBox >> effect: aPlayerCollection affects: aPlayer parsecs: aValue [

	| position |
	position := (parsecs at: nextParsec) // aValue.
	self updateParsec.
	aPlayer effect: position.
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
