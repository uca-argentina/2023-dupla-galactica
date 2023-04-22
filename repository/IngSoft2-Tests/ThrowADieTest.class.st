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
