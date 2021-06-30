!classDefinition: #MarsRoverTests category: 'Mars-Rover'!
TestCase subclass: #MarsRoverTests
	instanceVariableNames: 'north south east west forward backwards'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-Rover'!

!MarsRoverTests methodsFor: 'DiscardedTests' stamp: 'JP 6/30/2021 16:05:39'!
discardedTest03RoverCanStartAtDesigantedOrientation

	| marsRoverController |
	marsRoverController := MarsRover newWithRoverPosition: (1@1) andFacing: south.
	
	self assert: (marsRoverController roverOrientation = south)! !

!MarsRoverTests methodsFor: 'DiscardedTests' stamp: 'JP 6/30/2021 16:05:39'!
discardedTest03RoverCanStartAtDesignatedPosition

	| marsRoverController |
	marsRoverController := MarsRover newWithRoverPosition: (1@1) andFacing: north.
	
	self assert: (marsRoverController roverPosition = (1@1))! !

!MarsRoverTests methodsFor: 'DiscardedTests' stamp: 'JP 6/30/2021 16:05:39'!
discardedTest05RoverCanStartFacingNorth

	"Este test fue descartado ya que el test04 testeaba lo mismo"

	| marsRoverController |
	marsRoverController := MarsRover newWithRoverPosition: (0@0) andFacing: north.
	
	self assert: (marsRoverController roverOrientation = north)! !

!MarsRoverTests methodsFor: 'DiscardedTests' stamp: 'JP 6/30/2021 16:05:39'!
discardedTest06MarsRoverCanExecuteForwardInstruccionMultipleTimes

	| marsRoverController |
	marsRoverController := MarsRover newWithRoverPosition: (0@0) andFacing: north .
	
	marsRoverController receiveInstructionSet: 'ff'.
	
	self assert: (marsRoverController roverPosition = (0@2))! !

!MarsRoverTests methodsFor: 'DiscardedTests' stamp: 'JP 6/30/2021 16:05:39'!
discardedTest06RoverExecutesCorrectlyRightInstructionFromEast

	| marsRoverController |
	marsRoverController := MarsRover newWithRoverPosition: (0@0) andFacing: east.
	
	marsRoverController receiveInstructionSet: 'r'.
	
	self assert: (marsRoverController roverOrientation = south)! !

!MarsRoverTests methodsFor: 'DiscardedTests' stamp: 'JP 6/30/2021 16:05:39'!
discardedTest07RoverExecutesCorrectlyLeftInstructionFromEast

	| marsRoverController |
	marsRoverController := MarsRover newWithRoverPosition: (0@0) andFacing: east.
	
	marsRoverController receiveInstructionSet: 'l'.
	
	self assert: (marsRoverController roverOrientation = north)! !

!MarsRoverTests methodsFor: 'DiscardedTests' stamp: 'JP 6/30/2021 16:05:39'!
discardedTest10MarsRoverCanGoRightAndBackwardsInTheSameInstruccion

	| marsRoverController |
	marsRoverController := MarsRover newWithRoverPosition: (0@0) andFacing: north .
	
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

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'JP 6/30/2021 17:46:57'!
test01RoverDoesNothingOnEmptyInstruction
	
	"Este test fue añadido luego al darnos cuenta que era lo mas sencillo a probar para el primer test. No tuvimos tiempo de descartar los test ya hechos, 
	pero somos concientes que eso era lo indicado."
	
	| marsRoverController |
	marsRoverController := MarsRover newWithRoverPosition: (0@0) andFacing: north.
	
	marsRoverController receiveInstructionSet: ''.
	
	self assert: (marsRoverController roverPosition = (0@0))! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'JP 6/30/2021 16:05:39'!
test02RoverExecutesCorrectlyBackwardsInstruction

	| marsRoverController |
	marsRoverController := MarsRover newWithRoverPosition: (0@0) andFacing: north.
	
	marsRoverController receiveInstructionSet: backwards.
	
	self assert: (marsRoverController roverPosition = (0@-1))! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'JP 6/30/2021 17:47:06'!
test03RoverExecutesCorrectlyForwardInstruction

	| marsRoverController |
	marsRoverController := MarsRover newWithRoverPosition: (0@0) andFacing: north.
	
	marsRoverController receiveInstructionSet: forward.
	
	self assert: (marsRoverController roverPosition = (0@1))! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'JP 6/30/2021 16:05:40'!
test04RoverExecutesCorrectlyLeftInstruction

	| marsRoverController |
	marsRoverController := MarsRover newWithRoverPosition: (0@0) andFacing: north.

	marsRoverController receiveInstructionSet: 'l'.
	
	self assert: (marsRoverController roverOrientation = west)! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'JP 6/30/2021 16:05:39'!
