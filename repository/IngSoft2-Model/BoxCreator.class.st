Class {
	#name : #BoxCreator,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #Creation }
BoxCreator >> create: aNumberOfBoxes with: aParsecCollection [

	| boxes |
	boxes := OrderedCollection new.
	aNumberOfBoxes timesRepeat: [ 
		boxes addLast:
			(self oneRandomBoxOf: aNumberOfBoxes with: aParsecCollection) ].
	^ boxes
]

{ #category : #Creation }
BoxCreator >> createRandomParsecs: possibleValues [

	| aParsecsCollection |
	aParsecsCollection := OrderedCollection new.
	possibleValues size atRandom to: possibleValues size atRandom do: [ 
	:i | aParsecsCollection addLast: (possibleValues at: i) ].

	aParsecsCollection isEmpty
		ifTrue: [ 
			aParsecsCollection addLast:
				(possibleValues at: possibleValues size atRandom) ]
		ifFalse: [ aParsecsCollection sort: [ :a :b | a > b ] ].
	^ aParsecsCollection
]

{ #category : #Creation }
BoxCreator >> oneRandomBoxOf: aNumberOfBoxes with: aParsecCollection [

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
								  ifTrue: [ MoonWalkBox with: aNumberOfBoxes atRandom * -1 ]
								  ifFalse: [ 
									  aRandomValue <= 98
										  ifTrue: [ 
										  HyperJumpBox with:
											  (self createRandomParsecs: aParsecCollection) ]
										  ifFalse: [ AtomicBombBox new ] ] ] ] ]
]
