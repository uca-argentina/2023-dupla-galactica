Class {
	#name : #RandomCardBox,
	#superclass : #Object,
	#instVars : [
		'probabilitie'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'Instance creation' }
RandomCardBox class >> withChance: aProbabilitie [

	^ self new intializeWithChance: aProbabilitie
]

{ #category : #Effect }
RandomCardBox >> effect: aGame [

	| value |
	value := 36 atRandom.
	value <= 6
		ifTrue: [ aGame addCard: 'Overload' to: aGame currentPlayer color ]
		ifFalse: [ 
			value <= 12
				ifTrue: [ aGame addCard: 'Speed' to: aGame currentPlayer color ]
				ifFalse: [ 
					value <= 18
						ifTrue: [ aGame addCard: 'Acceleration' to: aGame currentPlayer color]
						ifFalse: [ 
							value <= 24
								ifTrue: [ 
								aGame addCard: 'Cancellation' to: aGame currentPlayer color ]
								ifFalse: [ 
									value <= 30
										ifTrue: [ aGame addCard: 'Redo' to: aGame currentPlayer color ]
										ifFalse: [ aGame addCard: 'Repeat' to: aGame currentPlayer color ] ] ] ] ]
]

{ #category : #Initialization }
RandomCardBox >> intializeWithChance: aProbabilitie [ 
	probabilitie:= aProbabilitie
]

{ #category : #Information }
RandomCardBox >> probabilitie [
	^ probabilitie
]
