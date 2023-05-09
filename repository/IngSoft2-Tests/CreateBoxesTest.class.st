Class {
	#name : #CreateBoxesTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
CreateBoxesTest >> testN001NoEffectBox [

	| aBox aSpaceship aPlayer aLoadedDie players |
	aSpaceship := Spaceship with: 'red'.
	aLoadedDie := LoadedDie with:
		              (OrderedCollection with: 8 with: 9 with: 10).
	aPlayer := Player with: aSpaceship.
	aBox := NoEffectBox new.
	aPlayer move: (OrderedCollection with: aLoadedDie).
	players := OrderedCollection with: aPlayer.
	aBox effect: players affects: aPlayer parsecs: 20.
	self assert: aPlayer position equals: 8
]

{ #category : #tests }
CreateBoxesTest >> testN002WormHoleBox [

	| aBox aSpaceship aPlayer aLoadedDie players |
	aSpaceship := Spaceship with: 'red'.
	aLoadedDie := LoadedDie with:
		              (OrderedCollection with: 8 with: 9 with: 10).
	aPlayer := Player with: aSpaceship.
	aBox := WormHoleBox new.
	aPlayer move: (OrderedCollection with: aLoadedDie).
	players := OrderedCollection with: aPlayer.
	aBox effect: players affects: aPlayer parsecs: 20.
	self assert: aPlayer position equals: 4
]

{ #category : #tests }
CreateBoxesTest >> testN003SpeedUpBox [

	| aBox aSpaceship aPlayer aLoadedDie players |
	aSpaceship := Spaceship with: 'red'.
	aLoadedDie := LoadedDie with:
		              (OrderedCollection with: 8 with: 9 with: 10).
	aPlayer := Player with: aSpaceship.
	aBox := SpeedUpBox new.
	aPlayer move: (OrderedCollection with: aLoadedDie).
	players := OrderedCollection with: aPlayer.
	aBox effect: players affects: aPlayer parsecs: 20.
	self assert: aPlayer position equals: 12
]

{ #category : #tests }
CreateBoxesTest >> testN004MoonWalkBox [

	| aBox aSpaceship anotherSpaceship aPlayer anotherPlayer aLoadedDie players |
	aSpaceship := Spaceship with: 'red'.
	anotherSpaceship := Spaceship with: 'blue'.
	aLoadedDie := LoadedDie with:
		              (OrderedCollection with: 8 with: 9 with: 10).
	aPlayer := Player with: aSpaceship.
	anotherPlayer := Player with: anotherSpaceship.
	players:= (OrderedCollection with: aPlayer with:anotherPlayer).
	aBox := MoonWalkBox with: -2.
	aPlayer move: (OrderedCollection with: aLoadedDie).
	anotherPlayer move:(OrderedCollection with: aLoadedDie).
	aBox effect: players affects: aPlayer parsecs: 20.
	self assert:  anotherPlayer position equals: 7.
	self assert: aPlayer position equals: 8.
]

{ #category : #tests }
CreateBoxesTest >> testN005AtomicBombBox [

	| aBox aSpaceship anotherSpaceship aPlayer anotherPlayer aLoadedDie players |
	aSpaceship := Spaceship with: 'red'.
	anotherSpaceship := Spaceship with: 'blue'.

	aLoadedDie := LoadedDie with:
		              (OrderedCollection with: 8 with: 9 with: 10).

	aPlayer := Player with: aSpaceship.
	anotherPlayer := Player with: anotherSpaceship.
	players := OrderedCollection with: aPlayer with: anotherPlayer.
	aPlayer move: (OrderedCollection with: aLoadedDie).
	anotherPlayer move: (OrderedCollection with: aLoadedDie).

	aBox := AtomicBombBox new.
	aBox effect: players affects: aPlayer parsecs: 5.
	self assert: anotherPlayer position equals: 1.
	self assert: aPlayer position equals: 1
]

{ #category : #tests }
CreateBoxesTest >> testN006HyperJumpBox [

	| aBox aSpaceship aPlayer aLoadedDie players aBoard |
	aSpaceship := Spaceship with: 'red'.

	aLoadedDie := LoadedDie with:
		              (OrderedCollection with: 3 with: 2 with: 1).

	aPlayer := Player with: aSpaceship.
	players := OrderedCollection with: aPlayer.
	aPlayer move: (OrderedCollection with: aLoadedDie).
	
	aBoard:= Board with: 10 and: players.

	aBox := HyperJumpBox with: (OrderedCollection with: 40 with: 10 with: 2).
	aBox effect: players affects: aPlayer parsecs: (aBoard parsecsAmount / aBoard length).
	self assert: aPlayer position equals: 7.
	
]
