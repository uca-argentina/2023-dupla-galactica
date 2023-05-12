Class {
	#name : #Spaceship,
	#superclass : #Object,
	#instVars : [
		'position',
		'color',
		'lap'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
Spaceship class >> with: aColor [
	^(self new) initializeWith: aColor.
]

{ #category : #Move }
Spaceship >> changeLap: aValue [
	lap:=lap +aValue.
]

{ #category : #Information }
Spaceship >> color [
	^color.
]

{ #category : #Initialization }
Spaceship >> initializeWith: aColor [
	position:=0.
	color:=aColor.
	lap:=0.
]

{ #category : #Information }
Spaceship >> lap [
	^lap.
]

{ #category : #Move }
Spaceship >> move: value [
	position:= position +value.
]

{ #category : #Move }
Spaceship >> moveToTheBeginning [
	position := 1.
]

{ #category : #Information }
Spaceship >> position [
	^position.
]

{ #category : #Move }
Spaceship >> updateLap: aLength [

	| entireLaps |
	entireLaps := self position // aLength.
	self position > aLength
		ifTrue: [ 
			position := position - (aLength * entireLaps).
			lap := lap + entireLaps ]
		ifFalse: [ 
			self position < 0 ifTrue: [ 
				entireLaps := self position abs // aLength + 1.
				lap := lap - entireLaps.
				position := aLength - self position abs] ]
]
