Class {
	#name : #LoadedGame,
	#superclass : #Object,
	#instVars : [
		'board',
		'players',
		'dice',
		'goalLaps'
	],
	#category : #'IngSoft2-Tests'
}

{ #category : #'Instance creation' }
LoadedGame class >> with: aColorCollection and: aValue throwing: aDiceCollection winningWhen: laps [

	^ self new
		  initializeWith: aColorCollection
		  and: aValue
		  throwing: aDiceCollection
		  winningWhen: laps
]

{ #category : #Information }
LoadedGame >> boxes [
	^(board boxes).
]

{ #category : #Information }
LoadedGame >> goalLaps [
	^ goalLaps
]

{ #category : #Initialization }
LoadedGame >> initializeWith: aColorsCollection and: aValue throwing: aDiceCollection winningWhen: laps [
	| boxes|
	boxes:= (OrderedCollection with:(NoEffectBox new) with:(SpeedUpBox new) with:(WormHoleBox new) with:(NoEffectBox new) with:(MoonWalkBox with: 10) with:(HyperJumpBox with: (OrderedCollection with: 20 with:40 with:30 with: -10 with: 50))).
	boxes addLast: (NoEffectBox new).
	boxes addLast:(AtomicBombBox new).
	boxes addLast:(NoEffectBox new).
	boxes addLast: (NoEffectBox new).
	players := aColorsCollection collect: [ :color | Player with: (Spaceship with: color)].
	board := Board with: aValue and: players effects: boxes measure:100.
	dice := aDiceCollection.
	goalLaps := laps.
]

{ #category : #Information }
LoadedGame >> laps [

	^  players collect: [ :player | player lap ]
]

{ #category : #Player }
LoadedGame >> moveNextPlayer [

	self winnerExists ifFalse: [ board movePlayer: dice ]
]

{ #category : #Player }
LoadedGame >> nextPlayer [

	^ board nextOne color
]

{ #category : #Information }
LoadedGame >> parsecs [
	^ board parsecs
]

{ #category : #Information }
LoadedGame >> positions [

	^ players collect: [ :player | player spaceship position ]
]

{ #category : #Finalization }
LoadedGame >> ranking [
	| ranking |
	ranking := OrderedCollection new.
	players do: [ :player | ranking addLast: player ].
	ranking sort: [ :player1 :player2 | 
		(player1 spaceship position) + (player1 lap * self boxes size)
		> ((player2 spaceship position) + (player2 lap * self boxes size)) ].
	^ ranking collect: [ :player | player color ].
]

{ #category : #Finalization }
LoadedGame >> winner [

	self winnerExists
		ifTrue: [ 
			^ (players detect: [ :player | self winningCondition: player ])
				  color ]
		ifFalse: [ Error signal: 'There is no winner' ]
]

{ #category : #Finalization }
LoadedGame >> winnerExists [

	^ players anySatisfy: [ :player | self winningCondition: player ]
]

{ #category : #Finalization }
LoadedGame >> winningCondition: aPlayer [

	^ aPlayer lap >= self goalLaps
]
