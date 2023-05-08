Class {
	#name : #SpeedUpBox,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #Effect }
SpeedUpBox >> effect: aPlayerCollection affects: aPlayer parsecs: aValue [

	aPlayer effect: 4
]
