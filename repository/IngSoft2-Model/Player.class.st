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

{ #category : #Move }
Player >> effect: aValue [

	self spaceship move: aValue
]

{ #category : #Initialization }
Player >> initializeWith: aSpaceship [ 
	spaceship:= aSpaceship.
]

{ #category : #Information }
Player >> lap [
	^self spaceship lap.
]

{ #category : #Move }
Player >> move: aDiceCollection [
	(self spaceship) move: (self throwDice: aDiceCollection).
]

{ #category : #Move }
Player >> moveToTheBeginning [
	self spaceship moveToTheBeginning.
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

	^ aDiceCollection sumNumbers: [ :die | die throw ]
]

{ #category : #Move }
Player >> updateLap: aLength [
	self spaceship updateLap: aLength.
]
