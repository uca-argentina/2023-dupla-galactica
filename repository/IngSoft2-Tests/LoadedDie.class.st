Class {
	#name : #LoadedDie,
	#superclass : #Object,
	#instVars : [
		'valueManager'
	],
	#category : #'IngSoft2-Tests'
}

{ #category : #'Instance creation' }
LoadedDie class >> with: aValuesCollection [

	aValuesCollection do: [ :value | 
		value < 0 ifTrue: [ 
			Error signal: 'Cannot create with negative values at faces' ] ].
	aValuesCollection size < 3 ifTrue: [ 
		Error signal: 'Cannot create with faces less than 3' ].
	^ self new initializeWith: aValuesCollection
]

{ #category : #Initialization }
LoadedDie >> initializeWith: aValue [

	valueManager := QueueManager with: aValue
]

{ #category : #Information }
LoadedDie >> numberOfFaces [

	^ (valueManager valuesOnQueue).
]

{ #category : #Throw }
LoadedDie >> throw [

	| value |
	value := valueManager current.
	valueManager goNext.
	^ value
]
