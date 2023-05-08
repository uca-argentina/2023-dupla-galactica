Class {
	#name : #WormHoleBox,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #Effect }
WormHoleBox >> effect: aPlayerCollection affects: aPlayer parsecs: aValue [

	aPlayer effect: -4
]
