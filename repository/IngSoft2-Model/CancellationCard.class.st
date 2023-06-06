Class {
	#name : #CancellationCard,
	#superclass : #Object,
	#instVars : [
		'owner'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'Instance creation' }
CancellationCard class >> owner: anOwner [ 

^(self new) initializeOwner: anOwner
]

{ #category : #Effect }
CancellationCard >> applyCardUsing: cardManager at: aGame to: objective [

	| i |
	i := 1.
	aGame playersColors do: [ :color | 
		color = objective ifTrue: [ 
			Error signal: 'The objective card to cancell must be specified' ] ].
	cardManager activeCards isEmpty ifTrue: [ 
		Error signal: 'There are no permanent cards' ].
	
	cardManager activeCards do: [ :card | 
		i == 1 ifTrue: [ 
			(card equals: objective) ifTrue: [ 
				i := 2.
				cardManager remove: card ] ] ].

	i = 1 ifTrue: [ 
		Error signal:
			'There are no that type of cards activate in this player' ]
]

{ #category : #Initialization }
CancellationCard >> equals: aCard [

	^ 'Cancellation' = aCard toString and: aCard owner = owner
]

{ #category : #Initialization }
CancellationCard >> initializeOwner: anOwner [

	owner := anOwner.
]

{ #category : #Information }
CancellationCard >> isPermanent [

	^ false
]

{ #category : #Information }
CancellationCard >> owner [
	^ owner
]

{ #category : #Information }
CancellationCard >> toString [

	^ 'Cancellation'
]
