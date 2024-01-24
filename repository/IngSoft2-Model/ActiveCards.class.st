Class {
	#name : #ActiveCards,
	#superclass : #Object,
	#instVars : [
		'cards'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'Instance creation' }
ActiveCards class >> createDeck [
	^ self new initializeDeck.
]

{ #category : #Activation }
ActiveCards >> activeCard: aCard [ 
	cards addLast: aCard
]

{ #category : #Effects }
ActiveCards >> calculateEffectOn: aColorPlayer [

	^ (cards select: [ :card | card isHolder: aColorPlayer ]) sum: [ :card | 
		  card applyEffect ]
]

{ #category : #Desactivation }
ActiveCards >> desactivate: anObjectiveCard [ 
	self isEmpty.
	cards
		detect: [ :card | card = anObjectiveCard ]
		ifFound: [ :card | cards remove: card ]
		ifNone: [ 
			Error signal:
				'There are no that type of cards activate in this player or is not a valid objective' ]

]

{ #category : #Initialization }
ActiveCards >> initializeDeck [
	cards:= OrderedCollection new.
]

{ #category : #Cards }
ActiveCards >> isEmpty [

	cards isEmpty ifTrue: [ Error signal: 'There are no permanent cards' ]
]
