Class {
	#name : #Player,
	#superclass : #Object,
	#instVars : [
		'spaceship'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
Player class >> with: aSpaceship [ 
	^(self new) initializeWith: aSpaceship.
]

{ #category : #information }
Player >> color [
	^(self spaceship) color.
]

{ #category : #initialization }
Player >> initializeWith: aSpaceship [ 
	spaceship:= aSpaceship.
]

{ #category : #moves }
Player >> moveOn: aDiceCollection [
	|value|
	value:= (self throwDice: aDiceCollection).
	spaceship moveOn: value.
]

{ #category : #information }
Player >> position [
	^(self spaceship ) position.
]

{ #category : #information }
Player >> spaceship [
	^ spaceship
]

{ #category : #information }
Player >> spaceshipColor [
	^(spaceship color).
]

{ #category : #moves }
Player >> throwDice: aDiceCollection [
	| value |
	value := 0.
	aDiceCollection do: [ :die | value := value + die throw ].
	^value.
]
