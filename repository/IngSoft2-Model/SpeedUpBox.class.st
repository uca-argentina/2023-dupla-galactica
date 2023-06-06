Class {
	#name : #SpeedUpBox,
	#superclass : #Object,
	#instVars : [
		'probability'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'Instance creation' }
SpeedUpBox class >> withChance: aProbability [

	^ self new initializeWithChance: aProbability
]

{ #category : #Effect }
SpeedUpBox >> effect: aGame [

	aGame moveCurrent: 4.
]

{ #category : #Initialization }
SpeedUpBox >> initializeWithChance: aProbability [

	probability := aProbability
]

{ #category : #Information }
SpeedUpBox >> probability [

	^ probability
]
