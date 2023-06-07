Class {
	#name : #LigthYear,
	#superclass : #Object,
	#instVars : [
		'nominalValue'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'Instance creation' }
LigthYear class >> worth: aNominalValue [
	^(self new) initializeWorth: aNominalValue
]

{ #category : #Initialization }
LigthYear >> initializeWorth: aNominalValue [

	nominalValue := aNominalValue
]

{ #category : #Information }
LigthYear >> lightYears [

	^ self
]

{ #category : #Information }
LigthYear >> nominalValue [

	^ nominalValue
]

{ #category : #Information }
LigthYear >> parsecs [

	^ Parsec worth: nominalValue // 3
]
