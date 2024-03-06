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

	^ ((cards select: [ :hand | 
		    hand holder = aColorPlayer or: hand holder = 'everyone' ]) 
		   collect: [ :hand | hand card ]) sum: #applyEffect
]

{ #category : #Effects }
ActiveCards >> checkPolarityAt: aDuplaGalacticaGame [

	(cards select: [ :hand | hand holder isNumber ]) do: [ :hand | 
		hand card changePolarity: hand holder at: aDuplaGalacticaGame ]
]

{ #category : #Effects }
ActiveCards >> desactivate: anObjectiveCardInHand [

	self isValidCard: anObjectiveCardInHand.
	cards remove: (self searching: anObjectiveCardInHand)
]

{ #category : #Effects }
ActiveCards >> duplicateEffectOf: anObjectiveCardInHand [

	self isValidCard: anObjectiveCardInHand.
	(self searching: anObjectiveCardInHand) card boostEffect
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
ActiveCards >> isValidCard: anObjectiveCardInHand [

	(anObjectiveCardInHand respondsTo: #holder) ifFalse: [ 
		Error signal: 'That is not a valid objective' ]
]

{ #category : #Cards }
ActiveCards >> searching: aCardInHand [

	self isEmpty.
	cards
		detect: [ :hand | 
			(aCardInHand card = hand card and: aCardInHand holder = hand holder) 
				or: hand holder = 'everyone' ]
		ifFound: [ :hand | ^ hand ]
		ifNone: [ 
			Error signal:
				'There are no that type of cards activate in this player' ]
]
