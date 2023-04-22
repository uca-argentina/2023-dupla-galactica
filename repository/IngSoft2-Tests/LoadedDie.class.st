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
LoadedDie class >> with: aValue [

	^ self new initializeWith: aValue
]

{ #category : #throw }
LoadedDie >> changeValue [

	positionValue := positionValue == self faces size
		                 ifTrue: [ 1 ]
		                 ifFalse: [ positionValue + 1 ]
]

{ #category : #information }
LoadedDie >> faces [

	^ faces.
]

{ #category : #initialization }
LoadedDie >> initializeWith: aValue [
	positionValue := 1.
	faces := aValue.
]

{ #category : #throw }
LoadedDie >> throw [
| value |
	value:= (self faces at: positionValue).
	self changeValue.
	^value.
]
