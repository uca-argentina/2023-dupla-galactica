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
CardManager class >> using: aCardDealer with: aColorCollection [

	^ self new initializeUsing: aCardDealer with: aColorCollection
]

{ #category : #Managing }
CardManager >> activate: aCard [

	activeCards activate: aCard
]

{ #category : #Managing }
CardManager >> add: aCard [

	cardsInPosetion add: aCard
]

{ #category : #Managing }
CardManager >> apply: aCard at: aGame [

	(self hasBeenGiven: aCard) ifFalse: [ 
		Error signal: 'The player does not have that card in posetion' ].

	aCard haveEffect ifTrue: [ lastCardPlay := aCard ].
	aCard applyCardUsing: self at: aGame.

	cardsInPosetion takeOut: aCard
]

{ #category : #Managing }
CardManager >> apply: aCard to: anObjective at: aGame [

	(self hasBeenGiven: aCard) ifFalse: [ 
		Error signal: 'The player does not have that card in posetion' ].

	aCard haveEffect ifTrue: [ lastCardPlay := aCard ].
	aCard applyCardUsing: self to: anObjective at: aGame.

	cardsInPosetion takeOut: aCard
]

{ #category : #Managing }
CardManager >> calculateEffectOn: aColorPlayer [

	^ activeCards calculateEffectOn: aColorPlayer
]

{ #category : #Information }
CardManager >> canBeUse: aCard whenPlay: aPlayer [

	^ (aCard isPermanent and: (aCard isHolder: aPlayer)) or:
		  aCard isPermanent not
]

{ #category : #Information }
CardManager >> cardsInPosetionOf: players [

	^ cardsInPosetion cardsOf: players
]

{ #category : #Managing }
CardManager >> desactivate: anObjectiveCard [

	activeCards desactivate: anObjectiveCard
]

{ #category : #Managing }
CardManager >> duplicateEffectOf: anObjectiveCard [

	activeCards duplicateEffectOf: anObjectiveCard
]

{ #category : #Information }
CardManager >> hasBeenGiven: aCard [

	^ cardsInPosetion hasBeenGiven: aCard
]

{ #category : #Initialization }
CardManager >> initializeUsing: aCardDealer with: aColorCollection [

	lastCardPlay := EmptyCard new.
	activeCards := ActiveCards createDeck.
	cardsInPosetion := CardsInPosetion createDeck.
	aCardDealer dealCards: self to: aColorCollection
]

{ #category : #Information }
CardManager >> lastCardPlay [

	^ lastCardPlay
]
