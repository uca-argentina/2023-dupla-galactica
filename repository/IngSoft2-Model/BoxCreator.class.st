Class {
	#name : #BoxCreator,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #Creation }
BoxCreator >> create: aLength and: aParsecCollection [

	| boxes |
	boxes := OrderedCollection new.
	aLength timesRepeat: [ 
		boxes addLast: (self randomBox: aLength and: aParsecCollection) ].
	^ boxes
]

{ #category : #Creation }
BoxCreator >> randomBox: aLength and: aParsecCollection [ 
	| aRandomValue |
	aRandomValue := 100 atRandom.
	^ aRandomValue <= 40
		  ifTrue: [ NoEffectBox new ]
		  ifFalse: [ 
			  aRandomValue <= 60
				  ifTrue: [ WormHoleBox new ]
				  ifFalse: [ 
					  aRandomValue <= 80
						  ifTrue: [ SpeedUpBox new ]
						  ifFalse: [ 
							  aRandomValue <= 90
								  ifTrue: [ MoonWalkBox with: (aLength) ]
								  ifFalse: [ 
									  aRandomValue <= 98
										  ifTrue: [ HyperJumpBox with: aParsecCollection ]
										  ifFalse: [ AtomicBombBox new ] ] ] ] ]
]
