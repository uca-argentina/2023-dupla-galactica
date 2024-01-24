Class {
	#name : #EmptyCard,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #Effect }
EmptyCard >> generalObjective [

	^ false.
]

{ #category : #Effect }
EmptyCard >> haveEffect [

	Error signal:
		'Redo card cannot be played because there are no cards that have been played before'
]
