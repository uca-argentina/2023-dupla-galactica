Class {
	#name : #RandomCardGenerator,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #'Card creation' }
RandomCardGenerator >> createCard: idValue for: aPlayerColor [

	| cardClasses value selectedClass |
	cardClasses := { 
		               OverloadCard.
		               SpeedCard.
		               AccelerationCard.
		               CancellationCard.
		               RedoCard.
		               RepeatCard }.

	value := 6 atRandom.

	selectedClass := cardClasses detect: [ :class | 
		                 value <= (cardClasses indexOf: class) ].

	^ selectedClass owner: aPlayerColor number: idValue
]
