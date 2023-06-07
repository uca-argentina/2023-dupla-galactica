Class {
	#name : #CardManager,
	#superclass : #Object,
	#instVars : [
		'activeCard',
		'cardsInPosetion',
		'lastCardPlay'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'Instance creation' }
CardManager class >> using: aCardDealer with: aColorCollection [

	^ self new initializeUsing: aCardDealer with: aColorCollection
]

{ #category : #Information }
CardManager >> activeCards [

	^ activeCard
]

{ #category : #'Manage cards' }
CardManager >> addCard: aCard [

	cardsInPosetion addLast: aCard
]

{ #category : #'Manage cards' }
CardManager >> apply: aCard to: anObjective at: aGame [

	(self canBeUse: aCard whenPlay: aGame currentPlayer color) ifFalse: [ 
		^ self ].
	(aCard haveEffect) ifTrue: [ lastCardPlay := aCard ].
	aCard applyCardUsing: self at: aGame to: anObjective
]

{ #category : #'Manage cards' }
CardManager >> calculateEffectOn: aPlayer [

	| aValue |
	aValue := 0.
	activeCard do: [ :card | 
		card owner = aPlayer ifTrue:[ aValue := aValue + card applyEffect] ].
	^ aValue
]

{ #category : #'Manage cards' }
CardManager >> canBeUse: aCard whenPlay: aPlayer [

	(self isAnOwner: aCard owner of: aCard) ifFalse: [ ^ false ].
	aCard isPermanent
		ifTrue: [ 
			(aCard owner) = aPlayer
				ifTrue: [ ^ true ]
				ifFalse: [ ^ false ] ]
		ifFalse: [ ^ true ]
]

{ #category : #Information }
CardManager >> cardsInPosetion [

	^cardsInPosetion
]

{ #category : #Initialization }
CardManager >> initializeUsing: aCardDealer with: aColorCollection [

	lastCardPlay := EmptyCard new.
	activeCard := OrderedCollection new.
	cardsInPosetion := OrderedCollection new.
	aCardDealer dealCards: self to: aColorCollection
]

{ #category : #'Manage cards' }
CardManager >> isAnOwner: aPlayerColor of: aCard [

	cardsInPosetion do: [ :card | 
		(card = aCard) ifTrue: [ 
			cardsInPosetion remove: card.
			^ true ] ].
	^ false
]

{ #category : #'Manage cards' }
CardManager >> lastCardPlay [

	^ lastCardPlay
]

{ #category : #Information }
CardManager >> playersCardInPosetionOf: players [

	| cardsPerPlayer aValue |
	cardsPerPlayer := OrderedCollection new.
	aValue := 0.
	players do: [ :player | 
		cardsInPosetion do: [ :card | 
			card owner = player color ifTrue: [ aValue := aValue + 1 ] ].
		cardsPerPlayer addLast: aValue.
		aValue := 0 ].
	^ cardsPerPlayer
]

{ #category : #Information }
CardManager >> remove: card [

	activeCard remove: card.
]
