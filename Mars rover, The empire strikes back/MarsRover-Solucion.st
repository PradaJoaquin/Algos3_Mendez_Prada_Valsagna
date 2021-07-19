!classDefinition: #TestMarsRover category: 'MarsRover-Solucion'!
TestCase subclass: #TestMarsRover
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:42:57'!
test01MarsRoverDoestNotMoveWhenNoCommandsAreSent

	self assertRoverStartingAt: 0@0 heading: #North afterProcessing: '' endsAt: 0@0 heading: #North! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:43:05'!
test02RoverFacingNorthCanMoveForward

	self assertRoverStartingAt: 0@0 heading: #North afterProcessing: 'f' endsAt: 0@1 heading: #North! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:43:13'!
test03RoverFacingNorthCanMoveBackward

	self assertRoverStartingAt: 0@0 heading: #North afterProcessing: 'b' endsAt: 0@-1 heading: #North! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:43:24'!
test04RoverFacingNorthHeadsEastAfterTurningRight

	self assertRoverStartingAt: 0@0 heading: #North afterProcessing: 'r' endsAt: 0@0 heading: #East! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:43:55'!
test05RoverFacingNorthHeadsWestAfterTurningLeft
	
	self assertRoverStartingAt: 0@0 heading: #North afterProcessing: 'l' endsAt: 0@0 heading: #West! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:44:26'!
test06RoverFacingEastHeadsSouthWhenTurningRight
	
	self assertRoverStartingAt: 0@0 heading: #East afterProcessing: 'r' endsAt: 0@0 heading: #South! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:44:43'!
test07RoverFacingSouthHeadsWestWhenTurningRight
	
	self assertRoverStartingAt: 0@0 heading: #South afterProcessing: 'r' endsAt: 0@0 heading: #West! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:45:00'!
test08RoverFacingWestHeadsNorthWhenTurningRight
	
	self assertRoverStartingAt: 0@0 heading: #West afterProcessing: 'r' endsAt: 0@0 heading: #North! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:45:20'!
test09RoverFacingEastHeadsNorthWhenTurningLeft
	
	self assertRoverStartingAt: 0@0 heading: #East afterProcessing: 'l' endsAt: 0@0 heading: #North! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:45:52'!
test10RoverFacingSouthHeadsEastWhenTurningLeft

	self assertRoverStartingAt: 0@0 heading: #South afterProcessing: 'l' endsAt: 0@0 heading: #East! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:46:17'!
test11RoverFacingWestHeadsSouthWhenTurningLeft

	self assertRoverStartingAt: 0@0 heading: #West afterProcessing: 'l' endsAt: 0@0 heading: #South! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:47:36'!
test12RoverFacingEastCanMoveForward
	
	self assertRoverStartingAt: 0@0 heading: #East afterProcessing: 'f' endsAt: 1@0 heading: #East! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:47:55'!
test13RoverFacingEastCanMoveBackwards

	self assertRoverStartingAt: 0@0 heading: #East afterProcessing: 'b' endsAt: -1@0 heading: #East! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:48:20'!
test14RoverFacingSouthCanMoveForward
	
	self assertRoverStartingAt: 0@0 heading: #South afterProcessing: 'f' endsAt: 0@-1 heading: #South! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:48:38'!
test15RoverFacingSouthCanMoveBackward
	
	self assertRoverStartingAt: 0@0 heading: #South afterProcessing: 'b' endsAt: 0@1 heading: #South! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:49:10'!
test16RoverFacingWestCanMoveForward
	
	self assertRoverStartingAt: 0@0 heading: #West afterProcessing: 'f' endsAt: -1@0 heading: #West! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:49:46'!
test17RoverFacingWestCanMoveBackward

	self assertRoverStartingAt: 0@0 heading: #West afterProcessing: 'b' endsAt: 1@0 heading: #West! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:50:56'!
test18RoverCanProcessMultipleCommands

	self assertRoverStartingAt: 0@0 heading: #North afterProcessing: 'ff' endsAt: 0@2 heading: #North! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 6/30/2021 16:05:43'!
