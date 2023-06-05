Class {
	#name : #RepeatCard,
	#superclass : #Object,
	#instVars : [
		'owners'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'Instance creation' }
RepeatCard class >> owner: anObjectivePlayer [

	^ self new initializeOwner: anObjectivePlayer
]

{ #category : #Information }
RepeatCard >> applyCardUsing: cardManager at: aGame to: objective [


	aGame repeatEffectTo: objective
]

{ #category : #Initialization }
RepeatCard >> initializeOwner: anObjectivePlayer [

	owners := anObjectivePlayer.
]

{ #category : #Information }
RepeatCard >> isPermanent [

	^ false
]

{ #category : #Information }
RepeatCard >> owner [
	^owners .
]

{ #category : #Information }
RepeatCard >> toString [
	^'Repeat'.
]
