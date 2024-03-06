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
ThrowADieTest >> testE002CreateADieThenCheckItsNumberOfFaces [

	| aDie |
	aDie := Die with: 3.
	self assert: aDie numberOfFaces equals: 3
]

{ #category : #tests }
ThrowADieTest >> testE004CreateALoadedDieWithAnOrderedCollectionOfValuesThenCheckItsNumberOfFaces [

	| aLoadedDie |
	aLoadedDie := LoadedDie with:
		              (OrderedCollection with: 4 with: 4 with: 4).
	self assert: aLoadedDie numberOfFaces equals: 3
]

{ #category : #tests }
ThrowADieTest >> testE006ThrowALoadedDieWithAnOrderedCollectionOfValuesThenCheckTheValueReturnedIsTheFirstValue [

	| aLoadedDie |
	aLoadedDie := LoadedDie with:
		              (OrderedCollection with: 5 with: 4 with: 4).
	self assert: aLoadedDie throw equals: 5
]

{ #category : #tests }
ThrowADieTest >> testE007ThrowADieThenCheckTheValueReturnedIsInTheFacesRange [

	| aDie |
	aDie := Die with: 5.
	self assert: (aDie throw between: 1 and: aDie numberOfFaces)
]

{ #category : #tests }
ThrowADieTest >> testE009ThrowALoadedDieWithAnOrderedCollectionOfValuesTwiceThenCheckTheValueReturnedIsTheSecondValue [

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
ThrowADieTest >> testE010ThrowALoadedDieWithAnOrderedCollectionOfValuesAllPossibleValuesTimesThenCheckTheValueReturnedIsTheFirstValue [

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
ThrowADieTest >> testE011TryToCreateALoadedDieWithNegativeValuesAtFacesThenFails [

	self
		should: [ 
		LoadedDie with: (OrderedCollection with: 8 with: -7 with: -2) ]
		raise: Error
		withMessage: 'Cannot create with negative values at faces'
]

{ #category : #tests }
ThrowADieTest >> testE012TryToCreateALoadedDieWithLessThanThreeFacesThenFails [

	self
		should: [ LoadedDie with: (OrderedCollection with: 1 with: 1) ]
		raise: Error
		withMessage: 'Cannot create with faces less than 3'
]

{ #category : #tests }
ThrowADieTest >> testE013TryToCreateADieWithNegativeNumberOfFacesThenFails [

	self
		should: [ Die with: -2 ]
		raise: Error
		withMessage:
		'Cannot create with negative values at faces or less than 2 faces'
]

{ #category : #tests }
ThrowADieTest >> testE014TryToCreateADieWithNumberOfFacesLessThanThreeThenFails [

	self
		should: [ Die with: 2 ]
		raise: Error
		withMessage:
		'Cannot create with negative values at faces or less than 2 faces'
]

{ #category : #tests }
ThrowADieTest >> testE017CreateAShakerWithALoadedDieThenUseItToThrowAndCheckTheValueReturned [

	| aLoadedDie anOrderedCollection aShaker |
	anOrderedCollection := OrderedCollection
		                       with: 3
		                       with: 5
		                       with: 7
		                       with: 9.
	aLoadedDie := LoadedDie with: anOrderedCollection.
	aShaker := DiceShaker with: (OrderedCollection with: aLoadedDie).
	self assert: aShaker throwDice equals: 3
]

{ #category : #tests }
ThrowADieTest >> testE018CreateAShakerWithTwoLoadedDieThenUseItToThrowAndCheckTheValueReturned [

	| aLoadedDie anOrderedCollection aShaker aSecondLoadedDie |
	anOrderedCollection := OrderedCollection
		                       with: 3
		                       with: 5
		                       with: 7
		                       with: 9.
	aLoadedDie := LoadedDie with: anOrderedCollection.
	aSecondLoadedDie := LoadedDie with: anOrderedCollection.
	aShaker := DiceShaker with: (OrderedCollection with: aLoadedDie).
	aShaker addDie: aSecondLoadedDie.
	self assert: aShaker throwDice equals: 6
]
