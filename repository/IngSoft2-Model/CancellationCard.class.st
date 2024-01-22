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

{ #category : #Information }
CancellationCard >> = aCard [

	(aCard isKindOf: self class)
		ifTrue: [ ^ id = aCard id and: aCard owner = owner ]
		ifFalse: [ ^ false ]
]

{ #category : #Effect }
CancellationCard >> applyCardUsing: cardManager at: aGame to: objective [

	cardManager canCancellCard.

	cardManager activeCards
		detect: [ :card | card = objective ]
		ifFound: [ :card | cardManager remove: card ]
		ifNone: [ 
			Error signal:
				'There are no that type of cards activate in this player' ].
	
]

{ #category : #Information }
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
