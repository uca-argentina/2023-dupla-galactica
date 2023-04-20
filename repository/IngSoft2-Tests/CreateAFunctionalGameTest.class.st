Class {
	#name : #CreateAFunctionalGameTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
CreateAFunctionalGameTest >> testD001CreateGameAndAskForNextPlayer [
	| aSpaceshipRed aSpaceshipBlue aSpaceshipCollection aGame|
	aSpaceshipRed := Spaceship putOn: 0 with: 'red' and: 1.
	aSpaceshipBlue := Spaceship putOn: 0 with: 'blue' and: 2.
	aSpaceshipCollection := OrderedCollection with: aSpaceshipRed with: aSpaceshipBlue.
	aGame := Game with: aSpaceshipCollection and: 8.
	
	self assert: aGame nextPlayer asSymbol identicalTo: 'red' asSymbol
]
