Class {
	#name : #CreateBoxesTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
CreateBoxesTest >> testN001NoEffectBox [

	| aBox aSpaceship aPlayer aLoadedDie |
	aSpaceship := Spaceship with: 'red'.
	aLoadedDie := LoadedDie with:
		              (OrderedCollection with: 8 with: 9 with: 10).
	aPlayer := Player with: aSpaceship.
	aBox := NoEffectBox new.
	aPlayer move: (OrderedCollection with: aLoadedDie).
	aBox applyEffect: aPlayer.
	self assert: aPlayer position equals: 8
]
