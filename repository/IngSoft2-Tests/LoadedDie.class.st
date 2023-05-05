Class {
	#name : #LoadedDie,
	#superclass : #Object,
	#instVars : [
		'faces',
		'positionValue'
	],
	#category : #'IngSoft2-Tests'
}

{ #category : #'instance creation' }
LoadedDie class >> with: aValuesCollection [
	aValuesCollection do: [:value| (value< 0) ifTrue: [Error signal: 'Cannot create with negative values at faces']].
	(aValuesCollection size < 3) ifTrue: [Error signal: 'Cannot create with faces less than 3'].
	^ self new initializeWith: aValuesCollection
]

{ #category : #Throw }
LoadedDie >> changeValue [

	positionValue := positionValue == self faces size
		                 ifTrue: [ 1 ]
		                 ifFalse: [ positionValue + 1 ]
]

{ #category : #Information }
LoadedDie >> faces [

	^ (faces).
]

{ #category : #Initialization }
LoadedDie >> initializeWith: aValue [
	positionValue := 1.
	faces := aValue.
]

{ #category : #Information }
LoadedDie >> numberOffaces [

	^ (faces size).
]

{ #category : #Throw }
LoadedDie >> throw [
| value |
	value:= (self faces at: positionValue).
	self changeValue.
	^value.
]
