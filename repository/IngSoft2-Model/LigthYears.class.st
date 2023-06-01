Class {
	#name : #LigthYears,
	#superclass : #Object,
	#instVars : [
		'nominalValue'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'Instance creation' }
LigthYears class >> worth: aNominalValue [
	^(self new) initializeWorth: aNominalValue
]

{ #category : #Initialization }
LigthYears >> initializeWorth: aNominalValue [

	nominalValue := aNominalValue
]

{ #category : #Information }
LigthYears >> lightYears [

	^ self
]

{ #category : #Information }
LigthYears >> nominalValue [

	^ nominalValue
]

{ #category : #Information }
LigthYears >> parsecs [

	^ Parsecs worth: nominalValue // 3
]
