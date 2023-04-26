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

{ #category : #Throw }
LoadedDie >> changeValue [

	positionValue := positionValue == self faces size
		                 ifTrue: [ 1 ]
		                 ifFalse: [ positionValue + 1 ]
]

{ #category : #Information }
LoadedDie >> faces [

	^ faces.
]

{ #category : #Initialization }
LoadedDie >> initializeWith: aValue [
	positionValue := 1.
	faces := aValue.
]

{ #category : #Throw }
LoadedDie >> throw [
| value |
	value:= (self faces at: positionValue).
	self changeValue.
	^value.
]
