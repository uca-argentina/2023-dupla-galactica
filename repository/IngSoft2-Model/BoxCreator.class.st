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
BoxCreator class >> use: aBoxesCollection withProbabilities: probabilitesCollection [

	^ self new
		  initializeUse: aBoxesCollection
		  withProbabilities: probabilitesCollection
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
BoxCreator >> initializeUse: aBoxesCollection withProbabilities: probabilitesCollection [

	boxes := aBoxesCollection.
	probabilities := probabilitesCollection
]

{ #category : #Creation }
BoxCreator >> oneRandomBoxOf [

	| aRandomValue sum i|
	sum:= 0.
	i:=1.
	aRandomValue := 100 atRandom.
	boxes do: [ :box | (sum:= sum+ (probabilities at:i)).aRandomValue <= sum ifTrue:[^box]. i:=i+1]
]
