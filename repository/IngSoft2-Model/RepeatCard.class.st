Class {
	#name : #RepeatCard,
	#superclass : #Object,
	#instVars : [
		'objective'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'Instance creation' }
RepeatCard class >> to: anObjectivePlayer [

	^ self new initializeTo: anObjectivePlayer
]

{ #category : #Effect }
RepeatCard >> applyCards: aGame [

	aGame repeatEffectTo: (aGame findPlayer: objective)
]

{ #category : #Initialization }
RepeatCard >> initializeTo: anObjectivePlayer [

	objective := anObjectivePlayer
]

{ #category : #Information }
RepeatCard >> isPermanent [

	^ false
]

{ #category : #Information }
RepeatCard >> toString [
	^'Repeat'.
]
