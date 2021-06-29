!classDefinition: #MarsRoverTests category: 'Mars-Rover'!
TestCase subclass: #MarsRoverTests
	instanceVariableNames: 'north south east west forward backwards'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-Rover'!

!MarsRoverTests methodsFor: 'DiscardedTests' stamp: 'JP 6/29/2021 17:34:23'!
discardedTest03RoverCanStartAtDesigantedOrientation

	| marsRoverController |
	marsRoverController := MarsRoverController newWithRoverPosition: (1@1) andFacing: south.
	
	self assert: (marsRoverController roverOrientation = south)! !

!MarsRoverTests methodsFor: 'DiscardedTests' stamp: 'JP 6/29/2021 17:00:42'!
discardedTest03RoverCanStartAtDesignatedPosition

	| marsRoverController |
	marsRoverController := MarsRoverController newWithRoverPosition: (1@1) andFacing: north.
	
	self assert: (marsRoverController roverPosition = (1@1))! !

!MarsRoverTests methodsFor: 'DiscardedTests' stamp: 'JP 6/29/2021 17:00:34'!
discardedTest05RoverCanStartFacingNorth

	"Este test fue descartado ya que el test04 testeaba lo mismo"

	| marsRoverController |
	marsRoverController := MarsRoverController newWithRoverPosition: (0@0) andFacing: north.
	
	self assert: (marsRoverController roverOrientation = north)! !

!MarsRoverTests methodsFor: 'DiscardedTests' stamp: 'JP 6/29/2021 17:41:07'!
discardedTest06MarsRoverCanExecuteForwardInstruccionMultipleTimes

	| marsRoverController |
	marsRoverController := MarsRoverController newWithRoverPosition: (0@0) andFacing: north .
	
	marsRoverController receiveInstructionSet: 'ff'.
	
	self assert: (marsRoverController roverPosition = (0@2))! !

!MarsRoverTests methodsFor: 'DiscardedTests' stamp: 'JP 6/29/2021 17:35:28'!
discardedTest06RoverExecutesCorrectlyRightInstructionFromEast

	| marsRoverController |
	marsRoverController := MarsRoverController newWithRoverPosition: (0@0) andFacing: east.
	
	marsRoverController receiveInstructionSet: 'r'.
	
	self assert: (marsRoverController roverOrientation = south)! !

!MarsRoverTests methodsFor: 'DiscardedTests' stamp: 'JP 6/29/2021 17:35:49'!
discardedTest07RoverExecutesCorrectlyLeftInstructionFromEast

	| marsRoverController |
	marsRoverController := MarsRoverController newWithRoverPosition: (0@0) andFacing: east.
	
	marsRoverController receiveInstructionSet: 'l'.
	
	self assert: (marsRoverController roverOrientation = north)! !

!MarsRoverTests methodsFor: 'DiscardedTests' stamp: 'JP 6/29/2021 17:44:46'!
discardedTest10MarsRoverCanGoRightAndBackwardsInTheSameInstruccion

	| marsRoverController |
	marsRoverController := MarsRoverController newWithRoverPosition: (0@0) andFacing: north .
	
	marsRoverController receiveInstructionSet: 'rb'.
	
	self assert: (marsRoverController roverPosition = (-1@0))! !


!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'JP 6/29/2021 16:58:49'!
setUp

	north := 'N'.
	south := 'S'.
	east := 'E'.
	west := 'W'.
	
	forward := 'f'.
	backwards := 'b'.! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'JP 6/29/2021 17:13:25'!
test00RoverDoesNothingOnEmptyInstruction
	
	"Este test fue añadido luego al darnos cuenta que era lo mas sencillo a probar para el primer test. No tuvimos tiempo de descartar los test ya hechos, 
	pero somos concientes que eso era lo indicado."
	
	| marsRoverController |
	marsRoverController := MarsRoverController newWithRoverPosition: (0@0) andFacing: north.
	
	marsRoverController receiveInstructionSet: ''.
	
	self assert: (marsRoverController roverPosition = (0@0))! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'JP 6/29/2021 16:58:32'!
test01RoverExecutesCorrectlyForwardInstruction

	| marsRoverController |
	marsRoverController := MarsRoverController newWithRoverPosition: (0@0) andFacing: north.
	
	marsRoverController receiveInstructionSet: forward.
	
	self assert: (marsRoverController roverPosition = (0@1))! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'JP 6/29/2021 16:58:29'!
test02RoverExecutesCorrectlyBackwardsInstruction

	| marsRoverController |
	marsRoverController := MarsRoverController newWithRoverPosition: (0@0) andFacing: north.
	
	marsRoverController receiveInstructionSet: backwards.
	
	self assert: (marsRoverController roverPosition = (0@-1))! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'JP 6/29/2021 16:59:05'!
test04RoverExecutesCorrectlyLeftInstruction

	| marsRoverController |
	marsRoverController := MarsRoverController newWithRoverPosition: (0@0) andFacing: north.

	marsRoverController receiveInstructionSet: 'l'.
	
	self assert: (marsRoverController roverOrientation = west)! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'JP 6/29/2021 16:59:11'!
test05RoverExecutesCorrectlyRightInstruction

	| marsRoverController |
	marsRoverController := MarsRoverController newWithRoverPosition: (0@0) andFacing: north.
	
	marsRoverController receiveInstructionSet: 'r'.
	
	self assert: (marsRoverController roverOrientation = east)! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'JP 6/29/2021 17:43:09'!
