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
LoadedGame class >> with: aColorCollection and: aValue throwing: aDiceCollection winningWhen: laps effects: aBoxCollection [

	^ self new
		  initializeWith: aColorCollection
		  and: aValue
		  throwing: aDiceCollection
		  winningWhen: laps
		  effects: aBoxCollection
]

{ #category : #Information }
LoadedGame >> boxes [
	^(board boxes).
]

{ #category : #Initialization }
LoadedGame >> createPlayers: aColorsCollection [

	| aPlayerCollection |
	aPlayerCollection := OrderedCollection new.
	aColorsCollection do: [ :color | 
		aPlayerCollection addLast: (Player with: (Spaceship with: color)) ].
	^ aPlayerCollection
]

{ #category : #Information }
LoadedGame >> goalLaps [
	^ goalLaps
]

{ #category : #Initialization }
LoadedGame >> initializeWith: aColorsCollection and: aValue throwing: aDiceCollection winningWhen: laps effects: aBoxCollection [ 
	| aPlayerCollection |
	aPlayerCollection := (self createPlayers: aColorsCollection).
	board := Board with: aValue and: aPlayerCollection effects: aBoxCollection.
	players := aPlayerCollection.
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
		player1 position + (player1 lap * self boxes size)
		> (player2 position + (player2 lap * self boxes size)) ].
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
