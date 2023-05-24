Class {
	#name : #LoadedDie,
	#superclass : #Object,
	#instVars : [
		'faces',
		'valueManager'
	],
	#category : #'IngSoft2-Tests'
}

{ #category : #'instance creation' }
LoadedDie class >> with: aValuesCollection [
	aValuesCollection do: [:value| (value< 0) ifTrue: [Error signal: 'Cannot create with negative values at faces']].
	(aValuesCollection size < 3) ifTrue: [Error signal: 'Cannot create with faces less than 3'].
	^ self new initializeWith: aValuesCollection
]

{ #category : #Information }
LoadedDie >> faces [

	^ (faces).
]

{ #category : #Initialization }
LoadedDie >> initializeWith: aValue [
	faces := aValue.
	valueManager:= TurnManager with: (aValue size).
]

{ #category : #Information }
LoadedDie >> numberOffaces [

	^ (faces size).
]

{ #category : #Throw }
LoadedDie >> throw [
	| value |
	value:= (self faces at: (valueManager nextOne)).
	valueManager updateTurn.
	^value.
]
