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
	aParsecsCollection sort: [:a :b | a>b].
	^(self new) initializeWith: aParsecsCollection.
]

{ #category : #Effect }
HyperJumpBox >> effect: aBoard [
	aBoard nextOne effect:
		(parsecs at: nextParsec) // (aBoard parsecs // aBoard length).
	self updateParsec.
]

{ #category : #Initialization }
HyperJumpBox >> initializeWith: aParsecsCollection [

	parsecs := OrderedCollection new.
	aParsecsCollection size atRandom to: aParsecsCollection size atRandom
	do: [ :i | parsecs addLast: (aParsecsCollection at: i) ].
	parsecs isEmpty ifTrue: [ 
		parsecs addLast:
			(aParsecsCollection at: aParsecsCollection size atRandom) ].
	parsecs sort: [ :a :b | a > b ].
	nextParsec := 1
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
