Class {
	#name : #CardsInPosetionDeck,
	#superclass : #Object,
	#instVars : [
		'playersHands'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'Instance creation' }
CardsInPosetionDeck class >> createDeck [

	^ self new initializeDeck
]

{ #category : #Cards }
CardsInPosetionDeck >> add: aCardInAPlayerHand [

	playersHands addLast: aCardInAPlayerHand
]

{ #category : #Information }
CardsInPosetionDeck >> cardsOf: aPlayersCollection [

	^ aPlayersCollection collect: [ :player | 
		  (playersHands select: [ :hand | hand holder = player color ]) size ]
]

{ #category : #Information }
CardsInPosetionDeck >> hasBeenGiven: aCardInAPlayerHand [

	playersHands
		detect: [ :hand | 
			hand card = aCardInAPlayerHand card and:
				hand holder = aCardInAPlayerHand holder ]
		ifFound: [ :hand | ^ true ]
		ifNone: [ ^ false ]
]

{ #category : #Initialization }
CardsInPosetionDeck >> initializeDeck [

	playersHands := OrderedCollection new
]

{ #category : #Cards }
CardsInPosetionDeck >> takeOut: aCardInAPlayerHand [

	playersHands remove: (playersHands detect: [ :hand | 
			 hand card = aCardInAPlayerHand card and:
				 hand holder = aCardInAPlayerHand holder ])
]
