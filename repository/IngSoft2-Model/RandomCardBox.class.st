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
		ifTrue: [ aGame addCard: (OverloadCard  owner: aGame currentPlayer color) ]
		ifFalse: [ 
			value <= 12
				ifTrue: [ aGame addCard: (SpeedCard  owner: aGame currentPlayer color) ]
				ifFalse: [ 
					value <= 18
						ifTrue: [ aGame addCard: (AccelerationCard  owner: aGame currentPlayer color)]
						ifFalse: [ 
							value <= 24
								ifTrue: [ 
								aGame addCard: (CancellationCard owner: aGame currentPlayer color) ]
								ifFalse: [ 
									value <= 30
										ifTrue: [ aGame addCard: (RedoCard  owner: aGame currentPlayer color) ]
										ifFalse: [ aGame addCard: (RepeatCard  owner: aGame currentPlayer color) ] ] ] ] ]
]

{ #category : #Initialization }
RandomCardBox >> intializeWithChance: aProbabilitie [ 
	probabilitie:= aProbabilitie
]

{ #category : #Information }
RandomCardBox >> probabilitie [
	^ probabilitie
]
