Class {
	#name : #DiceShaker,
	#superclass : #Object,
	#instVars : [
		'dice'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'Instance creation' }
DiceShaker class >> withDie: aDie [ 
	^self new initializeWithDie: aDie.
]

{ #category : #Dice }
DiceShaker >> addDie: aDie [ 
	dice addLast: aDie.
]

{ #category : #Initialization }
DiceShaker >> initializeWithDie: aDie [ 
	dice := OrderedCollection with: aDie.
]

{ #category : #Dice }
DiceShaker >> throwDice [
	^ dice sumNumbers: [ :die | die throw ]
]
