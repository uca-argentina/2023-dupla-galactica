Class {
	#name : #DuplaGalacticaGame,
	#superclass : #Object,
	#instVars : [
		'players',
		'board',
		'dice',
		'goalLaps',
		'turnManager',
		'lastCardPlay',
		'lastPosition',
		'current',
		'possibleCards'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'Instance creation' }
DuplaGalacticaGame class >> with: aColorCollection and: aBoard throwing: aDiceCollection winningWhen: aValue [

	aColorCollection size <= 0 ifTrue: [ 
		Error signal: 'Cannot create a game with no players' ].
	aValue <= 0 ifTrue: [ 
		Error signal: 'Cannot create a game with that goal laps' ].
	^ self new
		  initializeWith: aColorCollection
		  and: aBoard
		  throwing: aDiceCollection
		  winningWhen: aValue
]

{ #category : #Cards }
DuplaGalacticaGame >> addCard: aCard to: aPlayer [

	(self findPlayer: aPlayer) addCard: (self findCard: aCard).
]

{ #category : #Cards }
DuplaGalacticaGame >> applyCancellationCardTo: anObjectivePlayer from: aSourcePlayer ofCard: aCardName [

	| objective source |
	objective := self findPlayer: anObjectivePlayer.
	source := self findPlayer: aSourcePlayer.
	(source has: 'Cancellation') ifFalse: [ ^ self ].
	objective applyCancellCard: aCardName.
	lastCardPlay := CancellationCard new
]

{ #category : #Cards }
DuplaGalacticaGame >> applyPermanentCard: aCardName to: anObjectivePlayer from: aSourcePlayer [

	| objective source |
	objective := self findPlayer: anObjectivePlayer.
	source := self findPlayer: aSourcePlayer.
	(source has: aCardName) ifFalse: [ ^ self ].
	aCardName  = 'Acceleration'
		ifTrue: [ 
			players do: [ :player | 
				player applyCard: (self findCard: aCardName) ] ]
		ifFalse: [ objective applyCard: (self findCard: aCardName) ].
	lastCardPlay := self findCard: aCardName
]

{ #category : #Cards }
DuplaGalacticaGame >> applyRedoCardTo: anObjectivePlayer from: aSourcePlayer ofCard: cardName [

	| objective source |
	objective := self findPlayer: anObjectivePlayer.
	source := self findPlayer: aSourcePlayer.
	(source has: 'Redo') ifTrue: [ 
		lastCardPlay toString = 'Acceleration'
			ifTrue: [ players do: [ :player | player applyCard: lastCardPlay] ]
			ifFalse: [ objective applyRedoCard: lastCardPlay ofCard: cardName ] ]
]

{ #category : #Cards }
DuplaGalacticaGame >> applyRepeatCardTo: anObjectivePlayer from: aSourcePlayer [

	| objective source |
	objective := self findPlayer: anObjectivePlayer.
	source := self findPlayer: aSourcePlayer.
	(source has: 'Repeat') ifTrue: [ self repeatEffectTo: objective ]
]

{ #category : #Information }
DuplaGalacticaGame >> boxes [

	^ board boxes
]

{ #category : #Information }
DuplaGalacticaGame >> currentPlayer [

	^ current.
]

{ #category : #Information }
DuplaGalacticaGame >> currentPlayerColor [

	^ self currentPlayer color
]

{ #category : #Cards }
DuplaGalacticaGame >> findCard: aCardName [

	^possibleCards detect: [ :card | card toString = aCardName ]
]

{ #category : #Player }
DuplaGalacticaGame >> findPlayer: aPlayer [

	^ players detect: [ :player | player color = aPlayer ]
]

{ #category : #Information }
DuplaGalacticaGame >> goalLaps [

	^ goalLaps
]

{ #category : #Initialization }
DuplaGalacticaGame >> initializeWith: aColorsCollection and: aBoard throwing: aDiceCollection winningWhen: aValue [

	players := aColorsCollection collect: [ :color | Player with: color ].
	board := aBoard.
	dice := aDiceCollection.
	turnManager := TurnManager with: aColorsCollection size.
	goalLaps := aValue.
	current := players at: 1.
	possibleCards := OrderedCollection
		                 with: OverloadCard new
		                 with: SpeedCard new
		                 with: RepeatCard new
		                 with: AccelerationCard new
		                 with: RedoCard new
		                 with: CancellationCard new
]

{ #category : #Player }
DuplaGalacticaGame >> moveAllToTheStart [

	players do: [ :player | player moveToTheBeginning ]
]

{ #category : #Player }
DuplaGalacticaGame >> moveCurrent: aValue [

	self currentPlayer move: aValue andUpdateLap: board boxes size
]

{ #category : #Player }
DuplaGalacticaGame >> moveOthers: aValue [

	players do: [ :player | 
		player color == self currentPlayer color ifFalse: [ 
			player move: aValue andUpdateLap: board boxes size ] ]
]

{ #category : #Player }
DuplaGalacticaGame >> movePlayer [

	| aValue |
	aValue := dice size == 1
		          ifTrue: [ dice throw ]
		          ifFalse: [ dice sumNumbers: [ :die | die throw ] ].
	self winnerExists ifTrue: [ ^ self ].
	current move: aValue andUpdateLap: board boxes size.
	lastPosition:= current position.
	board effectAt: (self currentPlayer position) In: self.
	turnManager goNext.
	current:= players at: turnManager current.
]

{ #category : #Information }
DuplaGalacticaGame >> parsecs [

	^ board parsecs
]

{ #category : #Information }
DuplaGalacticaGame >> playersLaps [

	^ players collect: [ :player | player lap ]
]

{ #category : #Information }
DuplaGalacticaGame >> playersPositions [

	^ players collect: [ :player | player position ]
]

{ #category : #Finalization }
DuplaGalacticaGame >> ranking [

	| ranking |
	ranking := players collect: [ :player | player ].
	ranking sort: [ :player1 :player2 | 
		player1 position + (player1 lap * self boxes size)
		> (player2 position + (player2 lap * self boxes size)) ].
	^ ranking collect: [ :player | player color ]
]

{ #category : #Player }
DuplaGalacticaGame >> repeatEffectTo: aPlayer [ 
	current:= aPlayer.
	board effectAt: (lastPosition) In: self.
	current:= players at: turnManager current.
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
