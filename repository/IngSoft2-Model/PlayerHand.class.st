Class {
	#name : #PlayerHand,
	#superclass : #Object,
	#instVars : [
		'card',
		'holder'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'Instance creation' }
PlayerHand class >> of: aColor with: aCard [

	^ self new initializeOf: aColor with: aCard
]

{ #category : #Information }
PlayerHand >> card [

	^ card
]

{ #category : #Information }
PlayerHand >> holder [

	^ holder
]

{ #category : #Initialization }
PlayerHand >> initializeOf: aColor with: aCard [

	holder := aColor.
	card := aCard
]
