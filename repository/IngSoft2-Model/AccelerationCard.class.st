Class {
	#name : #AccelerationCard,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #Effect }
AccelerationCard >> applyCard: activeCardsCollection [

	activeCardsCollection addLast: self.
	^ activeCardsCollection
]

{ #category : #Effect }
AccelerationCard >> applyEffect: aPosition [

	^ aPosition + 1
]

{ #category : #Information }
AccelerationCard >> isPermanent [

	^ true
]

{ #category : #Information }
AccelerationCard >> objective [
	^'all'
]

{ #category : #Information }
AccelerationCard >> toString [

	^ 'Acceleration'
]
