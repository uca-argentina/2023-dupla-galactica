Class {
	#name : #Parsec,
	#superclass : #Object,
	#instVars : [
		'nominalValue'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'Instance creation' }
Parsec class >> worth: aNominalValue [

	^ self new initializeWith: aNominalValue
]

{ #category : #Initialization }
Parsec >> initializeWith: aNominalValue [

	nominalValue := aNominalValue
]

{ #category : #Information }
Parsec >> lightYears [

	^ LigthYear worth: nominalValue * 3
]

{ #category : #Information }
Parsec >> nominalValue [

	^ nominalValue
]

{ #category : #Information }
Parsec >> parsecs [

	^ self
]