test05RoverExecutesCorrectlyRightInstruction

	| marsRoverController |
	marsRoverController := MarsRover newWithRoverPosition: (0@0) andFacing: north.
	
	marsRoverController receiveInstructionSet: 'r'.
	
	self assert: (marsRoverController roverOrientation = east)! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'JP 6/30/2021 17:18:22'!
test06MarsRoverCanReceiveAndExecuteMultipleInstructions

	| marsRoverController |
	marsRoverController := MarsRover newWithRoverPosition: (0@0) andFacing: north.
	
	marsRoverController receiveInstructionSet: 'rf'.
	
	self assert: (marsRoverController roverPosition = (1@0))! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'JP 6/30/2021 17:32:33'!
test07AnInvalidInstructionShouldRaiseAnException

	| marsRoverController |
	marsRoverController := MarsRover newWithRoverPosition: (0@0) andFacing: north.
	
	self should: [marsRoverController receiveInstructionSet: '%'.]
	raise: Error - MessageNotUnderstood 
	withExceptionDo: [:anError | self assert: (anError messageText = MarsRover instruccionNotUnderstoodError)]! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'JP 6/30/2021 16:05:39'!
test08InCaseOfInvalidInstructionNextInstruccionsShouldNotBeExecuted

	| marsRoverController |
	marsRoverController := MarsRover newWithRoverPosition: (0@0) andFacing: north.
	
	self should: [marsRoverController receiveInstructionSet: 'ff%ff'.] 
	raise: Error - MessageNotUnderstood 
	withExceptionDo: [:anError | self assert: (marsRoverController roverPosition = (0@2))]! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'JP 6/30/2021 17:31:43'!
test09AnInvalidStartingOrientationShouldRaiseAnException
	
	self should: [MarsRover newWithRoverPosition: (0@0) andFacing: 'gualeguaychú'.] 
	raise: Error - MessageNotUnderstood 
	withExceptionDo: [:anError | self assert: anError messageText = MarsRover invalidOrientationError]! !


!classDefinition: #MarsRover category: 'Mars-Rover'!
Object subclass: #MarsRover
	instanceVariableNames: 'roverPosition roverOrientationStatus'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-Rover'!

!MarsRover methodsFor: 'initialization' stamp: 'JP 6/30/2021 16:47:02'!
initializeWithPosition: aRoverStartingPosition andOrientation: aRoverStartingOrientation

	roverPosition := aRoverStartingPosition.
	roverOrientationStatus := self detectValidStatusFor: aRoverStartingOrientation.! !


!MarsRover methodsFor: 'private' stamp: 'JP 6/30/2021 17:30:45'!
detectValidStatusFor: aRoverStartingOrientation
	
	| validMarsRoverStatus |
	
	validMarsRoverStatus := MarsRoverOrientationStatus allSubclasses detect: [:aClass | aClass itsValidOrientation: aRoverStartingOrientation] 
	ifNone: [^self error: self class invalidOrientationError]. 	
	^validMarsRoverStatus newOrientationStatusFor: self! !


!MarsRover methodsFor: 'privateRoverInstruccions' stamp: 'JP 6/30/2021 17:44:41'!
executeInstruction: anInstruction
	
	| aValidInstructionClass |
	aValidInstructionClass := MarsRoverInstructions allSubclasses detect: [:aClass | aClass isAValidInstruction: anInstruction] 
	ifNone: [^self error: self class instruccionNotUnderstoodError].
	
	(aValidInstructionClass new) executeInstructionFor: self.
	! !

!MarsRover methodsFor: 'privateRoverInstruccions' stamp: 'JP 6/30/2021 17:03:45'!
moveRoverBackwards
	
	roverOrientationStatus moveBackwards.! !

!MarsRover methodsFor: 'privateRoverInstruccions' stamp: 'JP 6/30/2021 17:03:57'!
moveRoverForward

	roverOrientationStatus moveForward.! !

!MarsRover methodsFor: 'privateRoverInstruccions' stamp: 'JP 6/30/2021 17:04:12'!
rotateRoverLeft
	
	roverOrientationStatus rotateLeft! !

!MarsRover methodsFor: 'privateRoverInstruccions' stamp: 'JP 6/30/2021 17:04:20'!
rotateRoverRight
	
	roverOrientationStatus rotateRight! !


!MarsRover methodsFor: 'privateRoverMovement' stamp: 'JP 6/30/2021 16:19:18'!
moveRoverTowardsEast
	
	roverPosition := roverPosition + (1@0)! !

