Class {
	#name : #RedoCard,
	#superclass : #Object,
	#instVars : [
		'owner'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'Instance creation' }
RedoCard class >> owner: anObjectivePlayer [

	^ self new initializeOwner: anObjectivePlayer
]

{ #category : #Effect }
RedoCard >> applyCardUsing: cardManager at: aGame to: objective [

	cardManager lastCardPlay toString = 'Cancellation' ifTrue: [ 
		aGame playersColors do: [ :color | 
			color = objective ifTrue: [ 
				Error signal: 'The objective card to cancell must be specified' ] ] ].
	cardManager lastCardPlay
		applyCardUsing: cardManager
		at: aGame
		to: objective
]

{ #category : #Information }
RedoCard >> equals: aCard [

	^ 'Redo' = aCard toString and: aCard owner = owner
]

{ #category : #Initialization }
RedoCard >> initializeOwner: anOwner [

	owner := anOwner.
]

{ #category : #Information }
RedoCard >> isPermanent [

	^ false
]

{ #category : #Information }
RedoCard >> owner [
	^ owner
]

{ #category : #Information }
RedoCard >> toString [

	^ 'Redo'
]
