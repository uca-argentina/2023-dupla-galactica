Class {
	#name : #ThrowADieTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

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
	aLoadedDie := LoadedDie with: 4.
	self assert: aLoadedDie faces equals: 4
]

{ #category : #tests }
ThrowADieTest >> testE005CreateLoadedDieAndCheckItsNumberOfFacesWithDifferentValues [

	| aLoadedDie |
	aLoadedDie := LoadedDie with: 5.
	self assert: aLoadedDie faces equals: 5
]

{ #category : #tests }
ThrowADieTest >> testE006ThrowALoadedDieAndCheckValue [

	| aLoadedDie |
	aLoadedDie := LoadedDie with: (OrderedCollection with: 5).
	self assert: aLoadedDie throw equals: 5.
]

{ #category : #tests }
ThrowADieTest >> testE007ThrowADieAndCheckValue [

	| aDie |
	aDie := Die with: 5.
	self assert: (aDie throw between: 1 and: (aDie faces)).
]

{ #category : #tests }
ThrowADieTest >> testE008CreateALoadedDieWithAOrderCollectionOfValues [

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
ThrowADieTest >> testE009CreateALoadedDieWithAOrderCollectionOfValuesAndThrowItTwice [

	| aLoadedDie anOrderedCollection |
	anOrderedCollection := OrderedCollection
		                       with: 3
		                       with: 5
		                       with: 7
		                       with: 9.
	aLoadedDie := LoadedDie with: anOrderedCollection.
	aLoadedDie throw.
	self assert: aLoadedDie throw equals: 5.
]

{ #category : #tests }
ThrowADieTest >> testE010CreateALoadedDieWithAOrderCollectionOfValuesAndThrowItFiveTimes [

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
	self assert: aLoadedDie throw equals: 3.
]