!MarsRover methodsFor: 'privateRoverMovement' stamp: 'JP 6/30/2021 16:18:45'!
moveRoverTowardsNorth
	
	roverPosition := roverPosition + (0@1)! !

!MarsRover methodsFor: 'privateRoverMovement' stamp: 'JP 6/30/2021 16:18:59'!
moveRoverTowardsSouth
	
	roverPosition := roverPosition + (0@-1)! !

!MarsRover methodsFor: 'privateRoverMovement' stamp: 'JP 6/30/2021 16:19:12'!
moveRoverTowardsWest
	
	roverPosition := roverPosition + (-1@0)! !

!MarsRover methodsFor: 'privateRoverMovement' stamp: 'JP 6/30/2021 17:02:03'!
rotateRoverTowardsEast
	
	roverOrientationStatus := MarsRoverFacingEast newOrientationStatusFor: self! !

!MarsRover methodsFor: 'privateRoverMovement' stamp: 'JP 6/30/2021 17:02:12'!
rotateRoverTowardsNorth
	
	roverOrientationStatus := MarsRoverFacingNorth newOrientationStatusFor: self! !

!MarsRover methodsFor: 'privateRoverMovement' stamp: 'JP 6/30/2021 17:02:19'!
rotateRoverTowardsSouth
	
	roverOrientationStatus := MarsRoverFacingSouth newOrientationStatusFor: self! !

!MarsRover methodsFor: 'privateRoverMovement' stamp: 'JP 6/30/2021 17:02:25'!
rotateRoverTowardsWest
	
	roverOrientationStatus := MarsRoverFacingWest newOrientationStatusFor: self! !


!MarsRover methodsFor: 'getters' stamp: 'JP 6/30/2021 16:58:29'!
roverOrientation

	^roverOrientationStatus orientation! !

!MarsRover methodsFor: 'getters' stamp: 'JP 6/27/2021 18:43:01'!
roverPosition

	^roverPosition! !


!MarsRover methodsFor: 'public' stamp: 'JP 6/29/2021 17:01:41'!
receiveInstructionSet: anInstruccionSet

	anInstruccionSet do: [:anInstruccion | self executeInstruction: anInstruccion ].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'Mars-Rover'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'Errors' stamp: 'JP 6/29/2021 17:23:48'!
instruccionNotUnderstoodError

	^'InstruccionNotUnderstood'! !

!MarsRover class methodsFor: 'Errors' stamp: 'JP 6/30/2021 17:27:49'!
invalidOrientationError

	^'Invalid orientation'! !


!MarsRover class methodsFor: 'creation' stamp: 'JP 6/27/2021 19:03:00'!
newWithRoverPosition: aRoverStartingPosition andFacing: aRoverStartingOrientation

	^self new initializeWithPosition: aRoverStartingPosition andOrientation: aRoverStartingOrientation! !


!classDefinition: #MarsRoverInstructions category: 'Mars-Rover'!
Object subclass: #MarsRoverInstructions
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-Rover'!

!MarsRoverInstructions methodsFor: 'Execution' stamp: 'JP 6/30/2021 17:42:14'!
executeInstructionFor: aMarsRover

	self subclassResponsibility 

	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverInstructions class' category: 'Mars-Rover'!
MarsRoverInstructions class
	instanceVariableNames: ''!

!MarsRoverInstructions class methodsFor: 'as yet unclassified' stamp: 'JP 6/30/2021 17:40:34'!
isAValidInstruction: anInstruction

	self subclassResponsibility! !


!classDefinition: #BackwardsInstruction category: 'Mars-Rover'!
MarsRoverInstructions subclass: #BackwardsInstruction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-Rover'!

!BackwardsInstruction methodsFor: 'Execution' stamp: 'JP 6/30/2021 17:45:54'!
executeInstructionFor: aMarsRover

	aMarsRover moveRoverBackwards 
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'BackwardsInstruction class' category: 'Mars-Rover'!
BackwardsInstruction class
	instanceVariableNames: ''!

!BackwardsInstruction class methodsFor: 'as yet unclassified' stamp: 'JP 6/30/2021 17:40:59'!
isAValidInstruction: anInstruction

	^anInstruction = $b! !


!classDefinition: #ForwardInstruction category: 'Mars-Rover'!
MarsRoverInstructions subclass: #ForwardInstruction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-Rover'!

!ForwardInstruction methodsFor: 'Execution' stamp: 'JP 6/30/2021 17:45:57'!
executeInstructionFor: aMarsRover

	aMarsRover moveRoverForward! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ForwardInstruction class' category: 'Mars-Rover'!
ForwardInstruction class
	instanceVariableNames: ''!

