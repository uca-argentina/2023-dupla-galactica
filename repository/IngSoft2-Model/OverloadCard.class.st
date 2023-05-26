Class {
	#name : #OverloadCard,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #Effect }
OverloadCard >> applyEffect: aPosition [

	^ aPosition - 2
]

{ #category : #Information }
OverloadCard >> toString [
	^'Overload'.
]
