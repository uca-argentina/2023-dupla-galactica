Class {
	#name : #ThrowADieTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
ThrowADieTest >> should: anErrorBlock raise: anExceptionClass withMessage: anErrorMessage [

	self
		should: anErrorBlock
		raise: anExceptionClass
		withExceptionDo: [ :error | 
		self assert: error messageText equals: anErrorMessage ]
]

{ #category : #tests }
ThrowADieTest >> testE002CreateDieAndCheckItsNumberOfFaces [

	| aDie |
	aDie := Die with: 3.
	self assert: aDie faces equals: 3
]

{ #category : #tests }
ThrowADieTest >> testE003CreateDieAndCheckItsNumberOfFacesWithDifferentValues [

	| aDie |
	aDie := Die with: 4.
	self assert: aDie faces equals: 4
]

{ #category : #tests }
ThrowADieTest >> testE004CreateLoadedDieAndCheckItsNumberOfFaces [

	| aLoadedDie |
	aLoadedDie := LoadedDie with:
		              (OrderedCollection with: 4 with: 4 with: 4).
	self assert: aLoadedDie numberOffaces equals: 3
]

{ #category : #tests }
ThrowADieTest >> testE005CreateLoadedDieAndCheckItsNumberOfFacesWithDifferentValues [

	| aLoadedDie |
	aLoadedDie := LoadedDie with:
		              (OrderedCollection with: 5 with: 4 with: 4).
	self assert: aLoadedDie numberOffaces equals: 3
]

{ #category : #tests }
ThrowADieTest >> testE006ThrowALoadedDieAndCheckValue [

	| aLoadedDie |
	aLoadedDie := LoadedDie with:
		              (OrderedCollection with: 5 with: 4 with: 4).
	self assert: aLoadedDie throw equals: 5
]

{ #category : #tests }
ThrowADieTest >> testE007ThrowADieAndCheckValue [

	| aDie |
	aDie := Die with: 5.
	self assert: (aDie throw between: 1 and: aDie faces)
]

{ #category : #tests }
ThrowADieTest >> testE008CreateALoadedDieWithAnOrderedCollectionOfValues [

	| aLoadedDie anOrderedCollection |
	anOrderedCollection := OrderedCollection
		                       with: 3
		                       with: 5
		                       with: 7
		                       with: 9.
	aLoadedDie := LoadedDie with: anOrderedCollection.
	self assert: aLoadedDie throw equals: 3
]

{ #category : #tests }
ThrowADieTest >> testE009CreateALoadedDieWithAnOrderedCollectionOfValuesAndThrowItTwice [ 

	| aLoadedDie anOrderedCollection |
	anOrderedCollection := OrderedCollection
		                       with: 3
		                       with: 5
		                       with: 7
		                       with: 9.
	aLoadedDie := LoadedDie with: anOrderedCollection.
	aLoadedDie throw.
	self assert: aLoadedDie throw equals: 5
]

{ #category : #tests }
ThrowADieTest >> testE010CreateALoadedDieWithAnOrderCollectionOfValuesAndThrowItFiveTimes [

	| aLoadedDie anOrderedCollection |
	anOrderedCollection := OrderedCollection
		                       with: 3
		                       with: 5
		                       with: 7
		                       with: 9.
	aLoadedDie := LoadedDie with: anOrderedCollection.
	aLoadedDie throw.
	aLoadedDie throw.
	aLoadedDie throw.
	aLoadedDie throw.
	self assert: aLoadedDie throw equals: 3
]

{ #category : #tests }
ThrowADieTest >> testE011CreateALoadedDieWithNegativeValuesAtFaces [

	self
		should: [ 
		LoadedDie with: (OrderedCollection with: 8 with: -7 with: -2) ]
		raise: Error
		withMessage: 'Cannot create with negative values at faces'
]

{ #category : #tests }
ThrowADieTest >> testE012CreateALoadedDieWithLessThanThreeFaces [

	self
		should: [ LoadedDie with: (OrderedCollection with: 1 with: 1) ]
		raise: Error
		withMessage: 'Cannot create with faces less than 3'
]

{ #category : #tests }
ThrowADieTest >> testE013CreateADieWithNegativeNumberOfFacesThenInvalid [

	self
		should: [ Die with: -2 ]
		raise: Error
		withMessage:
		'Cannot create with negative values at faces or less than 2 faces'
]

{ #category : #tests }
ThrowADieTest >> testE014CreateADieWithNumberOfFacesLessThanThreeThenInvalid [

	self
		should: [ Die with: 2 ]
		raise: Error
		withMessage:
		'Cannot create with negative values at faces or less than 2 faces'
]

{ #category : #tests }
ThrowADieTest >> testE017CreateAShakerAndUseItToThrow [

	| aLoadedDie anOrderedCollection aShaker |
	anOrderedCollection := OrderedCollection
		                       with: 3
		                       with: 5
		                       with: 7
		                       with: 9.
	aLoadedDie := LoadedDie with: anOrderedCollection.
	aShaker := DiceShaker with: aLoadedDie.
	aShaker throwDice.
	self assert: aShaker throwDice equals: 5
]

{ #category : #tests }
ThrowADieTest >> testE018CreateAShakerAndUseItToThrowTwoDice [

	| aLoadedDie anOrderedCollection aShaker aSecondLoadedDie|
	anOrderedCollection := OrderedCollection
		                       with: 3
		                       with: 5
		                       with: 7
		                       with: 9.
	aLoadedDie := LoadedDie with: anOrderedCollection.
	aSecondLoadedDie := LoadedDie with: anOrderedCollection.
	aShaker := DiceShaker with: aLoadedDie.
	aShaker addDie: aSecondLoadedDie.
	aShaker throwDice.
	self assert: aShaker throwDice equals: 10
]
