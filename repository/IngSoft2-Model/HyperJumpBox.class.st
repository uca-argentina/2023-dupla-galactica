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

{ #category : #Effect }
HyperJumpBox >> effect: aDuplaGalacticaGame [

	polarity
		ifTrue: [ 
			aDuplaGalacticaGame moveCurrent:
				parsecManager current parsecs nominalValue
				// aDuplaGalacticaGame boxesByParsecs ]
		ifFalse: [ 
			aDuplaGalacticaGame moveOthers:
				parsecManager current parsecs nominalValue
				// aDuplaGalacticaGame boxesByParsecs ].
	parsecManager goNext
]

{ #category : #Initialization }
HyperJumpBox >> initializeWith: aParsecsCollection [

	| aParsecsCollectionOrdered |
	aParsecsCollectionOrdered := aParsecsCollection sort: [ :value1 :value2 | 
		                             value2 parsecs nominalValue
		                             < value1 parsecs nominalValue ].
	parsecManager := QueueManager with: aParsecsCollectionOrdered.
	polarity := true
]

{ #category : #Effect }
HyperJumpBox >> resetPolarity [

	polarity := true
]
