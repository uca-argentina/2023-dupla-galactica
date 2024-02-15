Class {
	#name : #BoxProbability,
	#superclass : #Object,
	#instVars : [
		'probability',
		'boxClass'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'Instance creation' }
BoxProbability class >> using: aBoxClass withChanceOf: aProbability [

	^ self new initializeUsing: aBoxClass withChanceOf: aProbability
]

{ #category : #Information }
BoxProbability >> boxClass [

	^ boxClass
]

{ #category : #Initialization }
BoxProbability >> initializeUsing: aBoxClass withChanceOf: aProbability [

	boxClass := aBoxClass.
	probability := aProbability
]

{ #category : #Information }
BoxProbability >> probability [

	^ probability
]
