Class {
	#name : #WormHoleBox,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #Effect }
WormHoleBox >> effect: aBoard [ 
	(aBoard players at: aBoard nextOne) effect: -4.
]
