Class {
	#name : #CreatePlayerTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
CreatePlayerTest >> testK001CreateAPlayerThatHasAnSpaceship [
	|aSpaceship aPlayer|
	aSpaceship:= Spaceship with: 'red'.
	aPlayer:= Player with: aSpaceship.
	self assert: aPlayer color asSymbol identicalTo: 'red' asSymbol.
	
]

{ #category : #tests }
CreatePlayerTest >> testK002CreateAPlayerAndThrowTheDice [
	|aSpaceship aPlayer aLoadedDie|
	aSpaceship:= Spaceship with: 'red'.
	aPlayer:= Player with: aSpaceship.
	aLoadedDie:= LoadedDie with: (OrderedCollection with: 8 with: 10).
	aPlayer move: (OrderedCollection with: aLoadedDie). 
	self assert: aPlayer color asSymbol identicalTo: 'red' asSymbol.
	
]
