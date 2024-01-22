Class {
	#name : #CardDealer,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #Cards }
CardDealer >> dealCards: aCardManager to: aColorsCollection [

	| idValue randomCardGenerator|
	randomCardGenerator := RandomCardGenerator new.
	idValue := 1.
	aColorsCollection do: [ :color | 
		aCardManager addCard: (randomCardGenerator createCard: idValue for: color).
		idValue := idValue + 1.
		aCardManager addCard: (randomCardGenerator createCard: idValue for: color).
		idValue := idValue + 1 ]
]
