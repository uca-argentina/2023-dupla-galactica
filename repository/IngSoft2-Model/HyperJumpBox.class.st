Class {
	#name : #HyperJumpBox,
	#superclass : #Object,
	#instVars : [
		'parsecManager',
		'polarity'
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
HyperJumpBox >> changePolarity [

	polarity := polarity not
]

{ #category : #Information }
HyperJumpBox >> currentValue [

	^ parsecManager current
]

{ #category : #Effect }
HyperJumpBox >> effect: aGame [

	polarity
		ifTrue: [ 
			aGame moveCurrent:
				self currentValue parsecs nominalValue // aGame boxesByParsecs ]
		ifFalse: [ 
			aGame moveOthers:
				self currentValue parsecs nominalValue // aGame boxesByParsecs ].

	parsecManager goNext
]

{ #category : #Initialization }
HyperJumpBox >> initializeWith: aParsecCollection [

	| aParsecCollectionOrdered |
	aParsecCollectionOrdered := aParsecCollection sort: [ :value1 :value2 | 
		           value2 parsecs nominalValue < value1 parsecs nominalValue ].
	parsecManager := QueueManager with: aParsecCollectionOrdered.
	polarity := true
]
