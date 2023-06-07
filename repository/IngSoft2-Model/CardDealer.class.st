Class {
	#name : #CardDealer,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #Cards }
CardDealer >> aRandomCardTo: aPlayerColor withId: idValue [

	| value |
	value := 36 atRandom.
	^ value <= 6
		  ifTrue: [ OverloadCard owner: aPlayerColor number: idValue ]
		  ifFalse: [ 
			  value <= 12
				  ifTrue: [ SpeedCard owner: aPlayerColor number: idValue]
				  ifFalse: [ 
					  value <= 18
						  ifTrue: [ AccelerationCard owner: aPlayerColor number: idValue]
						  ifFalse: [ 
							  value <= 24
								  ifTrue: [ (CancellationCard owner: aPlayerColor number: idValue) ]
								  ifFalse: [ 
									  value <= 30
										  ifTrue: [ RedoCard owner: aPlayerColor number: idValue ]
										  ifFalse: [ RepeatCard owner: aPlayerColor number: idValue] ] ] ] ]
]

{ #category : #Cards }
CardDealer >> dealCards: aCardManager to: aColorsCollection [

	| idValue |
	idValue := 1.
	aColorsCollection do: [ :color | 
		aCardManager addCard: (self aRandomCardTo: color withId: idValue).
		idValue := idValue + 1.
		aCardManager addCard: (self aRandomCardTo: color withId: idValue).
		idValue := idValue + 1 ]
]
