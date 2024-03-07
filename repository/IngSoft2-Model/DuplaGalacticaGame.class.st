Class {
	#name : #DuplaGalacticaGame,
	#superclass : #Object,
	#instVars : [
		'players',
		'board',
		'goalLaps',
		'turnManager',
		'current',
		'cardManager',
		'shaker'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'Instance creation' }
DuplaGalacticaGame class >> with: aColorCollection and: aBoard usingToThrow: aDiceShaker winningWhenReach: aNumberOfLaps using: aCardDealer [

	aColorCollection size <= 0 ifTrue: [ 
		Error signal: 'Cannot create a game with no players' ].
	aColorCollection do: [ :colorToTest | 
		(aColorCollection select: [ :color | color = colorToTest ]) size > 1 
			ifTrue: [ 
			Error signal: 'Cannot create a game with duplicate colors' ] ].
	aNumberOfLaps <= 0 ifTrue: [ 
		Error signal: 'Cannot create a game with that goal laps' ].
	^ self new
		  initializeWith: aColorCollection
		  and: aBoard
		  usingToThrow: aDiceShaker
		  winningWhen: aNumberOfLaps
		  using: aCardDealer
]

{ #category : #Cards }
DuplaGalacticaGame >> add: aCardInAPlayerHand [

	cardManager add: aCardInAPlayerHand
]

{ #category : #Cards }
DuplaGalacticaGame >> addToOthers: aCardInAPlayerHand [

	(players reject: [ :player | player color == self currentPlayer ]) 
		do: [ :player | 
			cardManager add: (PlayerHand of: player color with: aCardInAPlayerHand) ]
]

{ #category : #Cards }
DuplaGalacticaGame >> apply: aCardInAPlayerHand to: anObjective [

	(cardManager canBeUse: aCardInAPlayerHand whenPlay: current color) 
		ifFalse: [ 
			Error signal:
				'A permanent card can only be use when it is your turn' ].
	cardManager apply: aCardInAPlayerHand to: anObjective at: self
]

{ #category : #Information }
DuplaGalacticaGame >> boardLength [

	^ board length
]

{ #category : #Information }
DuplaGalacticaGame >> boxesByParsecs [

	^ self parsecs nominalValue // self boardLength
]

{ #category : #Boxes }
DuplaGalacticaGame >> changePolarityOf: aBoxNumber [

	board changePolarityOf: aBoxNumber
]

{ #category : #Boxes }
DuplaGalacticaGame >> checkPolarity [

	cardManager checkPolarityAt: self
]

{ #category : #Information }
DuplaGalacticaGame >> currentPlayer [

	^ current color
]

{ #category : #Information }
DuplaGalacticaGame >> goalLaps [

	^ goalLaps
]

{ #category : #Initialization }
DuplaGalacticaGame >> initializeWith: aColorsCollection and: aBoard usingToThrow: aDiceShaker winningWhen: reachAValue using: cards [

	players := aColorsCollection collect: [ :color | Player with: color ].
	board := aBoard.
	shaker := aDiceShaker.
	turnManager := QueueManager with: players.
	current := turnManager current.
	goalLaps := reachAValue.
	cardManager := CardManager using: cards with: aColorsCollection
]

{ #category : #Boxes }
DuplaGalacticaGame >> isValidBox: aBoxNumber [

	aBoxNumber isNumber
		ifTrue: [ 
			(aBoxNumber <= self boardLength and: aBoxNumber > 0) ifFalse: [ 
				Error signal: 'That is not a valid box number' ] ]
		ifFalse: [ Error signal: 'That is not a box number' ]
]

{ #category : #Cards }
DuplaGalacticaGame >> isValidPlayer: anObjectivePlayerColor [

	self playersColors
		detect: [ :color | color = anObjectivePlayerColor ]
		ifFound: [ ^ true ]
		ifNone: [ Error signal: 'That is not a valid player objective' ]
]

{ #category : #Information }
DuplaGalacticaGame >> lightYears [

	^ board lightYears
]

{ #category : #Boxes }
DuplaGalacticaGame >> moveAllToTheStart [

	players do: [ :player | player moveToTheBeginning]
]

{ #category : #Boxes }
DuplaGalacticaGame >> moveCurrent: aValue [

	current move: aValue andUpdateLap: self boardLength
]

{ #category : #Boxes }
DuplaGalacticaGame >> moveOthers: aValue [

	(players reject: [ :player | player color == self currentPlayer ]) 
		do: [ :player | player move: aValue andUpdateLap: self boardLength ]
]

{ #category : #Player }
DuplaGalacticaGame >> movePlayer [

	| boxesToMove |
	self winnerExists ifTrue: [ ^ self ].
	boxesToMove := shaker throwDice
	               + (cardManager calculateEffectOn: current color).
	current move: boxesToMove andUpdateLap: self boardLength.
	self checkPolarity.
	board effectAt: current box In: self.
	board resetPolarities.
	turnManager goNext.
	current := turnManager current
]

{ #category : #Information }
DuplaGalacticaGame >> parsecs [

	^ board parsecs
]

{ #category : #Information }
DuplaGalacticaGame >> playersBox [

	^ players collect: [ :player | player box ]
]

{ #category : #Information }
DuplaGalacticaGame >> playersCardInPosetion [

	^ cardManager cardsInPosetionOf: players
]

{ #category : #Information }
DuplaGalacticaGame >> playersColors [

	^ players collect: [ :player | player color ]
]

{ #category : #Information }
DuplaGalacticaGame >> playersLaps [

	^ players collect: [ :player | player lap ]
]

{ #category : #Information }
DuplaGalacticaGame >> ranking [

	| ranking |
	ranking := players collect: [ :player | player ].
	ranking sort: [ :player1 :player2 | 
		player1 aheadOf: player2 ].
	^ ranking collect: [ :player | player color ]
]

{ #category : #Cards }
DuplaGalacticaGame >> repeatEffectTo: anObjectivePlayerColor [

	current := players detect: [ :player | 
		           player color = anObjectivePlayerColor ].
	self checkPolarity.
	board effectAt: board lastBoxInvoked In: self.
	current := turnManager current
]

{ #category : #Finalization }
DuplaGalacticaGame >> winner [

	self winnerExists
		ifTrue: [ 
			^ (players detect: [ :player | self wins: player ])
				  color ]
		ifFalse: [ Error signal: 'There is no winner' ]
]

{ #category : #Finalization }
DuplaGalacticaGame >> winnerExists [

	^ players anySatisfy: [ :player | self wins: player ]
]

{ #category : #Finalization }
DuplaGalacticaGame >> wins: aPlayer [

	^ aPlayer lap >= self goalLaps
]
