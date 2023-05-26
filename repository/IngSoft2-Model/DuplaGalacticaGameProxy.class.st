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
DuplaGalacticaGameProxy >> applyAccelerationCard [

	game applyAccelerationCard
]

{ #category : #Movement }
DuplaGalacticaGameProxy >> applyCancellationCardTo: aPlayer number: aNumberOfPermanentCard [

	game applyCancellationCardTo: aPlayer number: aNumberOfPermanentCard
]

{ #category : #Movement }
DuplaGalacticaGameProxy >> applyOverloadCardTo: aPlayer [

	game applyOverloadCardTo: aPlayer
]

{ #category : #Cards }
DuplaGalacticaGameProxy >> applySpeedCardTo: aPlayer [

	game applySpeedCardTo: aPlayer
]

{ #category : #Information }
DuplaGalacticaGameProxy >> boxes [

	^ game boxes
]

{ #category : #Information }
DuplaGalacticaGameProxy >> currentPlayer [

	^ game currentPlayerColor
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
