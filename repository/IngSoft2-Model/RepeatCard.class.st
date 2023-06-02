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

{ #category : #Initialization }
RepeatCard >> initializeTo: anObjectivePlayer [

	objective := anObjectivePlayer
]

{ #category : #Information }
RepeatCard >> isPermanent [

	^ false
]

{ #category : #Information }
RepeatCard >> objective [
	^ objective
]

{ #category : #Information }
RepeatCard >> toString [
	^'Repeat'.
]

{ #category : #Information }
RepeatCard >> transformTo: aCard [

	^ self
]
