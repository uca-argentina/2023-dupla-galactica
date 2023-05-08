Class {
	#name : #AtomicBombBox,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #Effect }
AtomicBombBox >> effect: aPlayerCollection affects: aPlayer [

	aPlayerCollection do: [ :player | player moveToTheBeginning ]
]
