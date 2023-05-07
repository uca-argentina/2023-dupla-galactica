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

{ #category : #Information }
Spaceship >> position [
	^position.
]

{ #category : #Move }
Spaceship >> updateLap: aLength [

	self position > aLength ifFalse: [ ^ self ].
	position := position - aLength.
	lap := lap + 1
]
