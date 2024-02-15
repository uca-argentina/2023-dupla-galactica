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

	^ self new initializeDeck
]

{ #category : #Cards }
ActiveCards >> activate: aCard [

	cards addLast: aCard
]

{ #category : #Effects }
ActiveCards >> calculateEffectOn: aColorPlayer [

	^ (cards select: [ :card | 
		   (card isHolder: aColorPlayer) or: (card isHolder: 'everyone') ]) 
		  sum: #applyEffect
]

{ #category : #Cards }
ActiveCards >> desactivate: anObjectiveCard [

	cards remove: (self searching: anObjectiveCard)
]

{ #category : #Effects }
ActiveCards >> duplicateEffectOf: aCard [

	(self searching: aCard) boostEffect
]

{ #category : #Initialization }
ActiveCards >> initializeDeck [

	cards := OrderedCollection new
]

{ #category : #Cards }
ActiveCards >> isEmpty [

	cards isEmpty ifTrue: [ Error signal: 'There are no permanent cards' ]
]

{ #category : #Cards }
ActiveCards >> searching: aCard [

	self isEmpty.
	cards
		detect: [ :card | 
		card = aCard or: (card isHolder: 'everyone') ]
		ifFound: [ :card | ^ card ]
		ifNone: [ 
			Error signal:
				'There are no that type of cards activate in this player or is not a valid objective' ]
]