test06MarsRoverCanReceiveAndExecuteMultipleInstructions

	| marsRoverController |
	marsRoverController := MarsRoverController newWithRoverPosition: (0@0) andFacing: north .
	
	marsRoverController receiveInstructionSet: 'rf'.
	
	self assert: (marsRoverController roverPosition = (1@0))! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'JP 6/29/2021 17:49:54'!
test07AnInvalidInstructionShouldRaiseAnExepcion

	| marsRoverController |
	marsRoverController := MarsRoverController newWithRoverPosition: (0@0) andFacing: north.
	
	self should: [marsRoverController receiveInstructionSet: '%'.]
	raise: Error - MessageNotUnderstood 
	withExceptionDo: [:anError | self assert: (anError messageText = MarsRoverController instruccionNotUnderstoodError)]! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'JP 6/29/2021 17:51:56'!
test08InCaseOfInvalidInstructionNextInstruccionsShouldNotBeExecuted

	| marsRoverController |
	marsRoverController := MarsRoverController newWithRoverPosition: (0@0) andFacing: north.
	
	self should: [marsRoverController receiveInstructionSet: 'ff%ff'.] 
	raise: Error - MessageNotUnderstood 
	withExceptionDo: [:anError | self assert: (marsRoverController roverPosition = (0@2))]! !


!classDefinition: #MarsRoverController category: 'Mars-Rover'!
Object subclass: #MarsRoverController
	instanceVariableNames: 'roverPosition roverOrientation'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-Rover'!

!MarsRoverController methodsFor: 'initialization' stamp: 'JP 6/27/2021 19:15:15'!
initializeWithPosition: aRoverStartingPosition andOrientation: aRoverStartingOrientation

	roverPosition := aRoverStartingPosition.
	roverOrientation := aRoverStartingOrientation ! !


!MarsRoverController methodsFor: 'private' stamp: 'JP 6/29/2021 17:24:55'!
executeInstruction: anInstruction
	
	(anInstruction = $f) ifTrue: [^self moveRoverForward].
	(anInstruction = $b) ifTrue: [^self moveRoverBackwards].
	(anInstruction = $l) ifTrue: [^self rotateRoverLeft].
	(anInstruction = $r) ifTrue: [^self rotateRoverRight].
	self error: self class instruccionNotUnderstoodError
	! !


!MarsRoverController methodsFor: 'privateRoverMovement' stamp: 'JP 6/29/2021 17:07:19'!
moveRoverBackwards
	
	(roverOrientation = 'N') ifTrue: [^roverPosition := roverPosition + (0@-1)].
	(roverOrientation = 'E') ifTrue: [^roverPosition := roverPosition + (-1@0)].
	(roverOrientation = 'S') ifTrue: [^roverPosition := roverPosition + (0@1)].
	(roverOrientation = 'W') ifTrue: [^roverPosition := roverPosition + (1@0)].! !

!MarsRoverController methodsFor: 'privateRoverMovement' stamp: 'JP 6/29/2021 17:05:58'!
moveRoverForward

	(roverOrientation = 'N') ifTrue: [^roverPosition := roverPosition + (0@1)].
	(roverOrientation = 'E') ifTrue: [^roverPosition := roverPosition + (1@0)].
	(roverOrientation = 'S') ifTrue: [^roverPosition := roverPosition + (0@-1)].
	(roverOrientation = 'W') ifTrue: [^roverPosition := roverPosition + (-1@0)].! !

!MarsRoverController methodsFor: 'privateRoverMovement' stamp: 'JP 6/29/2021 16:45:02'!
rotateRoverLeft
	
	(roverOrientation = 'N') ifTrue: [^roverOrientation := 'W'].
	(roverOrientation = 'E') ifTrue: [^roverOrientation := 'N'].
	(roverOrientation = 'S') ifTrue: [^roverOrientation := 'E'].
	(roverOrientation = 'W') ifTrue: [^roverOrientation := 'S'].! !

!MarsRoverController methodsFor: 'privateRoverMovement' stamp: 'JP 6/29/2021 16:44:04'!
rotateRoverRight
	
	(roverOrientation = 'N') ifTrue: [^roverOrientation := 'E'].
	(roverOrientation = 'E') ifTrue: [^roverOrientation := 'S'].
	(roverOrientation = 'S') ifTrue: [^roverOrientation := 'W'].
	(roverOrientation = 'W') ifTrue: [^roverOrientation := 'N'].! !

!MarsRoverController methodsFor: 'privateRoverMovement' stamp: 'JP 6/27/2021 19:15:29'!
roverOrientation

	^roverOrientation! !

!MarsRoverController methodsFor: 'privateRoverMovement' stamp: 'JP 6/27/2021 18:43:01'!
roverPosition

	^roverPosition! !


!MarsRoverController methodsFor: 'as yet unclassified' stamp: 'JP 6/29/2021 17:01:41'!
receiveInstructionSet: anInstruccionSet

	anInstruccionSet do: [:anInstruccion | self executeInstruction: anInstruccion ].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverController class' category: 'Mars-Rover'!
MarsRoverController class
	instanceVariableNames: ''!

!MarsRoverController class methodsFor: 'as yet unclassified' stamp: 'JP 6/29/2021 17:23:48'!
instruccionNotUnderstoodError

	^'InstruccionNotUnderstood'! !

!MarsRoverController class methodsFor: 'as yet unclassified' stamp: 'JP 6/27/2021 19:03:00'!
newWithRoverPosition: aRoverStartingPosition andFacing: aRoverStartingOrientation

	^self new initializeWithPosition: aRoverStartingPosition andOrientation: aRoverStartingOrientation! !
