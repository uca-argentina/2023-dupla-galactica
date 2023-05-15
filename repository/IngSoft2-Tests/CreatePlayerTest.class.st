Class {
	#name : #CreatePlayerTest,
	#superclass : #TestCase,
	#instVars : [
		'aSpaceship',
		'aPlayer'
	],
	#category : #'IngSoft2-Tests'
}

{ #category : #running }
CreatePlayerTest >> setUp [
	super setUp.
	
	aSpaceship:= Spaceship with: 'red'.
	aPlayer:= Player with: aSpaceship.
]

{ #category : #tests }
CreatePlayerTest >> testK001CreateAPlayerThatHasAnSpaceship [

	self assert: aPlayer color asSymbol identicalTo: 'red' asSymbol
]

{ #category : #tests }
CreatePlayerTest >> testK002CreateAPlayerAndThrowTheDice [
	|aLoadedDie|
	
	aLoadedDie:= LoadedDie with: (OrderedCollection with: 8 with: 10 with: 11).
	aPlayer move: (OrderedCollection with: aLoadedDie) check: 10. 
	self assert: aPlayer color asSymbol identicalTo: 'red' asSymbol.
	
]
