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
DuplaGalacticaGameProxy >> addAccelerationCardTo: aPlayer [

	game addAccelerationCardTo: aPlayer
]

{ #category : #Movement }
DuplaGalacticaGameProxy >> addOverLoadCardTo: aPlayer [
	game addOverLoadCardTo: aPlayer.
]

{ #category : #Movement }
DuplaGalacticaGameProxy >> addSpeedCardTo: aPlayer [
	game addSpeedCardTo: aPlayer.
]

{ #category : #Movement }
DuplaGalacticaGameProxy >> applyAccelerationCard [

	game applyAccelerationCard
]

{ #category : #Movement }
DuplaGalacticaGameProxy >> applyAccelerationCardFrom: aPlayer [

	game applyAccelerationCardFrom: aPlayer
]

{ #category : #Movement }
DuplaGalacticaGameProxy >> applyCancellationCardTo: aPlayer number: aNumberOfPermanentCard [

	game applyCancellationCardTo: aPlayer number: aNumberOfPermanentCard
]

{ #category : #Movement }
DuplaGalacticaGameProxy >> applyOverloadCardTo: anObjectivePlayer from: aSourcePlayer [ 
	game applyOverloadCardTo: anObjectivePlayer from: aSourcePlayer 
]

{ #category : #Cards }
DuplaGalacticaGameProxy >> applySpeedCardTo: aPlayer [

	game applySpeedCardTo: aPlayer
]

{ #category : #Movement }
DuplaGalacticaGameProxy >> applySpeedCardTo: anObjectivePlayer from: aSourcePlayer [
	game applySpeedCardTo: anObjectivePlayer from: aSourcePlayer
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
