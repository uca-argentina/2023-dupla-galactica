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
CardManager >> activeCards [

	^ activeCards
]

{ #category : #Managing }
CardManager >> addCard: aCard [

	cardsInPosetion addLast: aCard
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

	^ (activeCards select: [ :card | card owner = aPlayer ]) sum: [ :card | 
		  card applyEffect ]
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

	activeCards isEmpty ifTrue: [ 
		Error signal: 'There are no permanent cards' ]
]

{ #category : #Information }
CardManager >> cardsInPosetion [

	^ cardsInPosetion
]

{ #category : #Information }
CardManager >> cardsInPosetionOf: players [

	^ players collect: [ :player | 
		  (cardsInPosetion select: [ :card | card owner = player color ])
			  size ]
]

{ #category : #Managing }
CardManager >> hasBeenGiven: aCard [

	cardsInPosetion detect: [ :card | card = aCard ] ifFound: [ :card | 
		cardsInPosetion remove: card.
		^ true ].
	^ false
]

{ #category : #Initialization }
CardManager >> initializeUsing: aCardDealer with: aColorCollection [

	lastCardPlay := EmptyCard new.
	activeCards := OrderedCollection new.
	cardsInPosetion := OrderedCollection new.
	aCardDealer dealCards: self to: aColorCollection
]

{ #category : #Information }
CardManager >> lastCardPlay [

	^ lastCardPlay
]

{ #category : #Managing }
CardManager >> remove: card [

	activeCards remove: card.
]