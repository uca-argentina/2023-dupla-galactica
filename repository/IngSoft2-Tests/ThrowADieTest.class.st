Class {
	#name : #ThrowADieTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
ThrowADieTest >> testE001CreateADie [

	| aDice |
	aDice := Die new.
	self assert: aDice isCreatedSuccessfully
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
	aLoadedDie := LoadedDie with: 5.
	self assert: aLoadedDie throw equals: 2
]