test19RoverStopsWhenProcessingAnInvalidCommand

	| marsRover |
	marsRover := MarsRover startingAt: 0@0 heading: #North.
	
	self should: [ marsRover processCommands: 'fxf' ] 
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anException |
			self assert: anException messageText equals: marsRover invalidCommandErrorMessage.
			self assert: (marsRover isAt: 0@1 heading: #North).
		].
	
	! !


!TestMarsRover methodsFor: 'assertions' stamp: 'LL 7/1/2021 00:42:36'!
assertRoverStartingAt: aPosition heading: aCardinalPoint afterProcessing: aStringOfCommands endsAt: aFinalPosition heading: aFinalCardinalPoint

	| marsRover |
	marsRover := MarsRover startingAt: aPosition heading: aCardinalPoint.
	
	marsRover processCommands: aStringOfCommands.
	
	self assert: (marsRover isAt: aFinalPosition heading: aFinalCardinalPoint)! !


!classDefinition: #TestMarsRoverLog category: 'MarsRover-Solucion'!
TestCase subclass: #TestMarsRoverLog
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!TestMarsRoverLog methodsFor: 'as yet unclassified' stamp: 'FV 7/18/2021 20:07:05'!
test01MarsRoverLogIsEmptyWhenNoCommandsWereGiven
	
	| marsRover marsRoverLog expectedLog |
	
	marsRover := MarsRover startingAt: (0@0) heading: #North.
	expectedLog := ReadWriteStream with: ''.
	
	
	marsRoverLog := marsRover log.
	self assert: 	marsRoverLog equals: expectedLog.! !

!TestMarsRoverLog methodsFor: 'as yet unclassified' stamp: 'FV 7/18/2021 20:08:10'!
test02MarsRoverLogUpdatesWhenMovingUp
	
	| marsRover marsRoverLog expectedLog |
	
	marsRover := MarsRover startingAt: (0@0) heading: #North.
	expectedLog := ReadWriteStream with: '0@1'.
	
	
	marsRover processCommands: 'f'.
	marsRoverLog := marsRover log.
	self assert: 	marsRoverLog equals: expectedLog.! !

!TestMarsRoverLog methodsFor: 'as yet unclassified' stamp: 'FV 7/18/2021 20:08:38'!
test03MarsRoverLogUpdatesWhenMovingDown

	
	| marsRover marsRoverLog expectedLog |
	
	marsRover := MarsRover startingAt: (0@0) heading: #North.
	expectedLog := ReadWriteStream with: '0@-1'.
	
	
	marsRover processCommands: 'b'.
	marsRoverLog := marsRover log.
	self assert: 	marsRoverLog equals: expectedLog.! !

!TestMarsRoverLog methodsFor: 'as yet unclassified' stamp: 'FV 7/18/2021 20:09:09'!
test04MarsRoverLogUpdatesWhenMovingLeft
	
	| marsRover marsRoverLog expectedLog |
	
	marsRover := MarsRover startingAt: (0@0) heading: #West.
	expectedLog := ReadWriteStream with: '-1@0'.
	
	
	marsRover processCommands: 'f'.
	marsRoverLog := marsRover log.
	self assert: 	marsRoverLog equals: expectedLog.! !

!TestMarsRoverLog methodsFor: 'as yet unclassified' stamp: 'FV 7/18/2021 20:09:27'!
test05MarsRoverLogUpdatesWhenMovingRight
	
	| marsRover marsRoverLog expectedLog |
	
	marsRover := MarsRover startingAt: (0@0) heading: #West.
	expectedLog := ReadWriteStream with: '1@0'.
	
	
	marsRover processCommands: 'b'.
	marsRoverLog := marsRover log.
	self assert: 	marsRoverLog equals: expectedLog.! !

!TestMarsRoverLog methodsFor: 'as yet unclassified' stamp: 'FV 7/18/2021 20:09:57'!
test06MarsRoverLogUpdatesWhenHeadingWest

	
	| marsRover marsRoverLog expectedLog |
	
	marsRover := MarsRover startingAt: (0@0) heading: #North.
	expectedLog := ReadWriteStream with: 'West'.
	
	
	marsRover processCommands: 'l'.
	marsRoverLog := marsRover log.
	self assert: 	marsRoverLog equals: expectedLog.! !

