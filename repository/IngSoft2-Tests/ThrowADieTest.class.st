Class {
	#name : #ThrowADieTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
ThrowADieTest >> testE011CreateALoadedDieWithNegativeAmountOfFaces [
	
	self should: [ LoadedDie with: (OrderedCollection with: 8 with: -7 with: -2)] raise: Error withMessage: 'Cannot create with negative values at faces'.
]

{ #category : #tests }
ThrowADieTest >> testE012CreateALoadedDieWithValuesLessThanTwo [
	
	self should: [ LoadedDie with: (OrderedCollection with: 1 with: 1 with: 1)] raise: Error withMessage: 'Cannot create with negative values at faces'.
]

{ #category : #tests }
ThrowADieTest >> testE013CreateADieWithNegativeNumberOfFacesThenInvalid [
	
	self should: [ Die with: -2] raise: Error withMessage: 'Cannot create with negative values at faces'.
]

{ #category : #tests }
ThrowADieTest >> testE014CreateADieWithNumberOfFacesLessThanTwoThenInvalid [
	
	self should: [ Die with: 1] raise: Error withMessage: 'Cannot create with negative values at faces'.
]
