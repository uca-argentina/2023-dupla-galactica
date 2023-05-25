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
	^(self new) initializeWith: aColorCollection and: aBoard throwing: aDice winningWhen: aValue.
]

{ #category : #Information }
DuplaGalacticaGameProxy >> boxes [
	^game boxes.
]

{ #category : #Information }
DuplaGalacticaGameProxy >> currentPlayer [
	^ game currentPlayer.
]

{ #category : #Information }
DuplaGalacticaGameProxy >> goalLaps [
	^game goalLaps.
]

{ #category : #Initialization }
DuplaGalacticaGameProxy >> initializeWith: aColorsCollection and: aBoard throwing: aDiceCollection winningWhen: aValue [
	game:= DuplaGalacticaGame with: aColorsCollection and: aBoard throwing: aDiceCollection winningWhen: aValue.
]

{ #category : #Information }
DuplaGalacticaGameProxy >> laps [
	^game laps.
]

{ #category : #Movement }
DuplaGalacticaGameProxy >> moveNextPlayer [
	^game moveNextPlayer.
]

{ #category : #Information }
DuplaGalacticaGameProxy >> parsecs [
	^game parsecs.
]

{ #category : #Information }
DuplaGalacticaGameProxy >> positions [
	^ game positions.
]

{ #category : #Finalization }
DuplaGalacticaGameProxy >> ranking [
	^game ranking.
]

{ #category : #Finalization }
DuplaGalacticaGameProxy >> winner [
	^ game winner.
]
