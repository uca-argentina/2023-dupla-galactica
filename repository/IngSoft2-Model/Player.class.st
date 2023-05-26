Class {
	#name : #Player,
	#superclass : #Object,
	#instVars : [
		'lap',
		'color',
		'position',
		'permanentCards',
		'cardsInPosetion'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'Instance creation' }
Player class >> with: aSpaceship [

	^ self new initializeWith: aSpaceship
]

{ #category : #Cards }
Player >> addAccelerationCard [
	cardsInPosetion addLast: AccelerationCard new.
]

{ #category : #Cards }
Player >> addOverLoadCardTo [
	cardsInPosetion addLast: OverloadCard new.
]

{ #category : #Cards }
Player >> addSpeedCard [
	cardsInPosetion addLast: SpeedCard new.
]

{ #category : #Cards }
Player >> applyAccelerationCard [

	permanentCards addLast: AccelerationCard new
]

{ #category : #Cards }
Player >> applyOverloadCard [
	
	permanentCards addLast: OverloadCard new.
]

{ #category : #Cards }
Player >> applyPermanentCards: aPosition [

	| positionToMove |
	positionToMove := aPosition.
	permanentCards do: [ :card | 
		positionToMove := card applyEffect: positionToMove ].
	^ positionToMove
]

{ #category : #Cards }
Player >> applySpeedCard [

	permanentCards addLast: SpeedCard new
]

{ #category : #Cards }
Player >> cancellCard: aNumberOfPermanentCard [

	permanentCards isEmpty ifTrue: [ 
		Error signal: 'There are no permanent cards' ].
	(aNumberOfPermanentCard > permanentCards size or:
		 aNumberOfPermanentCard < 1) ifTrue: [ 
		Error signal: 'There are no cards in that index' ].
	permanentCards removeAt: aNumberOfPermanentCard
]

{ #category : #Information }
Player >> color [

	^ color
]

{ #category : #Cards }
Player >> hasAccelerationCard [

	| res |
	res := false.
	cardsInPosetion do: [ :card | 
		card toString = 'Acceleration' ifTrue: [ res := true ] ].
	^ res
]

{ #category : #Cards }
Player >> hasOverLoadCard [
	|res|
	res:=false.
	cardsInPosetion do: [:card | card toString = 'Overload' ifTrue:[res:= true]].
	^res.
]

{ #category : #Cards }
Player >> hasSpeedCard [
	|res|
	res:=false.
	cardsInPosetion do: [:card | card toString = 'Speed' ifTrue:[res:= true]].
	^res.
]

{ #category : #Initialization }
Player >> initializeWith: aColor [

	color := aColor.
	position := 1.
	lap := 0.
	permanentCards := OrderedCollection new.
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