!TestMarsRoverLog methodsFor: 'as yet unclassified' stamp: 'FV 7/18/2021 20:10:23'!
test07MarsRoverLogUpdatesWhenHeadingEast

	
	| marsRover marsRoverLog expectedLog |
	
	marsRover := MarsRover startingAt: (0@0) heading: #North.
	expectedLog := ReadWriteStream with: 'East'.
	
	
	marsRover processCommands: 'r'.
	marsRoverLog := marsRover log.
	self assert: 	marsRoverLog equals: expectedLog.! !

!TestMarsRoverLog methodsFor: 'as yet unclassified' stamp: 'FV 7/18/2021 20:10:47'!
test08MarsRoverLogUpdatesWhenHeadingNorth
	
	| marsRover marsRoverLog expectedLog |
	
	marsRover := MarsRover startingAt: (0@0) heading: #East.
	expectedLog := ReadWriteStream with: 'North'.
	
	
	marsRover processCommands: 'l'.
	marsRoverLog := marsRover log.
	self assert: 	marsRoverLog equals: expectedLog.! !

!TestMarsRoverLog methodsFor: 'as yet unclassified' stamp: 'FV 7/18/2021 20:11:07'!
test09MarsRoverLogUpdatesWhenHeadingSouth
	
	| marsRover marsRoverLog expectedLog |
	
	marsRover := MarsRover startingAt: (0@0) heading: #West.
	expectedLog := ReadWriteStream with: 'South'.
	
	
	marsRover processCommands: 'l'.
	marsRoverLog := marsRover log.
	self assert: 	marsRoverLog equals: expectedLog.! !

!TestMarsRoverLog methodsFor: 'as yet unclassified' stamp: 'FV 7/18/2021 20:12:00'!
test10MarsRoverLogKeepsUpWithMultipleCommands
	
	| marsRover marsRoverLog expectedLog |
	
	marsRover := MarsRover startingAt: (0@0) heading: #North.
	expectedLog := ReadWriteStream with: '0@1'.
	expectedLog newLine.
	expectedLog nextPutAll: 'East'. 
	
	marsRover processCommands: 'fr'.
	
	
	marsRoverLog := marsRover log.
	self assert: 	marsRoverLog equals: expectedLog.! !

!TestMarsRoverLog methodsFor: 'as yet unclassified' stamp: 'FV 7/18/2021 20:29:18'!
test11MarsRoverLogCanLogPositionUpdatesOnly
	
	| marsRover marsRoverLog expectedLog |
	
	marsRover := MarsRover startingAt: (0@0) heading: #North logging: #Position.
	expectedLog := ReadWriteStream with: '0@1'.
	
	marsRover processCommands: 'fr'.
	
	
	marsRoverLog := marsRover log.
	self assert: 	marsRoverLog equals: expectedLog.! !

!TestMarsRoverLog methodsFor: 'as yet unclassified' stamp: 'JP 7/19/2021 17:37:42'!
test12MarsRoverLogCanLogRotationUpdatesOnly
	
	| marsRover marsRoverLog expectedLog |
	
	marsRover := MarsRover startingAt: (0@0) heading: #North logging: #Rotation.
	expectedLog := ReadWriteStream with: 'East'.
	
	marsRover processCommands: 'fr'.
	
	
	marsRoverLog := marsRover log.
	self assert: 	marsRoverLog equals: expectedLog.! !


!classDefinition: #TestMarsRoverWindow category: 'MarsRover-Solucion'!
TestCase subclass: #TestMarsRoverWindow
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!TestMarsRoverWindow methodsFor: 'as yet unclassified' stamp: 'JP 7/19/2021 17:44:05'!
test01MarsRoverLogIsStartingStatusWhenNoCommandsWereGiven

	| marsRover marsRoverWindow|
	marsRover := MarsRover startingAt: (0@0) heading: #North. 
	marsRoverWindow := marsRover window.
	
	self assert: marsRoverWindow visualize equals: 'Actual position: 0@0. Actual orientation: North'.
	
	
