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
DuplaGalacticaGame >> board [

	^ board
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
DuplaGalacticaGame >> dice [

	^ dice
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

	^ self players collect: [ :player | player lap ]
]

{ #category : #Player }
DuplaGalacticaGame >> moveNextPlayer [

	self winnerExists ifFalse: [ self board movePlayer: self dice ]
]

{ #category : #Player }
DuplaGalacticaGame >> nextPlayer [

	^ self board nextOne
]

{ #category : #Information }
DuplaGalacticaGame >> parsecs [

	^ self board parsecs
]

{ #category : #Information }
DuplaGalacticaGame >> players [

	^ players
]

{ #category : #Information }
DuplaGalacticaGame >> positions [

	^ self players collect: [ :player | player spaceship position ]
]

{ #category : #Initialization }
DuplaGalacticaGame >> randomBox [

	| box aDie aRandomValue |
	aDie := Die with: 100.
	aRandomValue := aDie throw.
	aRandomValue <= 40
		ifTrue: [ box := NoEffectBox new ]
		ifFalse: [ 
			aRandomValue <= 60
				ifTrue: [ box := WormHoleBox new ]
				ifFalse: [ 
					aRandomValue <= 80
						ifTrue: [ box := SpeedUpBox new ]
						ifFalse: [ 
							aRandomValue <= 90
								ifTrue: [ box := MoonWalkBox with: -2 ]
								ifFalse: [ 
									aRandomValue <= 98
										ifTrue: [ 
											box := HyperJumpBox with:
												       (OrderedCollection with: 40 with: 20 with: 10) ]
										ifFalse: [ box := AtomicBombBox new ] ] ] ] ].

	^ box
]

{ #category : #Finalization }
DuplaGalacticaGame >> winner [

	self winnerExists
		ifTrue: [ 
			^ (self players detect: [ :player | self winningCondition: player ])
				  color ]
		ifFalse: [ Error signal: 'There is no winner' ]
]

{ #category : #Finalization }
DuplaGalacticaGame >> winnerExists [

	^ self players anySatisfy: [ :player | self winningCondition: player ]
]

{ #category : #Finalization }
DuplaGalacticaGame >> winningCondition: aPlayer [

	^ aPlayer lap >= self goalLaps
]
