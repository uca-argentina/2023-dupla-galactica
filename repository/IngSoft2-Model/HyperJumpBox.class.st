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
HyperJumpBox >> effect: aGame [

	aGame moveNext: (self parsecs at: (parsecManager nextOne)) // (aGame parsecs // (aGame boxes size)).
	parsecManager updateTurn.
]

{ #category : #Initialization }
HyperJumpBox >> initializeWith: aParsecsCollection [

	parsecs:=self createParsecs: aParsecsCollection.
	parsecManager:= TurnManager with: (parsecs size).
]

{ #category : #Information }
HyperJumpBox >> parsecs [

	^ parsecs
]
