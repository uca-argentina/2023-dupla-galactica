Class {
	#name : #CancellationCard,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #'Instance creation' }
CancellationCard class >> initializeNew [

	^ self new intializeNew
]

{ #category : #Initialization }
CancellationCard >> = aCard [

	^ aCard isKindOf: self class
]

{ #category : #Effect }
CancellationCard >> applyCardUsing: cardManager to: anObjectiveCardInHand at: aGame [

	cardManager desactivate: anObjectiveCardInHand
]

{ #category : #Information }
CancellationCard >> haveEffect [

	^ true
]

{ #category : #Initialization }
CancellationCard >> intializeNew [

	
]

{ #category : #Information }
CancellationCard >> isPermanent [

	^ false
]
