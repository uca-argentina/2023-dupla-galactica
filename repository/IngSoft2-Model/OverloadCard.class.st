Class {
	#name : #OverloadCard,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #Effect }
OverloadCard >> applyCards: aGame [
	aGame objective applyCard: self.
]

{ #category : #Effect }
OverloadCard >> applyEffect: aPosition [

	^ aPosition - 2
]

{ #category : #Information }
OverloadCard >> isPermanent [

	^ true
]

{ #category : #Information }
OverloadCard >> toString [

	^ 'Overload'
]
