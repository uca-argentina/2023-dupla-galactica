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
CardProbability class >> using: aCardClass withChanceOf: aProbability [

	^ self new initializeUsing: aCardClass withChanceOf: aProbability
]

{ #category : #Information }
CardProbability >> cardClass [

	^ cardClass
]

{ #category : #Initialization }
CardProbability >> initializeUsing: aCardClass withChanceOf: aChance [

	cardClass := aCardClass.
	chance := aChance
]

{ #category : #Information }
CardProbability >> probability [

	^ chance
]
