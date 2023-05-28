Class {
	#name : #CancellationCard,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #Effect }
CancellationCard >> applyCards: aGame [

	aGame objective applyCancellCard: (aGame cardObjective)
]

{ #category : #Information }
CancellationCard >> toString [

	^ 'Cancellation'
]
