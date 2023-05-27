Class {
	#name : #CancellationCard,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #Information }
CancellationCard >> isPermanent [
	^false.
]

{ #category : #Information }
CancellationCard >> toString [

	^ 'Cancellation'
]
