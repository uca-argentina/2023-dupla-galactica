Class {
	#name : #Player,
	#superclass : #Object,
	#instVars : [
		'lap',
		'color',
		'position',
		'cardsInPosetion',
		'activeCards'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'Instance creation' }
Player class >> with: aSpaceship [

	^ self new initializeWith: aSpaceship
]

{ #category : #Cards }
Player >> addCard: aCard [

	cardsInPosetion addLast: aCard.
]

{ #category : #Cards }
Player >> applyCancellCard: aCardName [

	| i cardCollection |
	i := 1.
	cardCollection := OrderedCollection new.
	activeCards isEmpty ifTrue: [ 
		Error signal: 'There are no permanent cards' ].
	activeCards do: [ :card | 
		(card toString = aCardName and: i = 1)
			ifTrue: [ i := 2 ]
			ifFalse: [ cardCollection addLast: card ] ].
	activeCards := cardCollection.
	i = 1 ifTrue: [ 
		Error signal:
			'There are no that type of cards activate in this player' ]
]

{ #category : #Cards }
Player >> applyCard: aCard [

	activeCards addLast: aCard
]

{ #category : #LapControl }
Player >> applyPermanentCards: aPosition [

	| positionToMove |
	positionToMove := aPosition.
	activeCards do: [ :card | 
		positionToMove := card applyEffect: positionToMove ].
	^ positionToMove
]

{ #category : #Information }
Player >> cardsInPosetion [

	^ cardsInPosetion size
]

{ #category : #Information }
Player >> color [

	^ color
]

{ #category : #Cards }
Player >> has: aCardName [

	| cardCollection i res |
	i := 1.
	res := false.
	cardCollection := OrderedCollection new.
	cardsInPosetion do: [ :card | 
		(card toString = aCardName and: i = 1)
			ifTrue: [ 
				i := 2.
				res := true ]
			ifFalse: [ cardCollection addLast: card ] ].
	cardsInPosetion := cardCollection.
	^ res
]

{ #category : #Initialization }
Player >> initializeWith: aColor [

	color := aColor.
	position := 1.
	lap := 0.
	activeCards := OrderedCollection new.
	cardsInPosetion:= OrderedCollection new.
]

{ #category : #Information }
Player >> lap [

	^ lap
]

{ #category : #LapControl }
Player >> move: value [

	position := position + value
]

{ #category : #LapControl }
Player >> move: aPosition andUpdateLap: aValue [

	|aPositionToMove|
	aPositionToMove:= self applyPermanentCards: aPosition.
	(self lap == 0 and:
		 (aPositionToMove < 0 and: aPositionToMove abs >= position))
		ifTrue: [ self moveToTheBeginning ]
		ifFalse: [ self move: aPositionToMove ].
	self updateLap: aValue
]

{ #category : #LapControl }
Player >> moveBackwardsLaps: aLength [

	| entireLaps |
	entireLaps := (position + 1) abs // aLength + 1.
	lap := lap - entireLaps.
	position:= aLength - position abs
]

{ #category : #LapControl }
Player >> moveForwardLaps: aLength [

	| entireLaps |
	entireLaps := position // aLength.
	lap := lap + entireLaps.
	position:= position - (aLength * entireLaps)
]

{ #category : #LapControl }
Player >> moveToTheBeginning [

	position := 1
]

{ #category : #Information }
Player >> position [

	^ position
]

{ #category : #LapControl }
Player >> updateLap: aLength [

	position > aLength ifTrue: [ 
		self moveForwardLaps: aLength ].

	position <= 0 ifFalse: [ ^ self ].
		self moveBackwardsLaps: aLength
]
