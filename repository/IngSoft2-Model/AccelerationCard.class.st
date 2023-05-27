Class {
	#name : #AccelerationCard,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #Effect }
AccelerationCard >> applyCards: aGame [

	aGame players do: [ :player | player applyCard: self]
]

{ #category : #Effect }
AccelerationCard >> applyEffect: aPosition [

	^ aPosition + 1
]

{ #category : #Information }
AccelerationCard >> isPermanent [
	^true.
]

{ #category : #Information }
AccelerationCard >> toString [

	^ 'Acceleration'
]
