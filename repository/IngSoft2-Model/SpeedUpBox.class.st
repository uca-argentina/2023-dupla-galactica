Class {
	#name : #SpeedUpBox,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #Effect }
SpeedUpBox >> effect: aBoard [

	aBoard nextOne effect: 4 check: aBoard length.
]
