Class {
	#name : #DuplaGalacticaGameProxy,
	#superclass : #Object,
	#instVars : [
		'game'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'Instance creation' }
DuplaGalacticaGameProxy class >> with: aColorCollection and: aBoard throwing: aDice winningWhen: aValue [

	^ self new
		  initializeWith: aColorCollection
		  and: aBoard
		  throwing: aDice
		  winningWhen: aValue
]

{ #category : #Movement }
DuplaGalacticaGameProxy >> applyCard: aCardName from: aSourcePlayer [

	game applyCard: aCardName from: aSourcePlayer
]

{ #category : #Information }
DuplaGalacticaGameProxy >> boxes [

	^ game boxes
]

{ #category : #Information }
DuplaGalacticaGameProxy >> currentPlayer [

	^ game currentPlayer color
]

{ #category : #Information }
DuplaGalacticaGameProxy >> goalLaps [

	^ game goalLaps
]

{ #category : #Initialization }
DuplaGalacticaGameProxy >> initializeWith: aColorsCollection and: aBoard throwing: aDiceCollection winningWhen: aValue [

	game := DuplaGalacticaGame
		        with: aColorsCollection
		        and: aBoard
		        throwing: aDiceCollection
		        winningWhen: aValue
]

{ #category : #Movement }
DuplaGalacticaGameProxy >> movePlayer [

	^ game movePlayer
]

{ #category : #Information }
DuplaGalacticaGameProxy >> parsecs [

	^ game parsecs
]

{ #category : #Information }
DuplaGalacticaGameProxy >> playersCardInPosetion [

	^ game playersCardInPosetion
]

{ #category : #Information }
DuplaGalacticaGameProxy >> playersLaps [

	^ game playersLaps
]

{ #category : #Information }
DuplaGalacticaGameProxy >> playersPositions [

	^ game playersPositions
]

{ #category : #Finalization }
DuplaGalacticaGameProxy >> ranking [

	^ game ranking
]

{ #category : #Finalization }
DuplaGalacticaGameProxy >> winner [

	^ game winner
]
