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

{ #category : #'verifying winner' }
Board >> doSomeoneWin [
	^(self spaceshipsOnIt anySatisfy: [:spaceship | (spaceship whereItIs > self sizeOfItIs) or: (spaceship whereItIs == self sizeOfItIs) ]).
]

{ #category : #'spaceships position' }
Board >> fartherPosition [

	| max |
	max := 0.
	self spaceshipsOnIt do: [ :spaceship | 
		max < spaceship whereItIs ifTrue: [ max := spaceship whereItIs ] ].
	^ max
]

{ #category : #'verifying winner' }
Board >> finalPositionOfSpaceShips [

	| message color position |
	self doSomeoneWin
		ifTrue: [ 
			message := ''.
			self spaceshipsOnIt do: [ :spaceship | 
				color := spaceship spaceshipColor.
				position := spaceship whereItIs.
				message:=message,color,':',position asString,' '.
				].
				^message.]
		ifFalse: [ ^ 'the game has not finished yet' ]
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

{ #category : #'spaceships position' }
Board >> spaceshipsOnIt [
	^ spaceshipOnBoard.
]

{ #category : #'verifying winner' }
Board >> whoAchieveTheGoal [
	(self doSomeoneWin) ifTrue:[^((self spaceshipsOnIt detect: [:spaceship | ((spaceship whereItIs > self sizeOfItIs) or: (spaceship whereItIs == self sizeOfItIs))]) spaceshipColor)] ifFalse:[^'Nobody'].
]
