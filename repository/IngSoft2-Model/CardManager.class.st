Class {
	#name : #CardManager,
	#superclass : #Object,
	#instVars : [
		'activeCard',
		'cardsInPosetion',
		'lastCardPlay',
		'objectiveCard'
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
CardManager >> apply: aCard to: anObjectivePlayer at: aGame ofCard: anObjectiveCard [

	(self
		 verify: aCard owner
		 canUse: aCard
		 whenPlay: aGame currentPlayer color) ifFalse: [ ^ self ].
	self checkThat: aCard needs: anObjectiveCard.
	objectiveCard := anObjectiveCard.
	aCard toString = 'Redo' ifFalse: [ lastCardPlay := aCard ].
	aCard applyCardUsing: self at: aGame to: anObjectivePlayer
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
CardManager >> checkThat: aCard needs: anObjectiveCard [

	((aCard toString = 'Redo' and: lastCardPlay toString = 'Cancellation') 
		 or: aCard toString = 'Cancellation')
		ifTrue: [ 
			anObjectiveCard = '-' ifTrue: [ 
				Error signal: 'The objective card to cancell must be specified' ] ]
		ifFalse: [ 
			anObjectiveCard = '-' ifFalse: [ 
				Error signal: 'The cards does not need an objective' ] ]
]

{ #category : #Initialization }
CardManager >> initializeUsing: aCardDealer with: aColorCollection [
	lastCardPlay:= OverloadCard owner: 'red'.
	activeCard := OrderedCollection new.
	cardsInPosetion := OrderedCollection new.
	aCardDealer dealCards: self to: aColorCollection
]

{ #category : #'Manage cards' }
CardManager >> isAnOwner: aPlayerColor of: aCard [

	| res i |
	res := false.
	i := 0.
	cardsInPosetion do: [ :card | 
		i == 0 ifTrue: [ 
			(card toString = aCard toString and: card owner = aPlayerColor)
				ifTrue: [ 
					res := true.
					i := 1.
					cardsInPosetion remove: card]] ].
	^ res
]

{ #category : #'Manage cards' }
CardManager >> lastCardPlay [

	^lastCardPlay 
]

{ #category : #Information }
CardManager >> objectiveCard [
	^ objectiveCard
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

{ #category : #'Manage cards' }
CardManager >> verify: aPlayerColor canUse: aCard whenPlay: aPlayer [

	(self isAnOwner: aCard owner of: aCard) ifFalse: [ ^ false ].
	aCard isPermanent
		ifTrue: [ 
			aPlayerColor = aPlayer
				ifTrue: [ ^ true ]
				ifFalse: [ ^ false ] ]
		ifFalse: [ ^ true ]
]
