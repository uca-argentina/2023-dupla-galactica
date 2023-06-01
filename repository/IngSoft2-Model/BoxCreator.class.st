Class {
	#name : #BoxCreator,
	#superclass : #Object,
	#instVars : [
		'boxes',
		'probabilities'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'Instance creation' }
BoxCreator class >> use: aBoxesCollection [

	^ self new initializeUse: aBoxesCollection
]

{ #category : #Creation }
BoxCreator >> create: aNumberOfBoxes [

	| boxesCreated |
	boxesCreated := OrderedCollection new.
	aNumberOfBoxes timesRepeat: [ 
		boxesCreated addLast: (self oneRandomBoxOf) ].
	^ boxesCreated
]

{ #category : #Initialization }
BoxCreator >> initializeUse: aBoxesCollection [

	boxes := aBoxesCollection
]

{ #category : #Creation }
BoxCreator >> oneRandomBoxOf [

	| aRandomValue sum|
	sum := 0.
	aRandomValue := 100 atRandom.
	boxes do: [ :box | 
		sum := sum + box probabilitie.
		aRandomValue <= sum ifTrue: [ ^ box ] ]
]
