Class {
	#name : #RepeatCard,
	#superclass : #Object,
	#instVars : [
		'owner'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'Instance creation' }
RepeatCard class >> owner: anObjectivePlayer [

	^ self new initializeOwner: anObjectivePlayer
]

{ #category : #Information }
RepeatCard >> applyCard: aGame to: aPlayerColor [

	aGame repeatEffectTo: aPlayerColor
]

{ #category : #Initialization }
RepeatCard >> initializeOwner: anObjectivePlayer [

	owner := anObjectivePlayer
]

{ #category : #Information }
RepeatCard >> isPermanent [

	^ false
]

{ #category : #Information }
RepeatCard >> owner [
	^owner .
]

{ #category : #Information }
RepeatCard >> toString [
	^'Repeat'.
]

{ #category : #Information }
RepeatCard >> transformTo: aCard [

	^ self
]
