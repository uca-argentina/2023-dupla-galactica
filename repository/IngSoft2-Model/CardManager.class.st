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

{ #category : #Information }
CardManager >> activeCard: aCard [

	activeCards activeCard: aCard
]

{ #category : #Managing }
CardManager >> addCard: aCard [

	cardsInPosetion addCard: aCard
]

{ #category : #Managing }
CardManager >> apply: aCard to: anObjective at: aGame [

	(self canBeUse: aCard whenPlay: aGame currentPlayer color) ifFalse: [ 
		^ self ].
	aCard haveEffect ifTrue: [ lastCardPlay := aCard ].
	aCard applyCardUsing: self at: aGame to: anObjective
]

{ #category : #Managing }
CardManager >> calculateEffectOn: aPlayer [

	^ activeCards calculateEffectOn: aPlayer
]

{ #category : #Managing }
CardManager >> canBeUse: aCard whenPlay: aPlayer [

	aCard isPermanent ifTrue: [ 
		aCard owner = aPlayer ifFalse: [ ^ false ] ].
	(self hasBeenGiven: aCard)
		ifTrue: [ ^ true ]
		ifFalse: [ ^ false ]
]

{ #category : #Managing }
CardManager >> canCancellCard [

	activeCards isEmpty
]

{ #category : #Information }
CardManager >> cardsInPosetion [

	^ cardsInPosetion amount
]

{ #category : #Information }
CardManager >> cardsInPosetionOf: players [

	^ cardsInPosetion cardsOf: players
]

{ #category : #Managing }
CardManager >> desactivate: anObjectiveCard [
 
	activeCards desactivate: anObjectiveCard.
]

{ #category : #Managing }
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
