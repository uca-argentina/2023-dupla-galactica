Class {
	#name : #RedoCard,
	#superclass : #Object,
	#instVars : [
		'objectiveCard',
		'owners'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'Instance creation' }
RedoCard class >> owner: anObjectivePlayer [

	^ self new initializeOwner: anObjectivePlayer
]

{ #category : #Effect }
RedoCard >> applyCardUsing: cardManager at: aGame to: objective [
	
	cardManager lastCardPlay applyCardUsing: cardManager at: aGame to: objective
	
]

{ #category : #Initialization }
RedoCard >> initializeOwner: anOwner [

	owners := anOwner.
]

{ #category : #Information }
RedoCard >> isPermanent [

	^ false
]

{ #category : #Information }
RedoCard >> owner [
	^ owners
]

{ #category : #Information }
RedoCard >> toString [

	^ 'Redo'
]
