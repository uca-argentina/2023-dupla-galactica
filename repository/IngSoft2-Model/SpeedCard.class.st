Class {
	#name : #SpeedCard,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #Effect }
SpeedCard >> applyEffect: aPosition [

	^ aPosition + 1
]

{ #category : #Information }
SpeedCard >> toString [
	^'Speed'.
]