!ForwardInstruction class methodsFor: 'as yet unclassified' stamp: 'JP 6/30/2021 17:41:19'!
isAValidInstruction: anInstruction

	^anInstruction = $f! !


!classDefinition: #LeftRotationInstruction category: 'Mars-Rover'!
MarsRoverInstructions subclass: #LeftRotationInstruction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-Rover'!

!LeftRotationInstruction methodsFor: 'Execution' stamp: 'JP 6/30/2021 17:46:01'!
executeInstructionFor: aMarsRover

	aMarsRover rotateRoverLeft ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LeftRotationInstruction class' category: 'Mars-Rover'!
LeftRotationInstruction class
	instanceVariableNames: ''!

!LeftRotationInstruction class methodsFor: 'as yet unclassified' stamp: 'JP 6/30/2021 17:41:26'!
isAValidInstruction: anInstruction

	^anInstruction = $l! !


!classDefinition: #RightRotationInstruction category: 'Mars-Rover'!
MarsRoverInstructions subclass: #RightRotationInstruction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-Rover'!

!RightRotationInstruction methodsFor: 'Execution' stamp: 'JP 6/30/2021 17:46:05'!
executeInstructionFor: aMarsRover

	aMarsRover rotateRoverRight! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'RightRotationInstruction class' category: 'Mars-Rover'!
RightRotationInstruction class
	instanceVariableNames: ''!

!RightRotationInstruction class methodsFor: 'as yet unclassified' stamp: 'JP 6/30/2021 17:41:31'!
isAValidInstruction: anInstruction

	^anInstruction = $r! !


!classDefinition: #MarsRoverOrientationStatus category: 'Mars-Rover'!
Object subclass: #MarsRoverOrientationStatus
	instanceVariableNames: 'marsRover'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-Rover'!

!MarsRoverOrientationStatus methodsFor: 'initialization' stamp: 'JP 6/30/2021 16:43:02'!
initializeWith: aMarsRover

	marsRover := aMarsRover! !


!MarsRoverOrientationStatus methodsFor: 'mars rover actions' stamp: 'JP 6/30/2021 17:03:45'!
moveBackwards

	self subclassResponsibility ! !

!MarsRoverOrientationStatus methodsFor: 'mars rover actions' stamp: 'JP 6/30/2021 17:03:57'!
moveForward

	self subclassResponsibility ! !

!MarsRoverOrientationStatus methodsFor: 'mars rover actions' stamp: 'JP 6/30/2021 17:04:11'!
rotateLeft

	self subclassResponsibility ! !

!MarsRoverOrientationStatus methodsFor: 'mars rover actions' stamp: 'JP 6/30/2021 17:04:19'!
rotateRight

	self subclassResponsibility ! !


!MarsRoverOrientationStatus methodsFor: 'getters' stamp: 'JP 6/30/2021 17:04:33'!
orientation

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverOrientationStatus class' category: 'Mars-Rover'!
MarsRoverOrientationStatus class
	instanceVariableNames: ''!

!MarsRoverOrientationStatus class methodsFor: 'creation' stamp: 'JP 6/30/2021 16:32:59'!
itsValidOrientation: aStringOrientation

	self subclassResponsibility ! !

!MarsRoverOrientationStatus class methodsFor: 'creation' stamp: 'JP 6/30/2021 16:42:39'!
newOrientationStatusFor: aMarsRover

	^self new initializeWith: aMarsRover.! !


!classDefinition: #MarsRoverFacingEast category: 'Mars-Rover'!
MarsRoverOrientationStatus subclass: #MarsRoverFacingEast
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-Rover'!

!MarsRoverFacingEast methodsFor: 'mars rover actions' stamp: 'JP 6/30/2021 17:03:45'!
moveBackwards

	marsRover moveRoverTowardsWest

! !

!MarsRoverFacingEast methodsFor: 'mars rover actions' stamp: 'JP 6/30/2021 17:03:57'!
moveForward

	marsRover moveRoverTowardsEast
! !

!MarsRoverFacingEast methodsFor: 'mars rover actions' stamp: 'JP 6/30/2021 17:04:11'!
rotateLeft

	marsRover rotateRoverTowardsNorth 

! !

!MarsRoverFacingEast methodsFor: 'mars rover actions' stamp: 'JP 6/30/2021 17:04:19'!
rotateRight

	marsRover rotateRoverTowardsSouth ! !


!MarsRoverFacingEast methodsFor: 'getters' stamp: 'JP 6/30/2021 16:58:44'!
orientation

	^'E'! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverFacingEast class' category: 'Mars-Rover'!
