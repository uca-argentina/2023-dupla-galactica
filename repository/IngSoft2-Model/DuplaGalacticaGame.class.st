Class {
	#name : #DuplaGalacticaGame,
	#superclass : #Object,
	#instVars : [
		'players',
		'board',
		'dice',
		'goalLaps'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
DuplaGalacticaGame class >> with: aColorCollection and: aValue throwing: aDiceCollection winningWhen: laps effects: aBoxCollection [

	^ self new
		  initializeWith: aColorCollection
		  and: aValue
		  throwing: aDiceCollection
		  winningWhen: laps
		  effects: aBoxCollection
]

{ #category : #Information }
DuplaGalacticaGame >> boxes [
	^board boxes.
]

{ #category : #Initialization }
DuplaGalacticaGame >> createBoxes: aValue with: aFlag [
	|boxes|
	boxes:= OrderedCollection new.
	aFlag == 0 
		ifTrue: [ 1 to: aValue do: [ :i | boxes addLast: NoEffectBox new ] ]
		ifFalse: [ 1 to: aValue do: [ :i | boxes addLast: (self randomBox) ] ].

	^boxes
]

{ #category : #Initialization }
DuplaGalacticaGame >> createPlayers: aColorsCollection [

	| aPlayerCollection |
	aPlayerCollection := OrderedCollection new.
	aColorsCollection do: [ :color | 
		aPlayerCollection addLast: (Player with: (Spaceship with: color)) ].
	^ aPlayerCollection
]

{ #category : #Information }
DuplaGalacticaGame >> goalLaps [

	^ goalLaps
]

{ #category : #Initialization }
DuplaGalacticaGame >> initializeWith: aColorsCollection and: aValue throwing: aDiceCollection winningWhen: laps effects: aFlag [
	| aPlayerCollection aBoxesCollection|
	aPlayerCollection := (self createPlayers: aColorsCollection).
	aBoxesCollection := (self createBoxes: aValue with: aFlag).
	board:= Board with: aValue and: aPlayerCollection effects: aBoxesCollection.
	players := aPlayerCollection.
	dice := aDiceCollection.
	goalLaps := laps.
]

{ #category : #Information }
DuplaGalacticaGame >> laps [

	^ players collect: [ :player | player lap ]
]

{ #category : #Player }
DuplaGalacticaGame >> moveNextPlayer [

	self winnerExists ifFalse: [ board movePlayer:  dice ]
]

{ #category : #Player }
DuplaGalacticaGame >> nextPlayer [

	^ ( board nextOne) color.
]

{ #category : #Information }
DuplaGalacticaGame >> parsecs [

	^  board parsecs
]

{ #category : #Information }
DuplaGalacticaGame >> positions [

	^ players collect: [ :player | player spaceship position ]
]

{ #category : #Initialization }
DuplaGalacticaGame >> randomBox [

	| box aDie aRandomValue |
	aDie := Die with: 100.
	aRandomValue := aDie throw.
	box := aRandomValue <= 40
		       ifTrue: [ NoEffectBox new ]
		       ifFalse: [ 
			       aRandomValue <= 60
				       ifTrue: [ WormHoleBox new ]
				       ifFalse: [ 
					       aRandomValue <= 80
						       ifTrue: [ SpeedUpBox new ]
						       ifFalse: [ 
							       aRandomValue <= 90
								       ifTrue: [ MoonWalkBox with: -2 ]
								       ifFalse: [ 
									       aRandomValue <= 98
										       ifTrue: [ 
										       HyperJumpBox with:
											       (OrderedCollection with: 40 with: 20 with: 10) ]
										       ifFalse: [ AtomicBombBox new ] ] ] ] ].

	^ box
]

{ #category : #Finalization }
DuplaGalacticaGame >> ranking [

	| ranking |
	ranking := OrderedCollection new.
	players do: [ :player | ranking addLast: player ].
	ranking sort: [ :player1 :player2 | 
		player1 position + (player1 lap * self boxes size)
		> (player2 position + (player2 lap * self boxes size)) ].
	^ ranking collect: [ :player | player color ]
]

{ #category : #Finalization }
DuplaGalacticaGame >> winner [

	self winnerExists
		ifTrue: [ 
			^ (players detect: [ :player | self winningCondition: player ])
				  color ]
		ifFalse: [ Error signal: 'There is no winner' ]
]

{ #category : #Finalization }
DuplaGalacticaGame >> winnerExists [

	^ players anySatisfy: [ :player | self winningCondition: player ]
]

{ #category : #Finalization }
DuplaGalacticaGame >> winningCondition: aPlayer [

	^ aPlayer lap >= self goalLaps
]