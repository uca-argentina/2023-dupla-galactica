Class {
	#name : #NullCard,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #Effect }
NullCard >> applyCardUsing: cardManager to: anObjectiveCard at: aGame [

	Error signal:
		'Redo card cannot be played because there are no cards that have been played before'
]
