Class {
	#name : #AccelerationCard,
	#superclass : #Object,
	#instVars : [
		'holder'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'Instance creation' }
AccelerationCard class >> holder: aHolder [

	^ self new initializeHolder: aHolder
]

{ #category : #Information }
AccelerationCard >> = aCard [

	(aCard isKindOf: self class)
		ifTrue: [ ^ aCard holder = holder ]
		ifFalse: [ ^ false ]
]

{ #category : #Effect }
AccelerationCard >> applyCardUsing: cardManager at: aGame to: anObjective [

	anObjective = 'all' ifFalse: [ 
		Error signal: 'The objective must be all' ].
	aGame playersColors do: [ :color | 
		cardManager activeCard: (self class holder: color) ]
]

{ #category : #Effect }
AccelerationCard >> applyEffect [

	^ 1
]

{ #category : #Effect }
AccelerationCard >> generalObjective [

	^ true.
]

{ #category : #Information }
AccelerationCard >> haveEffect [

	^ true
]

{ #category : #Information }
AccelerationCard >> holder [
	^holder
]

{ #category : #Initialization }
AccelerationCard >> initializeHolder: aHolder [

	holder := aHolder.
]

{ #category : #Information }
AccelerationCard >> isPermanent [

	^ true
]
