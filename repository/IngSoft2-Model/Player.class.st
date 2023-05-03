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

{ #category : #Information }
Player >> color [
	^(self spaceship) color.
]

{ #category : #Initialization }
Player >> initializeWith: aSpaceship [ 
	spaceship:= aSpaceship.
]

{ #category : #Move }
Player >> move: aDiceCollection [
	(self spaceship) move: (self throwDice: aDiceCollection).
]

{ #category : #Information }
Player >> position [
	^(self spaceship ) position.
]

{ #category : #Information }
Player >> spaceship [
	^ spaceship
]

{ #category : #Move }
Player >> throwDice: aDiceCollection [
	| value |
	value := 0.
	aDiceCollection do: [ :die | value := value + die throw ].
	^value.
]
