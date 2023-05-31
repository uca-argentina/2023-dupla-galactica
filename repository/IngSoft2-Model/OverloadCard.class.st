Class {
	#name : #OverloadCard,
	#superclass : #Object,
	#instVars : [
		'objective'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'Instance creation' }
OverloadCard class >> to: anObjectivePlayer [ 
	^(self new) initializeTo: anObjectivePlayer.
]

{ #category : #Effect }
OverloadCard >> applyCards: aGame [

	(aGame findPlayer: objective) applyCard: self
]

{ #category : #Effect }
OverloadCard >> applyEffect: aPosition [

	^ aPosition - 2
]

{ #category : #Information }
OverloadCard >> changeObjective: anObjectivePlayer [

	objective := anObjectivePlayer
]

{ #category : #Initialization }
OverloadCard >> initializeTo: anObjectivePlayer [

	objective := anObjectivePlayer
]

{ #category : #Information }
OverloadCard >> isPermanent [

	^ true
]

{ #category : #Information }
OverloadCard >> toString [

	^ 'Overload'
]
