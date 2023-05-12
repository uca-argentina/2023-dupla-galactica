Class {
	#name : #SpeedUpBox,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #Effect }
SpeedUpBox >> effect: aBoard [ 
	(aBoard players at: aBoard nextOne) effect: 4.
]
