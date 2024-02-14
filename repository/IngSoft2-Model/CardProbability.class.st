Class {
	#name : #CardProbability,
	#superclass : #Object,
	#instVars : [
		'cardClass',
		'probability'
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
CardProbability >> initializeUsing: aCardClass withChanceOf: aProbability [

	cardClass := aCardClass.
	probability := aProbability
]

{ #category : #Information }
CardProbability >> probability [

	^ probability
]
