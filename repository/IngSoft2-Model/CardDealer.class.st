Class {
	#name : #CardDealer,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #Cards }
CardDealer >> aRandomCardTo: aPlayerColor [

	| value |
	value := 36 atRandom.
	^ value <= 6
		  ifTrue: [ OverloadCard owner: aPlayerColor ]
		  ifFalse: [ 
			  value <= 12
				  ifTrue: [ SpeedCard owner: aPlayerColor ]
				  ifFalse: [ 
					  value <= 18
						  ifTrue: [ AccelerationCard owner: aPlayerColor ]
						  ifFalse: [ 
							  value <= 24
								  ifTrue: [ (CancellationCard owner: aPlayerColor) ]
								  ifFalse: [ 
									  value <= 30
										  ifTrue: [ RedoCard owner: aPlayerColor ]
										  ifFalse: [ RepeatCard owner: aPlayerColor ] ] ] ] ]
]

{ #category : #Cards }
CardDealer >> dealCards: aCardManager to: aColorsCollection [

	aColorsCollection do: [ :color | 
		aCardManager addCard: (self aRandomCardTo: color).
		aCardManager addCard: (self aRandomCardTo: color) ]
]
