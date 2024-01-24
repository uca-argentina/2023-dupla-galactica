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
	^ self new initializeDeck.
]

{ #category : #'Changing cards' }
CardsInPosetion >> addCard: aCard [

	cards addLast: aCard
]

{ #category : #'Changing cards' }
CardsInPosetion >> amount [

	^ cards size
]

{ #category : #'Changing cards' }
CardsInPosetion >> cardsOf: players [

	^ players collect: [ :player | 
		  (cards select: [ :card | card owner = player color ])
			  size ]
]

{ #category : #'Changing cards' }
CardsInPosetion >> hasBeenGiven: aCard [

	cards
		detect: [ :card | card = aCard ]
		ifFound: [ :card | ^ true ]
		ifNone: [ ^ false ]
]

{ #category : #Initialization }
CardsInPosetion >> initializeDeck [
	cards:= OrderedCollection new.
]

{ #category : #Initialization }
CardsInPosetion >> takeOut: aCard [

	cards remove: aCard.
]
