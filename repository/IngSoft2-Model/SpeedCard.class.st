Class {
	#name : #SpeedCard,
	#superclass : #Object,
	#instVars : [
		'objective'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'Instance creation' }
SpeedCard class >> to: anObjectivePlayer [

	^ self new initializeTo: anObjectivePlayer
]

{ #category : #Effect }
SpeedCard >> applyCard: activeCardsCollection [

	activeCardsCollection addLast: self.
	^ activeCardsCollection
]

{ #category : #Effect }
SpeedCard >> applyEffect: aPosition [

	^ aPosition + 1
]

{ #category : #Initialization }
SpeedCard >> initializeTo: anObjectivePlayer [

	objective := anObjectivePlayer
]

{ #category : #Information }
SpeedCard >> isPermanent [

	^ true
]

{ #category : #Information }
SpeedCard >> objective [
	^ objective
]

{ #category : #Information }
SpeedCard >> toString [

	^ 'Speed'
]

{ #category : #Information }
SpeedCard >> transformTo: aCard [

	^ self
]
