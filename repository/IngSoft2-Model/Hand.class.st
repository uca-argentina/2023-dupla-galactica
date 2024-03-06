Class {
	#name : #Hand,
	#superclass : #Object,
	#instVars : [
		'card',
		'holder'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
Hand class >> of: aColor with: aCard [

	^ self new initializeOf: aColor with: aCard
]

{ #category : #Information }
Hand >> card [

	^ card
]

{ #category : #Information }
Hand >> holder [

	^ holder
]

{ #category : #Initialization }
Hand >> initializeOf: aColor with: aCard [

	holder := aColor.
	card := aCard
]
