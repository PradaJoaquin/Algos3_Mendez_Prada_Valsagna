!classDefinition: #MarsRoverTests category: 'Mars-Rover'!
TestCase subclass: #MarsRoverTests
	instanceVariableNames: 'north south east west forward backwards'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-Rover'!

!MarsRoverTests methodsFor: 'DiscardedTests' stamp: 'JP 6/27/2021 19:47:42'!
test05RoverCanStartFacingNorth

	"Este test fue descartado ya que el test04 testeaba lo mismo"

	| marsRoverController |
	marsRoverController := MarsRoverController newWithRoverPosition: (0@0) andFacing: north.
	
	self assert: (marsRoverController roverOrientation = north)! !


!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'JP 6/27/2021 19:19:40'!
setUp

	north := 'N'.
	south := 'S'.
	east := 'E'.
	west := 'W'.
	
	forward := 'f'.
	backwards := 'b'.! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'JP 6/27/2021 19:46:33'!
test01RoverExecutesCorrectlyForwardInstruction

	| marsRoverController |
	marsRoverController := MarsRoverController newWithRoverPosition: (0@0) andFacing: north.
	
	marsRoverController receiveInstruction: forward.
	
	self assert: (marsRoverController roverPosition = (0@1))! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'JP 6/27/2021 19:46:50'!
test02RoverExecutesCorrectlyBackwardsInstruction

	| marsRoverController |
	marsRoverController := MarsRoverController newWithRoverPosition: (0@0) andFacing: north.
	
	marsRoverController receiveInstruction: backwards.
	
	self assert: (marsRoverController roverPosition = (0@-1))! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'JP 6/27/2021 19:41:56'!
test03RoverCanStartAtDesignatedPosition

	| marsRoverController |
	marsRoverController := MarsRoverController newWithRoverPosition: (1@1) andFacing: north.
	
	self assert: (marsRoverController roverPosition = (1@1))! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'JP 6/27/2021 19:42:43'!
test04RoverCanStartAtDesigantedOrientation

	| marsRoverController |
	marsRoverController := MarsRoverController newWithRoverPosition: (1@1) andFacing: south.
	
	self assert: (marsRoverController roverOrientation = south)! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'JP 6/27/2021 19:52:54'!
test05RoverExecutesCorrectlyLeftInstruction

	| marsRoverController |
	marsRoverController := MarsRoverController newWithRoverPosition: (0@0) andFacing: north.

	marsRoverController receiveInstruction: 'l'.
	
	self assert: (marsRoverController roverOrientation = west)! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'JP 6/27/2021 19:49:41'!
test06RoverExecutesCorrectlyRightInstruction

	| marsRoverController |
	marsRoverController := MarsRoverController newWithRoverPosition: (0@0) andFacing: north.
	
	marsRoverController receiveInstruction: 'r'.
	
	self assert: (marsRoverController roverOrientation = east)! !


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


!MarsRoverController methodsFor: 'as yet unclassified' stamp: 'JP 6/27/2021 18:44:57'!
moveRoverBackwards

	roverPosition := roverPosition + (0@-1)! !

!MarsRoverController methodsFor: 'as yet unclassified' stamp: 'JP 6/27/2021 18:44:16'!
moveRoverForward

	roverPosition := roverPosition + (0@1)! !

!MarsRoverController methodsFor: 'as yet unclassified' stamp: 'JP 6/27/2021 19:32:00'!
receiveInstruction: anInstruction
	
	(anInstruction = 'f') ifTrue: [self moveRoverForward].
	(anInstruction = 'b') ifTrue: [self moveRoverBackwards].
	(anInstruction = 'l') ifTrue: [self rotateRoverLeft].
	(anInstruction = 'r') ifTrue: [self rotateRoverRight].! !

!MarsRoverController methodsFor: 'as yet unclassified' stamp: 'JP 6/27/2021 19:31:41'!
rotateRoverLeft
	
	roverOrientation := 'W'! !

!MarsRoverController methodsFor: 'as yet unclassified' stamp: 'JP 6/27/2021 19:31:48'!
rotateRoverRight
	
	roverOrientation := 'E'! !

!MarsRoverController methodsFor: 'as yet unclassified' stamp: 'JP 6/27/2021 19:15:29'!
roverOrientation

	^roverOrientation! !

!MarsRoverController methodsFor: 'as yet unclassified' stamp: 'JP 6/27/2021 18:43:01'!
roverPosition

	^roverPosition! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverController class' category: 'Mars-Rover'!
MarsRoverController class
	instanceVariableNames: ''!

!MarsRoverController class methodsFor: 'as yet unclassified' stamp: 'JP 6/27/2021 19:03:00'!
newWithRoverPosition: aRoverStartingPosition andFacing: aRoverStartingOrientation

	^self new initializeWithPosition: aRoverStartingPosition andOrientation: aRoverStartingOrientation! !