! !

!TestMarsRoverWindow methodsFor: 'as yet unclassified' stamp: 'JP 7/19/2021 17:44:30'!
test02MarsRoverWindowUpdatesWhenMovingUp
	| marsRover |
	marsRover := MarsRover startingAt: (0@0) heading: #North. 
	
	marsRover processCommands: 'f'.
	
	self assert: marsRover visualizeWindow equals: 'Actual position: 0@1. Actual orientation: North'.! !

!TestMarsRoverWindow methodsFor: 'as yet unclassified' stamp: 'JP 7/19/2021 17:45:07'!
test03MarsRoverWindowUpdatesWhenMovingDown
	| marsRover |
	marsRover := MarsRover startingAt: (0@0) heading: #North. 
	
	marsRover processCommands: 'b'.
	
	self assert: marsRover visualizeWindow equals: 'Actual position: 0@-1. Actual orientation: North'.! !

!TestMarsRoverWindow methodsFor: 'as yet unclassified' stamp: 'JP 7/19/2021 17:45:31'!
test04MarsRoverWindowUpdatesWhenMovingLeft
	| marsRover |
	marsRover := MarsRover startingAt: (0@0) heading: #West. 
	
	marsRover processCommands: 'f'.
	
	self assert: marsRover visualizeWindow equals: 'Actual position: -1@0. Actual orientation: West'.! !

!TestMarsRoverWindow methodsFor: 'as yet unclassified' stamp: 'JP 7/19/2021 17:45:46'!
test05MarsRoverWindowUpdatesWhenMovingRight
	| marsRover |
	marsRover := MarsRover startingAt: (0@0) heading: #East. 
	
	marsRover processCommands: 'f'.
	
	self assert: marsRover visualizeWindow equals: 'Actual position: 1@0. Actual orientation: East'.! !

!TestMarsRoverWindow methodsFor: 'as yet unclassified' stamp: 'JP 7/19/2021 17:46:07'!
test06MarsRoverWindowUpdatesWhenHeadingWest
	| marsRover |
	marsRover := MarsRover startingAt: (0@0) heading: #North. 
	
	marsRover processCommands: 'l'.
	
	self assert: marsRover visualizeWindow equals: 'Actual position: 0@0. Actual orientation: West'.! !

!TestMarsRoverWindow methodsFor: 'as yet unclassified' stamp: 'JP 7/19/2021 17:46:24'!
test07MarsRoverWindowUpdatesWhenHeadingEast
	| marsRover |
	marsRover := MarsRover startingAt: (0@0) heading: #North. 
	
	marsRover processCommands: 'r'.
	
	self assert: marsRover visualizeWindow equals: 'Actual position: 0@0. Actual orientation: East'.! !

!TestMarsRoverWindow methodsFor: 'as yet unclassified' stamp: 'JP 7/19/2021 17:46:30'!
test08MarsRoverWindowUpdatesWhenHeadingNorth
	| marsRover |
	marsRover := MarsRover startingAt: (0@0) heading: #East. 
	
	marsRover processCommands: 'l'.
	
	self assert: marsRover visualizeWindow equals: 'Actual position: 0@0. Actual orientation: North'.! !

!TestMarsRoverWindow methodsFor: 'as yet unclassified' stamp: 'JP 7/19/2021 17:46:38'!
test09MarsRoverWindowUpdatesWhenHeadingSouth
	| marsRover |
	marsRover := MarsRover startingAt: (0@0) heading: #West. 
	
	marsRover processCommands: 'l'.
	
	self assert: marsRover visualizeWindow equals: 'Actual position: 0@0. Actual orientation: South'.! !

!TestMarsRoverWindow methodsFor: 'as yet unclassified' stamp: 'JP 7/19/2021 17:47:08'!
test10MarsRoverWindowCanShowPositionUpdatesOnly
	| marsRover |
	marsRover := MarsRover startingAt: (0@0) heading: #North visualizing: #Position. 
	
	marsRover processCommands: 'f'.
	
	self assert: marsRover visualizeWindow equals: 'Actual position: 0@1'.! !

