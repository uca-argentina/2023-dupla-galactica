Class {
	#name : #RedoCard,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #'Instance creation' }
RedoCard class >> initializeNew [

	^ self new initializeNew
]

{ #category : #Initialization }
RedoCard >> = aCard [

	^ aCard isKindOf: self class
]

{ #category : #Effect }
RedoCard >> applyCardUsing: aCardManager to: anObjective at: aDuplaGalacticaGame [

	aCardManager lastCardPlay = NoEffectCard initializeNew
		ifTrue: [ 
			Error signal:
				'Redo card cannot be played because there are no cards that have been played before' ]
		ifFalse: [ 
			aCardManager lastCardPlay
				applyCardUsing: aCardManager
				to: anObjective
				at: aDuplaGalacticaGame ]
]

{ #category : #Information }
RedoCard >> haveEffect [

	^ false
]

{ #category : #Initialization }
RedoCard >> initializeNew [
]

{ #category : #Information }
RedoCard >> isPermanent [

	^ false
]
