Class {
	#name : #CardsInPosetion,
	#superclass : #Object,
	#instVars : [
		'cards'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'Instance creation' }
CardsInPosetion class >> createDeck [

	^ self new initializeDeck
]

{ #category : #Cards }
CardsInPosetion >> add: aCardInPlayerHand [

	cards addLast: aCardInPlayerHand
]

{ #category : #Information }
CardsInPosetion >> cardsOf: players [

	^ players collect: [ :player | 
		  (cards select: [ :hand | hand holder = player color ]) size ]
]

{ #category : #Information }
CardsInPosetion >> hasBeenGiven: aCardInHand [

	cards
		detect: [ :hand | 
			hand card = aCardInHand card and: hand holder = aCardInHand holder ]
		ifFound: [ :hand | ^ true ]
		ifNone: [ ^ false ]
]

{ #category : #Initialization }
CardsInPosetion >> initializeDeck [

	cards := OrderedCollection new
]

{ #category : #Cards }
CardsInPosetion >> takeOut: aCardInHand [

	cards remove: (cards detect: [ :hand | 
			 hand card = aCardInHand card and: hand holder = aCardInHand holder ])
]