!TestMarsRoverWindow methodsFor: 'as yet unclassified' stamp: 'JP 7/19/2021 17:47:28'!
test11MarsRoverWindowCanShowRotationUpdatesOnly
	| marsRover |
	marsRover := MarsRover startingAt: (0@0) heading: #North visualizing: #Rotation. 
	
	marsRover processCommands: 'f'.
	
	self assert: marsRover visualizeWindow equals: 'Actual orientation: North'.! !


!classDefinition: #MarsRover category: 'MarsRover-Solucion'!
Object subclass: #MarsRover
	instanceVariableNames: 'position head log logType window'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!MarsRover methodsFor: 'initialization' stamp: 'JP 7/19/2021 17:32:10'!
initializeStartingAt: aPosition heading: aCardinalPoint 
	
	position := aPosition.
	head := MarsRoverHead of: self facing: aCardinalPoint.
	log := ReadWriteStream with: ''.
	logType := #Both.
	window  := MarsRoverWindow startingAt: aPosition heading: aCardinalPoint visualizing: #Both.! !

!MarsRover methodsFor: 'initialization' stamp: 'JP 7/19/2021 17:32:20'!
initializeStartingAt: aPosition heading: aCardinalPoint logging: aLogType
	
	position := aPosition.
	head := MarsRoverHead of: self facing: aCardinalPoint.
	log := ReadWriteStream with: ''.
	logType := aLogType	.
	window  := MarsRoverWindow startingAt: aPosition heading: aCardinalPoint visualizing: #Both.! !

!MarsRover methodsFor: 'initialization' stamp: 'JP 7/19/2021 17:40:12'!
initializeStartingAt: aPosition heading: aCardinalPoint logging: aLogType visualizing: aWindowType
	
	position := aPosition.
	head := MarsRoverHead of: self facing: aCardinalPoint.
	log := ReadWriteStream with: ''.
	logType := aLogType.
	window  := MarsRoverWindow startingAt: aPosition heading: aCardinalPoint visualizing: aWindowType.! !

!MarsRover methodsFor: 'initialization' stamp: 'JP 7/19/2021 17:32:31'!
initializeStartingAt: aPosition heading: aCardinalPoint visualizing: aWindowType
	
	position := aPosition.
	head := MarsRoverHead of: self facing: aCardinalPoint.
	log := ReadWriteStream with: ''.
	logType := #Both.
	window  := MarsRoverWindow startingAt: aPosition heading: aCardinalPoint visualizing: aWindowType.! !


!MarsRover methodsFor: 'process commands' stamp: 'LL 6/30/2021 15:54:14'!
processCommands: aStringWithCommands

	aStringWithCommands do: [ :aCommand | 
		self assertCommandIsValid: aCommand.
		self processCommand: aCommand.
	].
	
! !


!MarsRover methodsFor: 'testing' stamp: 'LL 6/30/2021 19:47:14'!
isAt: aPosition heading: aCardinalPoint

	^ position = aPosition and: [ head isHeading: aCardinalPoint ]! !


!MarsRover methodsFor: 'private - process commands' stamp: 'LL 6/30/2021 15:54:11'!
assertCommandIsValid: aCommand

	^ (self isInvalidCommand: aCommand) ifTrue: [ self error: self invalidCommandErrorMessage ]! !

!MarsRover methodsFor: 'private - process commands' stamp: 'LL 6/30/2021 15:48:06'!
invalidCommandErrorMessage

	^'Invalid command'! !

!MarsRover methodsFor: 'private - process commands' stamp: 'LL 6/30/2021 19:48:47'!
processCommand: aCommand

	(self isForwardCommand: aCommand) ifTrue: [ ^ head movingForward ].
	(self isBackwardCommand: aCommand) ifTrue: [ ^ head movingBackwards ].
	(self isRotateRightCommand: aCommand) ifTrue: [ ^ head rotateRight ].
	(self isRotateLeftCommand: aCommand) ifTrue: [ ^ head rotateLeft ].
