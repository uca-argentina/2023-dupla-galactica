Class {
	#name : #AtomicBombBox,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #Effect }
AtomicBombBox >> effect: aBoard [

	aBoard players do: [ :player | player moveToTheBeginning ]
]
