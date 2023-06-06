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
RepeatCard >> applyCardUsing: cardManager at: aGame to: objective [

	| i |
	i := false.
	aGame playersColors do: [ :color | 
		color = objective ifTrue: [ i := true ] ].
	i ifFalse: [ Error signal: 'That is not a valid objective for a repeat card' ].
	aGame repeatEffectTo: objective
]

{ #category : #Information }
RepeatCard >> equals: aCard [

	^ 'Repeat' = aCard toString and: aCard owner = owner
]

{ #category : #Initialization }
RepeatCard >> initializeOwner: anObjectivePlayer [

	owner := anObjectivePlayer.
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