! !


!MarsRover methodsFor: 'private - commands' stamp: 'LL 6/30/2021 15:26:42'!
isBackwardCommand: command

	^ command = $b! !

!MarsRover methodsFor: 'private - commands' stamp: 'LL 6/30/2021 15:26:27'!
isForwardCommand: command

	^ command = $f! !

!MarsRover methodsFor: 'private - commands' stamp: 'LL 6/30/2021 15:51:21'!
isInvalidCommand: aCommand
	^(self isForwardCommand: aCommand) not and: 
		[ (self isBackwardCommand: aCommand) not and: 
			[ (self isRotateRightCommand: aCommand) not and: 
				[ (self isRotateLeftCommand: aCommand) not ] ] ]! !

!MarsRover methodsFor: 'private - commands' stamp: 'LL 6/30/2021 15:50:53'!
isRotateLeftCommand: command

	^ command = $l! !

!MarsRover methodsFor: 'private - commands' stamp: 'LL 6/30/2021 15:27:33'!
isRotateRightCommand: command

	^ command = $r! !


!MarsRover methodsFor: 'dd - moving' stamp: 'JP 7/19/2021 17:05:39'!
moveDown

	position := position + (0@-1).
	logType = #Rotation ifFalse: [self writeInLog: position asString.].
	window updatePosition: position.
! !

!MarsRover methodsFor: 'dd - moving' stamp: 'JP 7/19/2021 17:07:08'!
moveLeft

	position := position + (-1@0).
	logType = #Rotation ifFalse: [self writeInLog: position asString.].
	window updatePosition: position.! !

!MarsRover methodsFor: 'dd - moving' stamp: 'JP 7/19/2021 17:15:27'!
moveRight

	position := position + (1@0).
	logType = #Rotation ifFalse: [self writeInLog: position asString.].
	window updatePosition: position.! !

!MarsRover methodsFor: 'dd - moving' stamp: 'FV 7/18/2021 21:03:22'!
moveUp
	position := position + (0@1).
	logType = #Rotation ifFalse: [self writeInLog: position asString.].
	window updatePosition: position.! !


!MarsRover methodsFor: 'dd - heading' stamp: 'JP 7/19/2021 17:23:26'!
headEast

	head := MarsRoverHeadFacingEast of: self.
	logType = #Position ifFalse: [self writeInLog: 'East'.].
	window updateOrientation: 'East'.! !

!MarsRover methodsFor: 'dd - heading' stamp: 'JP 7/19/2021 17:24:23'!
headNorth

	head := MarsRoverHeadFacingNorth of: self.
	logType = #Position ifFalse: [self writeInLog: 'North'.].
	window updateOrientation: 'North'.! !

!MarsRover methodsFor: 'dd - heading' stamp: 'JP 7/19/2021 17:25:21'!
headSouth

	head := MarsRoverHeadFacingSouth of: self.
	logType = #Position ifFalse: [self writeInLog: 'South'.].
	window updateOrientation: 'South'.! !

!MarsRover methodsFor: 'dd - heading' stamp: 'JP 7/19/2021 17:21:45'!
headWest
	head := MarsRoverHeadFacingWest of: self.
	logType = #Position ifFalse: [self writeInLog: 'West'.].
	window updateOrientation: 'West'.
! !


!MarsRover methodsFor: 'as yet unclassified' stamp: 'FV 7/18/2021 17:50:30'!
log
	^log copy.! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'JP 7/19/2021 17:03:39'!
visualizeWindow
	^window visualize.! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'FV 7/18/2021 21:01:43'!
window
	^window copy.! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'FV 7/18/2021 20:00:46'!
writeInLog: aString
	log position = 0 ifFalse: [log newLine.].
	log nextPutAll: aString.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRover-Solucion'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'instance creation' stamp: 'LL 6/30/2021 13:30:13'!
startingAt: aPoint heading: aCardinalPoint 
	
	^self new initializeStartingAt: aPoint heading: aCardinalPoint ! !

