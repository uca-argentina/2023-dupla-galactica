Class {
	#name : #EveryPlayer,
	#superclass : #Object,
	#instVars : [
		'players'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'Instance creation' }
EveryPlayer class >> initializeNew [

	^ self new initializeNew
]

{ #category : #Initialization }
EveryPlayer >> initializeNew [

	players := 'everyone'
]

{ #category : #Information }
EveryPlayer >> players [

	^ players
]
