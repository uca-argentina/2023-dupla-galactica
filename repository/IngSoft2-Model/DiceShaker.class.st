Class {
	#name : #DiceShaker,
	#superclass : #Object,
	#instVars : [
		'dice'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'Instance creation' }
DiceShaker class >> with: aDiceCollection [

	^ self new initializeWith: aDiceCollection
]

{ #category : #Dice }
DiceShaker >> addDie: aDie [

	dice addLast: aDie
]

{ #category : #Initialization }
DiceShaker >> initializeWith: aDiceCollection [

	dice := aDiceCollection
]

{ #category : #Dice }
DiceShaker >> throwDice [

	^ dice sumNumbers: [ :die | die throw ]
]
