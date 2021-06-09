!classDefinition: #OOStackTest category: 'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:29:55'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:01'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:09'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:48'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:20'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:24'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:26'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:31'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:44'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: 'stack sentenceFinder'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'FV 6/9/2021 00:30:41'!
setUp

	stack := OOStack new.
	sentenceFinder :=	 SentenceFinderByPrefix newWith: stack.! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'FV 6/9/2021 00:36:55'!
test01Stack
		
	stack push: 'Hola'.
	stack push: 'Hooo'.
	stack push: 'Hi'.
	stack push: 'ooo'.
	
	self assert: (sentenceFinder find: 'Ho') size equals: 2.
	self assert: (sentenceFinder find: 'H') size equals: 3.
	self assert: (sentenceFinder find: 'o') size equals: 1.
	self assert: (sentenceFinder find: 'q') size equals: 0.
	! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'stackedElements'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'Functionality' stamp: 'FV 6/5/2021 16:14:55'!
isEmpty
	^ stackedElements isEmpty.! !

!OOStack methodsFor: 'Functionality' stamp: 'FV 6/8/2021 22:27:55'!
pop
	|stackTop|
	
	stackTop := self top.
	stackedElements removeLast.
	^stackTop.! !

!OOStack methodsFor: 'Functionality' stamp: 'FV 6/5/2021 16:16:31'!
push: anElement
	^stackedElements addLast: anElement.! !

!OOStack methodsFor: 'Functionality' stamp: 'FV 6/5/2021 16:27:18'!
size
	^stackedElements size.! !

!OOStack methodsFor: 'Functionality' stamp: 'FV 6/8/2021 23:10:28'!
top
	|stackTopVisualizer|
	stackTopVisualizer := OOStackTopVisualizer newWith: stackedElements.
	^stackTopVisualizer seeTop.! !


!OOStack methodsFor: 'initialization' stamp: 'FV 6/5/2021 16:11:57'!
initialize
	stackedElements := OrderedCollection new.
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'FV 6/5/2021 16:07:40'!
new
	^self basicNew initialize.! !

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!classDefinition: #OOStackTopVisualizer category: 'Stack-Exercise'!
Object subclass: #OOStackTopVisualizer
	instanceVariableNames: 'stackedElements'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTopVisualizer methodsFor: 'as yet unclassified' stamp: 'FV 6/8/2021 23:14:35'!
initializeWith: aSetOfStackedElements.
	self subclassResponsibility.! !

!OOStackTopVisualizer methodsFor: 'as yet unclassified' stamp: 'FV 6/8/2021 23:10:28'!
seeTop
	self subclassResponsibility! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStackTopVisualizer class' category: 'Stack-Exercise'!
OOStackTopVisualizer class
	instanceVariableNames: ''!

!OOStackTopVisualizer class methodsFor: 'as yet unclassified' stamp: 'FV 6/8/2021 23:16:47'!
isAValidSetOfStackedElements: aSetOfStackedElements
	self subclassResponsibility! !

!OOStackTopVisualizer class methodsFor: 'as yet unclassified' stamp: 'FV 6/8/2021 23:16:47'!
newWith: aSetOfStackedElements
	|validClass|
	validClass := OOStackTopVisualizer allSubclasses detect: [:aClass| aClass isAValidSetOfStackedElements: aSetOfStackedElements].
	^validClass new initializeWith: aSetOfStackedElements.! !


!classDefinition: #OOEmptyStackTopVisualizer category: 'Stack-Exercise'!
OOStackTopVisualizer subclass: #OOEmptyStackTopVisualizer
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOEmptyStackTopVisualizer methodsFor: 'as yet unclassified' stamp: 'FV 6/8/2021 23:14:44'!
initializeWith: aSetOfStackedElements.
	! !

!OOEmptyStackTopVisualizer methodsFor: 'as yet unclassified' stamp: 'FV 6/8/2021 23:10:28'!
seeTop
	^self error: self class stackEmptyErrorDescription! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOEmptyStackTopVisualizer class' category: 'Stack-Exercise'!
OOEmptyStackTopVisualizer class
	instanceVariableNames: ''!

!OOEmptyStackTopVisualizer class methodsFor: 'as yet unclassified' stamp: 'FV 6/8/2021 23:19:25'!
isAValidSetOfStackedElements: aSetOfStackedElements
	^ aSetOfStackedElements isEmpty.! !

!OOEmptyStackTopVisualizer class methodsFor: 'as yet unclassified' stamp: 'FV 6/8/2021 22:49:04'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!classDefinition: #OONonEmptyStackTopVisualizer category: 'Stack-Exercise'!
OOStackTopVisualizer subclass: #OONonEmptyStackTopVisualizer
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OONonEmptyStackTopVisualizer methodsFor: 'as yet unclassified' stamp: 'FV 6/8/2021 23:15:03'!
initializeWith: aSetOfStackedElements
	stackedElements := aSetOfStackedElements.! !

!OONonEmptyStackTopVisualizer methodsFor: 'as yet unclassified' stamp: 'FV 6/8/2021 23:10:28'!
seeTop
	^stackedElements last.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OONonEmptyStackTopVisualizer class' category: 'Stack-Exercise'!
OONonEmptyStackTopVisualizer class
	instanceVariableNames: ''!

!OONonEmptyStackTopVisualizer class methodsFor: 'as yet unclassified' stamp: 'FV 6/8/2021 23:19:49'!
isAValidSetOfStackedElements: aSetOfStackedElements
	^ aSetOfStackedElements isEmpty not.! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: 'stack prefix'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'FV 6/9/2021 00:25:18'!
find: aPrefixString
	|auxiliarStack aCollectionOfValidSentences|
	aPrefixString isEmpty ifTrue: [^self error:  self class emptyPrefixError].
	(aPrefixString allSatisfy: [:aChar| aChar ~= $ ]) ifFalse: [^self error: self class prefixHasSpaceError].
	
	prefix := aPrefixString.
	
	
	auxiliarStack  := OOStack new.
	aCollectionOfValidSentences := OrderedCollection new.
	
	[stack isEmpty] whileFalse: 
		[|aSentence| 
		aSentence := stack pop. 
		auxiliarStack push: aSentence.
		(self sentenceStartsWithPrefix: aSentence ) ifTrue: [aCollectionOfValidSentences add: aSentence].
		
		].
	
	[auxiliarStack isEmpty] whileFalse: [stack push: (auxiliarStack pop)].
	^aCollectionOfValidSentences.! !

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'FV 6/8/2021 23:26:39'!
initializeWith: aStack
	stack := aStack.! !

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'FV 6/9/2021 00:42:32'!
sentenceStartsWithPrefix: aSentence
	|substringSentence|
	aSentence size < prefix size ifTrue: [^ false].
	
	substringSentence := aSentence copyFrom: 1 to: prefix size.
	^ substringSentence = prefix.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'Errors' stamp: 'FV 6/8/2021 23:41:47'!
emptyPrefixError
	^ 'The prefix cannot be Empty'! !

!SentenceFinderByPrefix class methodsFor: 'Errors' stamp: 'FV 6/8/2021 23:41:37'!
prefixHasSpaceError
	^ 'The prefix cannot have any spaces'! !


!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'FV 6/8/2021 23:26:20'!
newWith: aStack
	^self new initializeWith: aStack.! !
