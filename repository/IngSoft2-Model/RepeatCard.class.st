Class {
	#name : #RepeatCard,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #Effect }
RepeatCard >> applyCards: aGame [

	aGame repeatEffectTo: aGame objective
]

{ #category : #Information }
RepeatCard >> toString [
	^'Repeat'.
]
