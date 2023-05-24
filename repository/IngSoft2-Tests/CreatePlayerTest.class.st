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
	aPlayer := Player with: 'red'
]

{ #category : #tests }
CreatePlayerTest >> testK001CreateAPlayerThatHasAnSpaceship [

	self assert: aPlayer color equals: 'red'
]

{ #category : #tests }
CreatePlayerTest >> testK002CreateAPlayerAndThrowTheDice [

	| aLoadedDie |
	aLoadedDie := LoadedDie with:
		              (OrderedCollection with: 8 with: 10 with: 11).
	aPlayer move: (aLoadedDie throw ) andCheck: 10.
	self assert: aPlayer color equals: 'red'
]
