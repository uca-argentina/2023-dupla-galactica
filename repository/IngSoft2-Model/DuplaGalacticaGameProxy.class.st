Class {
	#name : #DuplaGalacticaGameProxy,
	#superclass : #Object,
	#instVars : [
		'game'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'Instance creation' }
DuplaGalacticaGameProxy class >> with: aColorCollection and: aBoard usingToThrow: aDiceShaker winningWhen: aValue using: aCardDealer [

	^ self new
		  initializeWith: aColorCollection
		  and: aBoard
		  usingToThrow: aDiceShaker
		  winningWhen: aValue
		  using: aCardDealer
]

{ #category : #Cards }
DuplaGalacticaGameProxy >> apply: aCard [

	game apply: aCard
]

{ #category : #Information }
DuplaGalacticaGameProxy >> boxes [

	^ game boxes
]

{ #category : #Information }
DuplaGalacticaGameProxy >> currentPlayer [

	^ game currentPlayer
]

{ #category : #Information }
DuplaGalacticaGameProxy >> goalLaps [

	^ game goalLaps
]

{ #category : #Initialization }
DuplaGalacticaGameProxy >> initializeWith: aColorsCollection and: aBoard usingToThrow: aDiceShaker winningWhen: aValue using: aCardDealer [

	game := DuplaGalacticaGame
		        with: aColorsCollection
		        and: aBoard
		        usingToThrow: aDiceShaker
		        winningWhen: aValue
		        using: aCardDealer
]

{ #category : #Information }
DuplaGalacticaGameProxy >> lightYears [

	^ game lightYears
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
DuplaGalacticaGameProxy >> playersBox [

	^ game playersBox
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
