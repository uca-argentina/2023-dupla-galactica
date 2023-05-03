Class {
	#name : #Spaceship,
	#superclass : #Object,
	#instVars : [
		'position',
		'color'
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
]

{ #category : #Move }
Spaceship >> move: value [
	position:= position +value.
]

{ #category : #Information }
Spaceship >> position [
	^position.
]
