Class {
	#name : #ActiveCardsDeck,
	#superclass : #Object,
	#instVars : [
		'playersHands'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'Instance creation' }
ActiveCardsDeck class >> createDeck [

	^ self new initializeDeck
]

{ #category : #Cards }
ActiveCardsDeck >> activate: aCardInAPlayerHand [

	playersHands addLast: aCardInAPlayerHand
]

{ #category : #Cards }
ActiveCardsDeck >> calculateEffectOn: aColorPlayer [

	^ ((playersHands select: [ :hand | 
		    hand holder = aColorPlayer or:
			    hand holder = EveryPlayer initializeNew players ]) collect: [ 
		   :hand | hand card ]) sum: #applyEffect
]

{ #category : #Cards }
ActiveCardsDeck >> checkPolarityAt: aDuplaGalacticaGame [

	(playersHands select: [ :hand | hand holder isNumber ]) do: [ :hand | 
		hand card changePolarity: hand holder at: aDuplaGalacticaGame ]
]

{ #category : #Cards }
ActiveCardsDeck >> desactivate: anObjectiveCardInAPlayerHand [

	self isValid: anObjectiveCardInAPlayerHand.
	playersHands remove: (self searching: anObjectiveCardInAPlayerHand)
]

{ #category : #Cards }
ActiveCardsDeck >> duplicateEffectOf: anObjectiveCardInAPlayerHand [

	self isValid: anObjectiveCardInAPlayerHand.
	(self searching: anObjectiveCardInAPlayerHand) card boostEffect
]

{ #category : #Initialization }
ActiveCardsDeck >> initializeDeck [

	playersHands := OrderedCollection new
]

{ #category : #Information }
ActiveCardsDeck >> isEmpty [

	playersHands isEmpty ifTrue: [ Error signal: 'There are no permanent cards' ]
]

{ #category : #Information }
ActiveCardsDeck >> isValid: anObjectiveCardInAPlayerHand [

	(anObjectiveCardInAPlayerHand respondsTo: #holder) ifFalse: [ 
		Error signal: 'That is not a valid card objective' ]
]

{ #category : #Information }
ActiveCardsDeck >> searching: anObjectiveCardInAPlayerHand [

	self isEmpty.
	playersHands
		detect: [ :hand | 
			(anObjectiveCardInAPlayerHand card = hand card and:
				 anObjectiveCardInAPlayerHand holder = hand holder) or:
				hand holder = 'everyone' ]
		ifFound: [ :hand | ^ hand ]
		ifNone: [ 
			Error signal:
				'There are no that type of cards activate in this player' ]
]