!MarsRover class methodsFor: 'instance creation' stamp: 'FV 7/18/2021 20:15:23'!
startingAt: aPoint heading: aCardinalPoint logging: aLogType
	
	^self new initializeStartingAt: aPoint heading: aCardinalPoint logging: aLogType.! !

!MarsRover class methodsFor: 'instance creation' stamp: 'JP 7/19/2021 17:39:49'!
startingAt: aPoint heading: aCardinalPoint logging: aLogType visualizing: aWindowType
	
	^self new initializeStartingAt: aPoint heading: aCardinalPoint logging: aLogType visualizing: aWindowType! !

!MarsRover class methodsFor: 'instance creation' stamp: 'JP 7/19/2021 17:36:58'!
startingAt: aPoint heading: aCardinalPoint visualizing: aWindowType
	
	^self new initializeStartingAt: aPoint heading: aCardinalPoint visualizing: aWindowType! !


!classDefinition: #MarsRoverHead category: 'MarsRover-Solucion'!
Object subclass: #MarsRoverHead
	instanceVariableNames: 'marsRover'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!MarsRoverHead methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 16:17:57'!
initializeOf: aMarsRover

	marsRover := aMarsRover! !

!MarsRoverHead methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:46:16'!
isHeading: aCardinalPoint

	^self class whenFacing: aCardinalPoint

	! !

!MarsRoverHead methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:36'!
movingBackwards

	self subclassResponsibility! !

!MarsRoverHead methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:47'!
movingForward

	self subclassResponsibility! !

!MarsRoverHead methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 16:36:46'!
rotateLeft

	self subclassResponsibility! !

!MarsRoverHead methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 16:36:43'!
rotateRight

	self subclassResponsibility! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHead class' category: 'MarsRover-Solucion'!
MarsRoverHead class
	instanceVariableNames: ''!

!MarsRoverHead class methodsFor: 'testing' stamp: 'LL 6/30/2021 19:46:16'!
whenFacing: aCardinalPoint

	self subclassResponsibility.! !


!MarsRoverHead class methodsFor: 'instance creation' stamp: 'LL 6/30/2021 16:16:27'!
of: aMarsRover

	^self new initializeOf: aMarsRover! !

!MarsRoverHead class methodsFor: 'instance creation' stamp: 'LL 6/30/2021 19:46:37'!
of: aMarsRover facing: aCardinalPoint
	
	| headingSubclass |
	headingSubclass := self subclasses detect: [ :aHeadingSubclass | aHeadingSubclass whenFacing: aCardinalPoint ].
	
	^headingSubclass of: aMarsRover.! !


!classDefinition: #MarsRoverHeadFacingEast category: 'MarsRover-Solucion'!
MarsRoverHead subclass: #MarsRoverHeadFacingEast
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!MarsRoverHeadFacingEast methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:36'!
movingBackwards

	^marsRover moveLeft.

	! !

!MarsRoverHeadFacingEast methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:47'!
movingForward

	^marsRover moveRight.

	! !

!MarsRoverHeadFacingEast methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 17:06:22'!
rotateLeft

	^marsRover headNorth.

	! !

!MarsRoverHeadFacingEast methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 17:10:14'!
rotateRight

	^marsRover headSouth.

	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHeadFacingEast class' category: 'MarsRover-Solucion'!
MarsRoverHeadFacingEast class
	instanceVariableNames: ''!

!MarsRoverHeadFacingEast class methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:46:16'!
whenFacing: aCardinalPoint

	^aCardinalPoint = #East! !


!classDefinition: #MarsRoverHeadFacingNorth category: 'MarsRover-Solucion'!
MarsRoverHead subclass: #MarsRoverHeadFacingNorth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!MarsRoverHeadFacingNorth methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:36'!
movingBackwards

	^marsRover moveDown.! !

!MarsRoverHeadFacingNorth methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:47'!
movingForward

	^marsRover moveUp.! !

!MarsRoverHeadFacingNorth methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 17:06:33'!
rotateLeft

	^marsRover headWest.! !

