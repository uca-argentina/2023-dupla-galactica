Class {
	#name : #SpeedCard,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #Effect }
SpeedCard >> applyCards: aGame [ 
	aGame objective applyCard: self.
]

{ #category : #Effect }
SpeedCard >> applyEffect: aPosition [

	^ aPosition + 1
]

{ #category : #Information }
SpeedCard >> isPermanent [
	^true.
]

{ #category : #Information }
SpeedCard >> toString [

	^ 'Speed'
]
