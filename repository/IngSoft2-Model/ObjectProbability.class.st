Class {
	#name : #ObjectProbability,
	#superclass : #Object,
	#instVars : [
		'object',
		'probability'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'Instance creation' }
ObjectProbability class >> using: anObject withChanceOf: aProbability [

	^ self new initializeUsing: anObject withChanceOf: aProbability
]

{ #category : #Initialization }
ObjectProbability >> initializeUsing: anObject withChanceOf: aProbability [

	object := anObject.
	probability := aProbability
]

{ #category : #Information }
ObjectProbability >> object [

	^ object
]

{ #category : #Information }
ObjectProbability >> probability [

	^ probability
]
