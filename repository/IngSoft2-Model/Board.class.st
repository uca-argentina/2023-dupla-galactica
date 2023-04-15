Class {
	#name : #Board,
	#superclass : #Object,
	#instVars : [
		'spaceshipOnBoard',
		'sizeOfBoard'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
Board class >> with: aSpaceship [ 
	^(self new) initializeWith: aSpaceship.
]

{ #category : #initialize }
Board class >> withSizeOf: aSize [ 
	^(self new) initializeWithSizeOf: aSize.
]

{ #category : #'instance creation' }
Board class >> withSizeOf: aValue and: aCollectionOfSpaceships [ 
	^((self new) initializeWithSizeOf:aValue) initializeWith: aCollectionOfSpaceships.
]

{ #category : #'spaceships position' }
Board >> fartherPosition [

	| max |
	max := 0.
	spaceshipOnBoard do: [ :spaceship | 
		max < spaceship whereItIs ifTrue: [ max := spaceship whereItIs ] ].
	^ max
]

{ #category : #initialization }
Board >> initializeWith: aSpaceship [ 
	spaceshipOnBoard:=aSpaceship.
]

{ #category : #'instance creation' }
Board >> initializeWithSizeOf: aSize [ 
	sizeOfBoard:=aSize.
]

{ #category : #creation }
Board >> isCreatedSuccessfully [
	^true.
]

{ #category : #'spaceships position' }
Board >> positionOfTheSpaceshipFarther [
	^ self fartherPosition.
]

{ #category : #size }
Board >> sizeOfItIs [
	^sizeOfBoard.
]
