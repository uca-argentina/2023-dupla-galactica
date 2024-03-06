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
CardManager >> activate: aCard [

	activeCards activate: aCard
]

{ #category : #Managing }
CardManager >> add: aCardInPlayerHand [

	cardsInPosetion add: aCardInPlayerHand
]

{ #category : #Managing }
CardManager >> apply: aCardInHand to: anObjective at: aGame [

	(self hasBeenGiven: aCardInHand) ifFalse: [ 
		Error signal: 'The player does not have that card in posetion' ].

	aCardInHand card haveEffect ifTrue: [ 
		lastCardPlay := aCardInHand card ].
	aCardInHand card applyCardUsing: self to: anObjective at: aGame.

	cardsInPosetion takeOut: aCardInHand
]

{ #category : #Managing }
CardManager >> calculateEffectOn: aColorPlayer [

	^ activeCards calculateEffectOn: aColorPlayer
]

{ #category : #Information }
CardManager >> canBeUse: aCardInHand whenPlay: aPlayer [

	^ (aCardInHand card isPermanent and: aCardInHand holder = aPlayer) 
		  or: aCardInHand card isPermanent not
]

{ #category : #Information }
CardManager >> cardsInPosetionOf: players [

	^ cardsInPosetion cardsOf: players
]

{ #category : #Managing }
CardManager >> checkPolarityAt: aDuplaGalacticaGame [

	activeCards checkPolarityAt: aDuplaGalacticaGame
]

{ #category : #Initialization }
CardManager >> deal: cards to: aColorCollection [

	| cardsPerColor |
	cardsPerColor := cards size // aColorCollection size.
	aColorCollection do: [ :color | 
		cardsPerColor timesRepeat: [ 
			self add: (Hand of: color with: cards removeLast) ] ]
]

{ #category : #Managing }
CardManager >> desactivate: anObjectiveCardInHand [

	activeCards desactivate: anObjectiveCardInHand
]

{ #category : #Managing }
CardManager >> duplicateEffectOf: anObjectiveCard [

	activeCards duplicateEffectOf: anObjectiveCard
]

{ #category : #Information }
CardManager >> hasBeenGiven: aCardInHand [

	^ cardsInPosetion hasBeenGiven: aCardInHand
]

{ #category : #Initialization }
CardManager >> initializeUsing: cards with: aColorCollection [

	lastCardPlay := NullCard new.
	activeCards := ActiveCards createDeck.
	cardsInPosetion := CardsInPosetion createDeck.
	self deal: cards to: aColorCollection
]

{ #category : #Information }
CardManager >> lastCardPlay [

	^ lastCardPlay
]
