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
DuplaGalacticaGame >> add: aCard [
	
	cardManager add: aCard.
]

{ #category : #Cards }
DuplaGalacticaGame >> apply: aCard [
	
	(cardManager canBeUse: aCard whenPlay: turnManager current color) ifFalse: [ 
		Error signal:
			'A permanent card can only be use when it is your turn' ].
	cardManager apply: aCard at: self.
]

{ #category : #Information }
DuplaGalacticaGame >> boxes [

	^ board boxes
]

{ #category : #Information }
DuplaGalacticaGame >> boxesByParsecs [

	^ self parsecs nominalValue // self boxes
]

{ #category : #Boxes }
DuplaGalacticaGame >> changePolarity: aBoxNumber [

	self isValidBox: aBoxNumber.
	board changePolarity: aBoxNumber
]

{ #category : #Information }
DuplaGalacticaGame >> currentPlayer [

	^ turnManager current color
]

{ #category : #Information }
DuplaGalacticaGame >> goalLaps [

	^ goalLaps
]

{ #category : #Initialization }
DuplaGalacticaGame >> initializeWith: aColorsCollection and: aBoard usingToThrow: aDiceShaker winningWhen: reachAValue using: aCardDealer [

	players := aColorsCollection collect: [ :color | Player with: color ].
	board := aBoard.
	shaker := aDiceShaker.
	turnManager := TurnManager with: players.
	current := turnManager current.
	goalLaps := reachAValue.
	cardManager := CardManager using: aCardDealer with: aColorsCollection
]

{ #category : #Cards }
DuplaGalacticaGame >> isValidBox: aBoxNumber [

	(aBoxNumber <= self boxes and: aBoxNumber > 0) ifFalse: [ 
		Error signal: 'That is not a valid box number' ]
]

{ #category : #Cards }
DuplaGalacticaGame >> isValidPlayer: objective [

	self playersColors
		detect: [ :color | color = objective ]
		ifFound: [ ^ true ]
		ifNone: [ Error signal: 'That is not a valid objective' ]
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

	turnManager current move: aValue andUpdateLap: board boxes
]

{ #category : #Boxes }
DuplaGalacticaGame >> moveOthers: aValue [

	(players reject: [ :player | player color == turnManager current color ]) do: [ 
		:player | player move: aValue andUpdateLap: board boxes ]
]

{ #category : #Player }
DuplaGalacticaGame >> movePlayer [

	| boxesToMove |
	self winnerExists ifTrue: [ ^ self ].
	boxesToMove := shaker throwDice
	               + (cardManager calculateEffectOn: turnManager current color).
	self winnerExists ifTrue: [ ^ self ].
	turnManager current move: boxesToMove andUpdateLap: board boxes.
	board effectAt: turnManager current box In: self.
	turnManager goNext.
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
DuplaGalacticaGame >> playersPositions [

	^ players collect: [ :player | 
		  Position atTheBeginning move:
			  board boxes * player lap + player box - 1 ]
]

{ #category : #Finalization }
DuplaGalacticaGame >> ranking [

	| ranking |
	ranking := players collect: [ :player | player ].
	ranking sort: [ :player1 :player2 | 
		player1 aheadOf: player2 ].
	^ ranking collect: [ :player | player color ]
]

{ #category : #Cards }
DuplaGalacticaGame >> repeatEffectTo: aPlayerColor [

	| lastPosition |
	lastPosition := current box.
	current := players detect: [ :player | player color = aPlayerColor ].
	board effectAt: lastPosition In: self.
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
