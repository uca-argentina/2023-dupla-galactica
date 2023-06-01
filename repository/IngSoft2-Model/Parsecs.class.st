Class {
	#name : #Parsecs,
	#superclass : #Object,
	#instVars : [
		'nominalValue'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'Instance creation' }
Parsecs class >> worth: aNominalValue [

	^ self new initializeWith: aNominalValue
]

{ #category : #Initialization }
Parsecs >> initializeWith: aNominalValue [

	nominalValue := aNominalValue
]

{ #category : #Information }
Parsecs >> lightYears [

	^ LigthYears worth: nominalValue * 3
]

{ #category : #Information }
Parsecs >> nominalValue [

	^ nominalValue
]

{ #category : #Information }
Parsecs >> parsecs [

	^ self
]
