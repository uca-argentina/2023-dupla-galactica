Class {
	#name : #MoveSpaceshipFromTheBoardTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
MoveSpaceshipFromTheBoardTest >> testA001CreateBoard [
	| aBoard |
	aBoard := Board new.
	self assert: (aBoard isCreatedSuccessfully).
]

{ #category : #tests }
MoveSpaceshipFromTheBoardTest >> testA002CreateSpaceship [
	| aSpaceship |
	aSpaceship := Spaceship new.
	self assert: (aSpaceship isCreatedSuccessfully).
]

{ #category : #tests }
MoveSpaceshipFromTheBoardTest >> testA003AskSpaceshipForItsOwnPosition [

	| aSpaceship |
	aSpaceship := Spaceship putItOnTheBeginning.
	self assert: aSpaceship position identicalTo: 0
]

{ #category : #tests }
MoveSpaceshipFromTheBoardTest >> testA004AskSpaceshipForItsOwnPositionAfterMovingIt [

	| aSpaceship |
	aSpaceship := Spaceship putItOnTheBeginning.
	aSpaceship moveOn: 8.
	self assert: aSpaceship position identicalTo: 8
]

{ #category : #tests }
MoveSpaceshipFromTheBoardTest >> testA005CreateOneSpaceshipPutItOnTheBoardAndThenAskTheBoardForThePositionOfTheSpaceshipThatHasMovedMore [

	| aSpaceship aBoard |
	aSpaceship := Spaceship putItOnTheBeginning.
	aSpaceship moveOn: 8.
	aBoard := Board with: (OrderedCollection with: aSpaceship).
	self assert: aBoard positionOfTheFartherSpaceship identicalTo: 8
]

{ #category : #tests }
MoveSpaceshipFromTheBoardTest >> testA006CreateTwoSpaceshipsPutThemOnTheBoardAndThenAskTheBoardForThePositionOfTheSpaceshipThatHasMovedMore [

	| aSpaceshipRed aSpaceshipBlue aSpaceshipCollection aBoard |
	aSpaceshipRed := Spaceship putItOnTheBeginning.
	aSpaceshipRed moveOn: 8.
	aSpaceshipBlue := Spaceship putItOnTheBeginning.
	aSpaceshipBlue moveOn: 9.
	
	aSpaceshipCollection := OrderedCollection with: aSpaceshipRed with: aSpaceshipBlue.
	aBoard := Board with: aSpaceshipCollection.
	self assert: aBoard positionOfTheFartherSpaceship identicalTo: 9
]

{ #category : #tests }
MoveSpaceshipFromTheBoardTest >> testA007CreateABoardWithASpecificSize [

	| aBoard |
	aBoard := Board withSizeOf: 9.
	self assert: aBoard sizeIs identicalTo: 9.
]

{ #category : #tests }
MoveSpaceshipFromTheBoardTest >> testA008CreateABoardWithASpecificSizeAndTwoSpaceships [

| aSpaceshipRed aSpaceshipBlue aSpaceshipCollection aBoard |
	aSpaceshipRed := Spaceship putItOnTheBeginning.
	aSpaceshipRed moveOn: 8.
	aSpaceshipBlue := Spaceship putItOnTheBeginning.
	aSpaceshipBlue moveOn: 9.
	
	aSpaceshipCollection := OrderedCollection with: aSpaceshipRed with: aSpaceshipBlue.
	aBoard := Board withSizeOf: 10 and: aSpaceshipCollection.
	self assert: aBoard positionOfTheFartherSpaceship identicalTo: 9
]

{ #category : #tests }
MoveSpaceshipFromTheBoardTest >> testA009CreateABoardWithASpecificSizeAndTwoSpaceshipsThenMoveThemAndInformIfSomeoneAchiveTheGoal [

| aSpaceshipRed aSpaceshipBlue aSpaceshipCollection aBoard |
	aSpaceshipRed := Spaceship putItOnTheBeginning.
	aSpaceshipRed moveOn: 8.
	aSpaceshipBlue := Spaceship putItOnTheBeginning.
	aSpaceshipBlue moveOn: 9.
	
	aSpaceshipCollection := OrderedCollection with: aSpaceshipRed with: aSpaceshipBlue.
	aBoard := Board withSizeOf: 10 and: aSpaceshipCollection.
	self deny: ((aBoard winnerExists))
]

{ #category : #tests }
MoveSpaceshipFromTheBoardTest >> testA010CreateABoardWithASpecificSizeAndTwoSpaceshipsThenMoveThemToTheGoalAndInformIfSomeoneAchiveTheGoal [

| aSpaceshipRed aSpaceshipBlue aSpaceshipCollection aBoard |
	aSpaceshipRed := Spaceship putItOnTheBeginning.
	aSpaceshipRed moveOn: 8.
	aSpaceshipBlue := Spaceship putItOnTheBeginning.
	aSpaceshipBlue moveOn: 10.
	
	aSpaceshipCollection := OrderedCollection with: aSpaceshipRed with: aSpaceshipBlue.
	aBoard := Board withSizeOf: 10 and: aSpaceshipCollection.
	self assert: ((aBoard winnerExists))
]

{ #category : #tests }
MoveSpaceshipFromTheBoardTest >> testA011CreateABoardWithASpecificSizeAndTwoSpaceshipsAndInformthatNobodyAchieveTheGoal [

| aSpaceshipRed aSpaceshipBlue aSpaceshipCollection aBoard |
	aSpaceshipRed := Spaceship putItOnTheBeginning.
	aSpaceshipRed moveOn: 8.
	aSpaceshipBlue := Spaceship putItOnTheBeginning.
	aSpaceshipBlue moveOn: 9.
	
	aSpaceshipCollection := OrderedCollection with: aSpaceshipRed with: aSpaceshipBlue.
	aBoard := Board withSizeOf: 10 and: aSpaceshipCollection.
	self assert: (((aBoard winner) asSymbol) == (('Nobody') asSymbol))
]

{ #category : #tests }
MoveSpaceshipFromTheBoardTest >> testA012CreateABoardWithASpecificSizeAndTwoSpaceshipsMoveTheBlueOneToTheGoalAndInformthatHeAchieveTheGoal [

| aSpaceshipRed aSpaceshipBlue aSpaceshipCollection aBoard |
	aSpaceshipRed := Spaceship putItOnThePosition: 0 withColor: 'red'.
	aSpaceshipRed moveOn: 8.
	aSpaceshipBlue := Spaceship putItOnThePosition: 0 withColor: 'blue'.
	aSpaceshipBlue moveOn: 10.
	
	aSpaceshipCollection := OrderedCollection with: aSpaceshipRed with: aSpaceshipBlue.
	aBoard := Board withSizeOf: 10 and: aSpaceshipCollection.
	self assert: (((aBoard winner) asSymbol) == (('blue') asSymbol))
]

{ #category : #tests }
MoveSpaceshipFromTheBoardTest >> testA013CreateABoardWithASpecificSizeAndTwoSpaceshipsAskForTheFinalsPositionsAndInformThatTheGameHasNotFinishedYet [

| aSpaceshipRed aSpaceshipBlue aSpaceshipCollection aBoard |
	aSpaceshipRed := Spaceship putItOnThePosition: 0 withColor: 'red'.
	aSpaceshipRed moveOn: 8.
	aSpaceshipBlue := Spaceship putItOnThePosition: 0 withColor: 'blue'.
	aSpaceshipBlue moveOn: 9.
	
	aSpaceshipCollection := OrderedCollection with: aSpaceshipRed with: aSpaceshipBlue.
	aBoard := Board withSizeOf: 10 and: aSpaceshipCollection.
	self assert: (((aBoard finalPositionOfSpaceShips) asSymbol) == (('the game has not finished yet') asSymbol))
]

{ #category : #tests }
MoveSpaceshipFromTheBoardTest >> testA014CreateABoardWithASpecificSizeAndTwoSpaceshipsAskForTheFinalsPositionsAndInformTheFinalPositions [

| aSpaceshipRed aSpaceshipBlue aSpaceshipCollection aBoard |
	aSpaceshipRed := Spaceship putItOnThePosition: 0 withColor: 'red'.
	aSpaceshipRed moveOn: 8.
	aSpaceshipBlue := Spaceship putItOnThePosition: 0 withColor: 'blue'.
	aSpaceshipBlue moveOn: 10.
	
	aSpaceshipCollection := OrderedCollection with: aSpaceshipRed with: aSpaceshipBlue.
	aBoard := Board withSizeOf: 10 and: aSpaceshipCollection.
	self assert: (((aBoard finalPositionOfSpaceShips) asSymbol) == (('red:8 blue:10 ') asSymbol))
]

{ #category : #tests }
MoveSpaceshipFromTheBoardTest >> testA015CreateABoardWithASpecificSizeAndTwoSpaceshipsAskForTheFinalsPositionsAndInformTheFinalPositions [

| aSpaceshipRed aSpaceshipBlue aSpaceshipCollection aBoard |
	aSpaceshipRed := Spaceship putItOnThePosition: 0 withColor: 'red'.
	aSpaceshipRed moveOn: 9.
	aSpaceshipBlue := Spaceship putItOnThePosition: 0 withColor: 'blue'.
	aSpaceshipBlue moveOn: 10.
	
	aSpaceshipCollection := OrderedCollection with: aSpaceshipRed with: aSpaceshipBlue.
	aBoard := Board withSizeOf: 10 and: aSpaceshipCollection.
	self assert: (((aBoard finalPositionOfSpaceShips) asSymbol) == (('red:9 blue:10 ') asSymbol))
]
