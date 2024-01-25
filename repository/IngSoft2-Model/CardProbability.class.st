Class {
	#name : #CardProbability,
	#superclass : #Object,
	#instVars : [
		'cardClass',
		'chance'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'Instance creation' }
CardProbability class >> using: aCardClass withChance: aChance [ 
	^ self new initializeUsing: aCardClass withChance: aChance
]

{ #category : #Information }
CardProbability >> cardClass [
	^ cardClass
]

{ #category : #Initialization }
CardProbability >> initializeUsing: aCardClass withChance: aChance [ 
	cardClass:= aCardClass.
	chance:= aChance.
]

{ #category : #Information }
CardProbability >> probability [
	^ chance.
]
