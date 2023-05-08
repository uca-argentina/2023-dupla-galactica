Class {
	#name : #WormHoleBox,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #Effect }
WormHoleBox >> effect: aPlayerCollection affects: aPlayer [

	aPlayer effect: -4
]
