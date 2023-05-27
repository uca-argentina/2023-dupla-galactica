Class {
	#name : #RedoCard,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #Effect }
RedoCard >> applyCards: aGame [ 
	aGame lastCardPlay applyCards: aGame.
]

{ #category : #Information }
RedoCard >> toString [

	^ 'Redo'
]
