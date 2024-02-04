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
BoxProbability class >> using: aBoxClass withChanceOf: aProbability [

	^ self new initializeUsing: aBoxClass withChanceOf: aProbability
]

{ #category : #Information }
BoxProbability >> box [

	^ box
]

{ #category : #Initialization }
BoxProbability >> initializeUsing: aBox withChanceOf: aProbability [

	box := aBox.
	probability := aProbability
]

{ #category : #Information }
BoxProbability >> probability [

	^ probability
]
