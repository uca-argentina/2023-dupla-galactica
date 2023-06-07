Class {
	#name : #RandomCardBox,
	#superclass : #Object,
	#instVars : [
		'probability'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #Initialization }
RandomCardBox class >> withChance: aProbability [ 
	^self new initializeWithChance: aProbability.
]

{ #category : #Effect }
RandomCardBox >> effect: aGame [

	| value |
	value := 36 atRandom.
	value <= 6
		ifTrue: [ 
			aGame addCard: (OverloadCard
					 owner: aGame currentPlayer color
					 number: aGame numberOfCards + 1) ]
		ifFalse: [ 
			value <= 12
				ifTrue: [ 
					aGame addCard: (SpeedCard
							 owner: aGame currentPlayer color
							 number: aGame numberOfCards + 1) ]
				ifFalse: [ 
					value <= 18
						ifTrue: [ 
							aGame addCard: (AccelerationCard
									 owner: aGame currentPlayer color
									 number: aGame numberOfCards + 1) ]
						ifFalse: [ 
							value <= 24
								ifTrue: [ 
									aGame addCard: (CancellationCard
											 owner: aGame currentPlayer color
											 number: aGame numberOfCards + 1) ]
								ifFalse: [ 
									value <= 30
										ifTrue: [ 
											aGame addCard: (RedoCard
													 owner: aGame currentPlayer color
													 number: aGame numberOfCards + 1) ]
										ifFalse: [ 
											aGame addCard: (RepeatCard
													 owner: aGame currentPlayer color
													 number: aGame numberOfCards + 1) ] ] ] ] ]
]

{ #category : #Initialization }
RandomCardBox >> initializeWithChance: aProbability [

	probability := aProbability
]

{ #category : #Information }
RandomCardBox >> probability [

	^ probability
]
