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

	^ self new initializeWithDie: aDiceCollection
]

{ #category : #Dice }
DiceShaker >> addDie: aDie [

	dice addLast: aDie
]

{ #category : #Initialization }
DiceShaker >> initializeWithDie: aDiceCollection [

	dice := aDiceCollection
]

{ #category : #Dice }
DiceShaker >> throwDice [

	^ dice sumNumbers: [ :die | die throw ]
]
