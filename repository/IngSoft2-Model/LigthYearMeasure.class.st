Class {
	#name : #LigthYearMeasure,
	#superclass : #Object,
	#instVars : [
		'nominalValue'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'Instance creation' }
LigthYearMeasure class >> worth: aNominalValue [

	^ self new initializeWorth: aNominalValue
]

{ #category : #Initialization }
LigthYearMeasure >> initializeWorth: aNominalValue [

	nominalValue := aNominalValue
]

{ #category : #Information }
LigthYearMeasure >> lightYears [

	^ self
]

{ #category : #Information }
LigthYearMeasure >> nominalValue [

	^ nominalValue
]

{ #category : #Information }
LigthYearMeasure >> parsecs [

	^ ParsecMeasure worth: nominalValue // 3
]
