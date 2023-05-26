Class {
	#name : #AccelerationCard,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #Effect }
AccelerationCard >> applyEffect: aPosition [

	^ aPosition + 1
]

{ #category : #Information }
AccelerationCard >> toString [
	^'Acceleration'.
]
