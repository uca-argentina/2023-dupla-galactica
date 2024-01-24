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
		Error signal:
			'A permanent card can only be use when it is your turn' ].
	(self hasBeenGiven: aCard) ifFalse: [ 
		Error signal: 'The player does not have that card in posetion' ].
	(self hasSingleObjective: aCard) ifFalse: [ 
		Error signal:
			'That is a general objective card must be use a general apply effect' ].

	aCard haveEffect
		ifTrue: [ 
			lastCardPlay := aCard.
			aCard applyCardUsing: self at: aGame to: anObjective ]
		ifFalse: [ 
			lastCardPlay haveEffect.
			lastCardPlay applyCardUsing: self at: aGame to: anObjective ].

	cardsInPosetion takeOut: aCard
]

{ #category : #Managing }
CardManager >> applyEveryone: aCard at: aGame [

	(self canBeUse: aCard whenPlay: aGame currentPlayer color) ifFalse: [ 
		Error signal:
			'A permanent card can only be use when it is your turn' ].
	(self hasBeenGiven: aCard) ifFalse: [ 
		Error signal: 'The player does not have that card in posetion' ].
	(self hasSingleObjective: aCard) ifTrue: [ 
		Error signal:
			'That is not a general objective card, must be use a single player apply effect' ].
	aCard haveEffect
		ifTrue: [ 
			lastCardPlay := aCard.
			aCard applyCardUsing: self at: aGame ]
		ifFalse: [ 
			lastCardPlay haveEffect.
			lastCardPlay applyCardUsing: self at: aGame ].

	cardsInPosetion takeOut: aCard
]

{ #category : #Managing }
CardManager >> calculateEffectOn: aColorPlayer [

	^ activeCards calculateEffectOn: aColorPlayer
]

{ #category : #Managing }
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


	activeCards desactivate: anObjectiveCard.
]

{ #category : #Managing }
CardManager >> hasBeenGiven: aCard [

	^ cardsInPosetion hasBeenGiven: aCard
]

{ #category : #Managing }
CardManager >> hasSingleObjective: aCard [

	aCard haveEffect
		ifTrue: [ 
			aCard generalObjective
				ifTrue: [ ^ false ]]
		ifFalse: [ lastCardPlay generalObjective ifTrue: [ ^ false ] ].
	^ true
]

{ #category : #Initialization }
CardManager >> initializeUsing: aCardDealer with: aColorCollection [

	lastCardPlay := EmptyCard new.
	activeCards := ActiveCards createDeck.
	cardsInPosetion := CardsInPosetion createDeck.
	aCardDealer dealCards: self to: aColorCollection
]
