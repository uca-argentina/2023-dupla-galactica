Class {
	#name : #CardManager,
	#superclass : #Object,
	#instVars : [
		'activeCard',
		'cardsInPosetion',
		'lastCardPlay',
		'objective'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'Instance creation' }
CardManager class >> create [

	^ self new create
]

{ #category : #'Instance creation' }
CardManager class >> using: aCardDealer with: aColorCollection [

	^ self new initializeUsing: aCardDealer with: aColorCollection
]

{ #category : #Information }
CardManager >> activeCards [
	^activeCard.
]

{ #category : #'Manage cards' }
CardManager >> addCard: aCard [

	| res |
	res := false.
	cardsInPosetion do: [ :card | 
		card toString = aCard toString ifTrue: [ 
			card addOwner: (aCard owners at: 1).
			res := true ] ].
	res ifFalse: [ cardsInPosetion addLast: aCard ]
]

{ #category : #'Manage cards' }
CardManager >> apply: aCard to: anObjectivePlayer at: aGame [

	(self isAnOwner: (aCard owners at: 1) of: aCard) ifFalse: [ ^ self ].
	(self verify: (aCard owners at: 1) canUse: aCard whenPlay: aGame currentPlayer color) ifFalse: [ ^ self ].
	lastCardPlay := aCard transformTo: lastCardPlay.
	objective:= anObjectivePlayer.
	lastCardPlay applyCardAt: aGame using: self.
]

{ #category : #'Manage cards' }
CardManager >> calculateEffectOn: aPlayer [

	| aValue |
	aValue := 0.
	activeCard do: [ :card | 
		card owners do: [ :owner | 
			owner = aPlayer ifTrue: [ aValue := aValue + card applyEffect ] ] ].
	^ aValue
]

{ #category : #Information }
CardManager >> cardsInPosetion [
	^ cardsInPosetion
]

{ #category : #Initialization }
CardManager >> initializeUsing: aCardDealer with: aColorCollection [

	activeCard := OrderedCollection new.
	cardsInPosetion := OrderedCollection new.
	aCardDealer dealCards: self to: aColorCollection
]

{ #category : #'Manage cards' }
CardManager >> isAnOwner: aPlayerColor of: aCard [

	| res |
	res := false.
	cardsInPosetion do: [ :card | 
		(card toString = aCard toString and: (card isOwner: aPlayerColor)) 
			ifTrue: [ 
				res := true.
				card eliminateOwner: aPlayerColor ] ].
	^ res
]

{ #category : #Information }
CardManager >> objective [
	^ objective
]

{ #category : #Information }
CardManager >> playersCardInPosetionOf: players [

	| cardsPerPlayer aValue |
	cardsPerPlayer := OrderedCollection new.
	aValue := 0.
	players do: [ :player | 
		cardsInPosetion do: [ :card | 
			card owners do: [ :owner | 
				owner = player color ifTrue: [ aValue := aValue + 1 ] ] ].
		cardsPerPlayer addLast: aValue.
		aValue := 0 ].
	^ cardsPerPlayer
]

{ #category : #'Manage cards' }
CardManager >> verify: aPlayerColor canUse: aCard whenPlay: aPlayer [
	aCard isPermanent
		ifTrue: [ 
			aPlayerColor = aPlayer
				ifTrue: [ ^ true ]
				ifFalse: [ ^ false ] ]
		ifFalse: [ ^ true ]
]
