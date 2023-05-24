Class {
	#name : #SpeedUpBox,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #Effect }
SpeedUpBox >> effect: aGame [

	aGame moveNext: 4.
]
