Class {
	#name : #WormHoleBox,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #Effect }
WormHoleBox >> effect: aBoard [

	aBoard nextOne effect: -4
]
