Class {
	#name : #CardDealer,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #Cards }
CardDealer >> aRandomCard [

	| value |
	value := 36 atRandom.
	^ value <= 6
		  ifTrue: [OverloadCard new]
		  ifFalse: [ 
			  value <= 12
				  ifTrue: [ SpeedCard new ]
				  ifFalse: [ 
					  value <= 18
						  ifTrue: [ AccelerationCard new]
						  ifFalse: [ 
							  value <= 24
								  ifTrue: [CancellationCard new]
								  ifFalse: [ 
									  value <= 30
										  ifTrue: [RedoCard new ]
										  ifFalse: [ RepeatCard new ] ] ] ] ]
]

{ #category : #Cards }
CardDealer >> dealCards: aPlayerCollection [ 
	aPlayerCollection do: [:player | player addCard: self aRandomCard. player addCard: self aRandomCard]
]
