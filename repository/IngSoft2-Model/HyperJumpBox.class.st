Class {
	#name : #HyperJumpBox,
	#superclass : #Object,
	#instVars : [
		'parsecs',
		'nextParsec'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'Instance creation' }
HyperJumpBox class >> with: aParsecsCollection [

	^ self new initializeWith: aParsecsCollection
]

{ #category : #Initialization }
HyperJumpBox >> createParsecs: possibleValues [

	| aParsecsCollection |
	aParsecsCollection := OrderedCollection new.
	possibleValues size atRandom to: possibleValues size atRandom do: [ 
	:i | aParsecsCollection addLast: (possibleValues at: i) ].

	aParsecsCollection isEmpty
		ifTrue: [ 
			aParsecsCollection addLast:
				(possibleValues at: possibleValues size atRandom) ]
		ifFalse: [ aParsecsCollection sort: [ :a :b | a > b ] ].
	
	^ aParsecsCollection
]

{ #category : #Effect }
HyperJumpBox >> effect: aBoard [

	aBoard nextOne
		effect:
		(self parsecs at: nextParsec) // (aBoard parsecs // aBoard length)
		check: aBoard length.
	self updateParsec
]

{ #category : #Initialization }
HyperJumpBox >> initializeWith: aParsecsCollection [

	parsecs:=self createParsecs: aParsecsCollection.
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
