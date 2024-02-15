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
CardsInPosetion >> add: aCard [

	cards addLast: aCard
]

{ #category : #Information }
CardsInPosetion >> cardsOf: players [

	^ players collect: [ :player | 
		  (cards select: [ :card | card isHolder: player color ]) size ]
]

{ #category : #Information }
CardsInPosetion >> hasBeenGiven: aCard [

	cards
		detect: [ :card | card = aCard ]
		ifFound: [ :card | ^ true ]
		ifNone: [ ^ false ]
]

{ #category : #Initialization }
CardsInPosetion >> initializeDeck [

	cards := OrderedCollection new
]

{ #category : #Cards }
CardsInPosetion >> takeOut: aCard [

	cards remove: aCard.
]