!MarsRoverHeadFacingNorth methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 17:10:58'!
rotateRight

	^marsRover headEast.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHeadFacingNorth class' category: 'MarsRover-Solucion'!
MarsRoverHeadFacingNorth class
	instanceVariableNames: ''!

!MarsRoverHeadFacingNorth class methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:46:16'!
whenFacing: aCardinalPoint

	^aCardinalPoint = #North! !


!classDefinition: #MarsRoverHeadFacingSouth category: 'MarsRover-Solucion'!
MarsRoverHead subclass: #MarsRoverHeadFacingSouth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!MarsRoverHeadFacingSouth methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:36'!
movingBackwards

	^marsRover moveUp.! !

!MarsRoverHeadFacingSouth methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:47'!
movingForward

	^marsRover moveDown! !

!MarsRoverHeadFacingSouth methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 17:06:43'!
rotateLeft

	^marsRover headEast.! !

!MarsRoverHeadFacingSouth methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 17:12:30'!
rotateRight

	^marsRover headWest.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHeadFacingSouth class' category: 'MarsRover-Solucion'!
MarsRoverHeadFacingSouth class
	instanceVariableNames: ''!

!MarsRoverHeadFacingSouth class methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:46:16'!
whenFacing: aCardinalPoint

	^aCardinalPoint = #South! !


!classDefinition: #MarsRoverHeadFacingWest category: 'MarsRover-Solucion'!
MarsRoverHead subclass: #MarsRoverHeadFacingWest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!MarsRoverHeadFacingWest methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:36'!
movingBackwards

	^marsRover moveRight.! !

!MarsRoverHeadFacingWest methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:47'!
movingForward

	^marsRover moveLeft.! !

!MarsRoverHeadFacingWest methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 17:06:52'!
rotateLeft

	^marsRover headSouth.! !

!MarsRoverHeadFacingWest methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 17:12:44'!
rotateRight

	^marsRover headNorth.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHeadFacingWest class' category: 'MarsRover-Solucion'!
MarsRoverHeadFacingWest class
	instanceVariableNames: ''!

!MarsRoverHeadFacingWest class methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:46:16'!
whenFacing: aCardinalPoint

	^aCardinalPoint = #West! !


!classDefinition: #MarsRoverWindow category: 'MarsRover-Solucion'!
Object subclass: #MarsRoverWindow
	instanceVariableNames: 'actualPosition actualOrientation windowType'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!MarsRoverWindow methodsFor: 'as yet unclassified' stamp: 'JP 7/19/2021 17:33:39'!
initializeStartingAt: aStartingPosition heading: aCardinalPoint visualizing: aWindowType

	actualPosition := aStartingPosition.
	actualOrientation := aCardinalPoint.
	windowType := aWindowType.! !

!MarsRoverWindow methodsFor: 'as yet unclassified' stamp: 'JP 7/19/2021 17:22:24'!
updateOrientation: aNewOrientation

	actualOrientation := aNewOrientation.! !

!MarsRoverWindow methodsFor: 'as yet unclassified' stamp: 'FV 7/18/2021 21:03:52'!
updatePosition: aNewPosition
	actualPosition := aNewPosition.! !

!MarsRoverWindow methodsFor: 'as yet unclassified' stamp: 'JP 7/19/2021 17:38:27'!
visualize

	windowType = #Rotation ifTrue: [^'Actual orientation: ', actualOrientation asString.].
	windowType = #Position ifTrue: [^ 'Actual position: ', actualPosition asString].
	
	^ 'Actual position: ', actualPosition asString , '. Actual orientation: ', actualOrientation asString.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverWindow class' category: 'MarsRover-Solucion'!
MarsRoverWindow class
	instanceVariableNames: ''!

!MarsRoverWindow class methodsFor: 'as yet unclassified' stamp: 'JP 7/19/2021 17:32:51'!
startingAt: aStartingPosition heading: aCardinalPoint visualizing: aWindowType

	^self new initializeStartingAt: aStartingPosition heading: aCardinalPoint visualizing: aWindowType.! !
