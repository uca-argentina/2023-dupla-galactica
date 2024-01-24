Class {
	#name : #RedoCard,
	#superclass : #Object,
	#instVars : [
		'holder'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'Instance creation' }
RedoCard class >> holder: aHolder [

	^ self new initializeHolder: aHolder
]

{ #category : #Information }
RedoCard >> = aCard [

	(aCard isKindOf: self class)
		ifTrue: [ ^ aCard isHolder: holder ]
		ifFalse: [ ^ false ]
]

{ #category : #Information }
RedoCard >> haveEffect [

	^ false
]

{ #category : #Initialization }
RedoCard >> initializeHolder: aHolder [

	holder := aHolder.
]

{ #category : #Information }
RedoCard >> isHolder: aColorPlayer [

	^ holder = aColorPlayer
]

{ #category : #Information }
RedoCard >> isPermanent [

	^ false
]
