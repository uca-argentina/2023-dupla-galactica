Class {
	#name : #CardManager,
	#superclass : #Object,
	#instVars : [
		'cardsInPosetion',
		'lastCardPlay',
		'activeCards'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'Instance creation' }
CardManager class >> using: cards with: aColorCollection [

	^ self new initializeUsing: cards with: aColorCollection
]

{ #category : #Managing }
CardManager >> activate: aCardInAPlayerHand [

	activeCards activate: aCardInAPlayerHand
]

{ #category : #Managing }
CardManager >> add: aCardInAPlayerHand [

	cardsInPosetion add: aCardInAPlayerHand
]

{ #category : #Managing }
CardManager >> apply: aCardInAPlayerHand to: anObjective at: aDuplaGalacticaGame [

	(self hasBeenGiven: aCardInAPlayerHand) ifFalse: [ 
		Error signal: 'The player does not have that card in posetion' ].
	aCardInAPlayerHand card haveEffect ifTrue: [ 
		lastCardPlay := aCardInAPlayerHand card ].
	aCardInAPlayerHand card
		applyCardUsing: self
		to: anObjective
		at: aDuplaGalacticaGame.
	cardsInPosetion takeOut: aCardInAPlayerHand
]

{ #category : #Managing }
CardManager >> calculateEffectOn: aColorPlayer [

	^ activeCards calculateEffectOn: aColorPlayer
]

{ #category : #Information }
CardManager >> canBeUse: aCardInAPlayerHand whenPlay: aPlayerColor [

	^ (aCardInAPlayerHand card isPermanent and:
		   aCardInAPlayerHand holder = aPlayerColor) or:
		  aCardInAPlayerHand card isPermanent not
]

{ #category : #Information }
CardManager >> cardsInPosetionOf: aPlayersCollection [

	^ cardsInPosetion cardsOf: aPlayersCollection
]

{ #category : #Managing }
CardManager >> checkPolarityAt: aDuplaGalacticaGame [

	activeCards checkPolarityAt: aDuplaGalacticaGame
]

{ #category : #Initialization }
CardManager >> deal: aCardsCollection to: aColorsCollection [

	| cardsPerColor |
	cardsPerColor := aCardsCollection size // aColorsCollection size.
	aColorsCollection do: [ :color | 
		cardsPerColor timesRepeat: [ 
			self add: (PlayerHand of: color with: aCardsCollection removeLast) ] ]
]

{ #category : #Managing }
CardManager >> desactivate: anObjectiveCardInHand [

	activeCards desactivate: anObjectiveCardInHand
]

{ #category : #Managing }
CardManager >> duplicateEffectOf: anObjectiveCardInAPlayerHand [

	activeCards duplicateEffectOf: anObjectiveCardInAPlayerHand
]

{ #category : #Information }
CardManager >> hasBeenGiven: aCardInAPlayerHand [

	^ cardsInPosetion hasBeenGiven: aCardInAPlayerHand
]

{ #category : #Initialization }
CardManager >> initializeUsing: aCardsCollection with: aColorsCollection [

	lastCardPlay := NoEffectCard initializeNew.
	activeCards := ActiveCardsDeck createDeck.
	cardsInPosetion := CardsInPosetionDeck createDeck.
	self deal: aCardsCollection to: aColorsCollection
]

{ #category : #Information }
CardManager >> lastCardPlay [

	^ lastCardPlay
]
