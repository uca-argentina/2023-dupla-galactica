Class {
	#name : #HyperJumpBox,
	#superclass : #Object,
	#instVars : [
		'parsecs',
		'parsecManager',
		'probabilitie'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'Instance creation' }
HyperJumpBox class >> with: aParsecsCollection [

	^ self new initializeWith: aParsecsCollection
]

{ #category : #'Instance creation' }
HyperJumpBox class >> with: aParsecCollection chance: aProbabilitie [

	^ self new initializeWith: aParsecCollection chance: aProbabilitie
]

{ #category : #Effect }
HyperJumpBox >> currentValue [

	^ self parsecs at: parsecManager current
]

{ #category : #Effect }
HyperJumpBox >> effect: aGame [

	aGame moveCurrent:
		self currentValue // (aGame parsecs // aGame boxes size).

	parsecManager goNext
]

{ #category : #Initialization }
HyperJumpBox >> initializeWith: aParsecCollection chance: aProbabilitie [

	probabilitie := aProbabilitie.
	parsecs := aParsecCollection.
	parsecManager := TurnManager with: parsecs size
]

{ #category : #Information }
HyperJumpBox >> parsecs [

	^ parsecs
]

{ #category : #Information }
HyperJumpBox >> probabilitie [
	^ probabilitie
]