MarsRoverFacingEast class
	instanceVariableNames: ''!

!MarsRoverFacingEast class methodsFor: 'creation' stamp: 'JP 6/30/2021 16:32:14'!
itsValidOrientation: aStringOrientation

	^aStringOrientation = 'E'! !


!classDefinition: #MarsRoverFacingNorth category: 'Mars-Rover'!
MarsRoverOrientationStatus subclass: #MarsRoverFacingNorth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-Rover'!

!MarsRoverFacingNorth methodsFor: 'mars rover actions' stamp: 'JP 6/30/2021 17:03:45'!
moveBackwards

	marsRover moveRoverTowardsSouth 
! !

!MarsRoverFacingNorth methodsFor: 'mars rover actions' stamp: 'JP 6/30/2021 17:03:57'!
moveForward

	marsRover moveRoverTowardsNorth 
! !

!MarsRoverFacingNorth methodsFor: 'mars rover actions' stamp: 'JP 6/30/2021 17:04:11'!
rotateLeft

	marsRover rotateRoverTowardsWest ! !

!MarsRoverFacingNorth methodsFor: 'mars rover actions' stamp: 'JP 6/30/2021 17:04:19'!
rotateRight

	marsRover rotateRoverTowardsEast ! !


!MarsRoverFacingNorth methodsFor: 'getters' stamp: 'JP 6/30/2021 16:59:16'!
orientation

	^'N'! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverFacingNorth class' category: 'Mars-Rover'!
MarsRoverFacingNorth class
	instanceVariableNames: ''!

!MarsRoverFacingNorth class methodsFor: 'creation' stamp: 'JP 6/30/2021 16:32:26'!
itsValidOrientation: aStringOrientation

	^aStringOrientation = 'N'! !


!classDefinition: #MarsRoverFacingSouth category: 'Mars-Rover'!
MarsRoverOrientationStatus subclass: #MarsRoverFacingSouth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-Rover'!

!MarsRoverFacingSouth methodsFor: 'getters' stamp: 'JP 6/30/2021 16:59:01'!
orientation

	^'S'! !


!MarsRoverFacingSouth methodsFor: 'mars rover actions' stamp: 'JP 6/30/2021 17:03:45'!
moveBackwards

	marsRover moveRoverTowardsNorth ! !

!MarsRoverFacingSouth methodsFor: 'mars rover actions' stamp: 'JP 6/30/2021 17:03:57'!
moveForward

	marsRover moveRoverTowardsSouth ! !

!MarsRoverFacingSouth methodsFor: 'mars rover actions' stamp: 'JP 6/30/2021 17:04:11'!
rotateLeft
	
	marsRover rotateRoverTowardsEast ! !

!MarsRoverFacingSouth methodsFor: 'mars rover actions' stamp: 'JP 6/30/2021 17:04:19'!
rotateRight

	marsRover rotateRoverTowardsWest ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverFacingSouth class' category: 'Mars-Rover'!
MarsRoverFacingSouth class
	instanceVariableNames: ''!

!MarsRoverFacingSouth class methodsFor: 'creation' stamp: 'JP 6/30/2021 16:32:31'!
itsValidOrientation: aStringOrientation

	^aStringOrientation = 'S'! !


!classDefinition: #MarsRoverFacingWest category: 'Mars-Rover'!
MarsRoverOrientationStatus subclass: #MarsRoverFacingWest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-Rover'!

!MarsRoverFacingWest methodsFor: 'getters' stamp: 'JP 6/30/2021 16:59:09'!
orientation

	^'W'! !


!MarsRoverFacingWest methodsFor: 'mars rover actions' stamp: 'JP 6/30/2021 17:03:45'!
moveBackwards

	marsRover moveRoverTowardsEast! !

!MarsRoverFacingWest methodsFor: 'mars rover actions' stamp: 'JP 6/30/2021 17:03:57'!
moveForward

	marsRover moveRoverTowardsWest ! !

!MarsRoverFacingWest methodsFor: 'mars rover actions' stamp: 'JP 6/30/2021 17:04:11'!
rotateLeft

	marsRover rotateRoverTowardsSouth ! !

!MarsRoverFacingWest methodsFor: 'mars rover actions' stamp: 'JP 6/30/2021 17:04:19'!
rotateRight

	marsRover rotateRoverTowardsNorth ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverFacingWest class' category: 'Mars-Rover'!
MarsRoverFacingWest class
	instanceVariableNames: ''!

!MarsRoverFacingWest class methodsFor: 'creation' stamp: 'JP 6/30/2021 16:32:36'!
itsValidOrientation: aStringOrientation

	^aStringOrientation = 'S'! !
