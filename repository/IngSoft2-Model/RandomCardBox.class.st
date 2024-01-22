Class {
	#name : #RandomCardBox,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #Effect }
RandomCardBox >> effect: aGame [

	| randomCardGenerator |
	randomCardGenerator := RandomCardGenerator new.

	aGame addCard: (randomCardGenerator
			 createCard: aGame numberOfCards + 1
			 for: aGame currentPlayer color)
]
