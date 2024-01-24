Class {
	#name : #RandomCardBox,
	#superclass : #Object,
	#instVars : [
		'cards'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'Instance creation' }
RandomCardBox class >> withCards: aCollection [ 
	^ self new intializeUsing: aCollection.
]

{ #category : #Effect }
RandomCardBox >> effect: aGame [

	| randomCardGenerator  |
	
	randomCardGenerator := RandomCardGenerator dealing: cards.
	aGame addCard: (randomCardGenerator
			 createCard: aGame numberOfCards + 1
			 for: aGame currentPlayer color)
]

{ #category : #Initialization }
RandomCardBox >> intializeUsing: aCollection [

	cards := aCollection
]
