Class {
	#name : #BoxProbability,
	#superclass : #Object,
	#instVars : [
		'box',
		'probability'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'Instance creation' }
BoxProbability class >> using: aBox withChance: aProbability [

	^ self new initializeUsing: aBox withChance: aProbability
]

{ #category : #Information }
BoxProbability >> box [

	^ box
]

{ #category : #Initialization }
BoxProbability >> initializeUsing: aBox withChance: aProbability [

	box := aBox.
	probability := aProbability
]

{ #category : #Information }
BoxProbability >> probability [

	^ probability
]
