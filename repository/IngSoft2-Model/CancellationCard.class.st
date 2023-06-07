Class {
	#name : #CancellationCard,
	#superclass : #Object,
	#instVars : [
		'owner',
		'id'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'Instance creation' }
CancellationCard class >> owner: anOwner number: anId [

	^ self new initializeOwner: anOwner number: anId
]

{ #category : #Initialization }
CancellationCard >> = aCard [

	(aCard isKindOf: self class)
		ifTrue: [ ^ id = aCard id and: aCard owner = owner ]
		ifFalse: [ ^ false ]
]

{ #category : #Effect }
CancellationCard >> applyCardUsing: cardManager at: aGame to: objective [

	| i |
	i := 1.
	cardManager activeCards isEmpty ifTrue: [ 
		Error signal: 'There are no permanent cards' ].
	
	cardManager activeCards do: [ :card | 
		i == 1 ifTrue: [ 
			(card = objective) ifTrue: [ 
				i := 2.
				cardManager remove: card ] ] ].

	i = 1 ifTrue: [ 
		Error signal:
			'There are no that type of cards activate in this player' ]
]

{ #category : #Initialization }
CancellationCard >> haveEffect [

	^ true
]

{ #category : #Information }
CancellationCard >> id [

	^ id
]

{ #category : #Initialization }
CancellationCard >> initializeOwner: anOwner number: anId [

	owner := anOwner.
	id:= anId.
]

{ #category : #Information }
CancellationCard >> isPermanent [

	^ false
]

{ #category : #Information }
CancellationCard >> owner [
	^ owner
]
