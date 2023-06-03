Class {
	#name : #RepeatCard,
	#superclass : #Object,
	#instVars : [
		'owners'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'Instance creation' }
RepeatCard class >> owner: anObjectivePlayer [

	^ self new initializeOwner: anObjectivePlayer
]

{ #category : #Information }
RepeatCard >> addOwner: aPlayerColor [

	owners addLast: aPlayerColor
]

{ #category : #Information }
RepeatCard >> applyCard: aGame to: aPlayerColor [

	aGame repeatEffectTo: aPlayerColor
]

{ #category : #Information }
RepeatCard >> eliminateOwner: aPlayerColor [
	|i|
	i:=0.
	owners do: [ :owner | (owner = aPlayerColor and: i=0) ifTrue:[owners remove: owner. i:=1] ]
]

{ #category : #Initialization }
RepeatCard >> initializeOwner: anObjectivePlayer [

	owners := OrderedCollection with: anObjectivePlayer.
]

{ #category : #Information }
RepeatCard >> isPermanent [

	^ false
]

{ #category : #Information }
RepeatCard >> owners [
	^owners .
]

{ #category : #Information }
RepeatCard >> toString [
	^'Repeat'.
]

{ #category : #Information }
RepeatCard >> transformTo: aCard [

	^ self
]
