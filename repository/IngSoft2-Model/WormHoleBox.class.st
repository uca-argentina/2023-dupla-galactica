Class {
	#name : #WormHoleBox,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #Effect }
WormHoleBox >> effect: aGame [

	aGame moveNext: -4.
]
