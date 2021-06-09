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

!OOStackTest methodsFor: 'test' stamp: 'JP 6/9/2021 14:47:31'!
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

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'FV 6/9/2021 14:55:48'!
test01SentenceFinderShouldFailWhenPrefixIsEmpty
	|prefix|
	prefix := ''.
	stack push: 'Hola'.
	
	self should: [ sentenceFinder find: prefix]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix emptyPrefixError ]
	! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'FV 6/9/2021 14:55:01'!
test02SentenceFinderShouldFailWhenPrefixHasASpace
	|prefix|
	prefix := 'H '.
	stack push: 'H ola'.
	
	self should: [ sentenceFinder find: prefix]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix prefixHasSpaceError ]
	! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'FV 6/9/2021 15:14:24'!
test03SentenceFinderShouldNotFindAnythingWithNonMatchingPrefix
		
	|prefix resultsCollection|
	
	prefix := 'Hi'.
	stack push: 'sentence1'	.
	stack push: 'sentence2'.
	
	resultsCollection := sentenceFinder find: prefix.
	
	self assert: resultsCollection isEmpty.! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'FV 6/9/2021 15:15:18'!
test04SentenceFinderShouldFindTheSentenceWithMatchingPrefix
		
	|prefix resultsCollection|
	
	prefix := 'se'.
	stack push: 'sentence'	.
	stack push: 'not a sentence'.
	stack push: 'not another sentence'.
	
	resultsCollection := sentenceFinder find: prefix.
	
	self assert: resultsCollection size equals: 1.
	self assert: (resultsCollection at: 1) equals: 'sentence'.! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'FV 6/9/2021 15:20:08'!
test05SentenceFinderShouldFindAllTheSentencesWithMatchingPrefix
		
	|prefix resultsCollection|
	
	prefix := 'not'.
	stack push: 'sentence'	.
	stack push: 'not a sentence'.
	stack push: 'not another sentence'.
	
	resultsCollection := sentenceFinder find: prefix.
	
	self assert: resultsCollection size equals: 2.
	self assert: (resultsCollection at: 1) equals: 'not another sentence'.
	self assert: (resultsCollection at: 2) equals: 'not a sentence'.! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'FV 6/9/2021 15:16:01'!
test06SentenceFinderIsCaseSensitive
		
	|prefix resultsCollection|
	
	prefix := 'Not'.
	stack push: 'sentence'	.
	stack push: 'Not a sentence'.
	stack push: 'not another sentence'.
	
	resultsCollection := sentenceFinder find: prefix.
	
	self assert: resultsCollection size equals: 1.
	self assert: (resultsCollection at: 1) equals: 'Not a sentence'.! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'FV 6/9/2021 15:10:02'!
test07SentenceFinderDoesNotModifyStack
		
	|prefix|
	
	prefix := 'not'.
	stack push: 'sentence'	.
	stack push: 'notASentence'.
	stack push: 'notAnotherSentence'.
	
	sentenceFinder find: prefix.
	
	self assert: stack size equals: 3.
	self assert: stack pop equals: 'notAnotherSentence'.
	self assert: stack pop equals: 'notASentence'.
	self assert: stack pop equals: 'sentence'.! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'FV 6/9/2021 15:16:30'!
test08SentenceFinderDoesNotFailWhenPrefixIsLargerThanSentence
		
	|prefix resultsCollection|
	
	prefix := 'ThisIsAReallyLongPrefix'.
	
	stack push: 'sentence'	.
	stack push: 'another sentence'.
	stack push: 'ThisIsAReallyLongPrefixButItMatches'.
	
	resultsCollection := sentenceFinder find: prefix.
	
	self assert: resultsCollection size equals: 1.
! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'FV 6/9/2021 15:18:50'!
test09SentenceFinderShouldNotFailWhenEmptyStack
		
	|prefix resultsCollection|
	
	prefix := 'aPrefix'.
	
	
	resultsCollection := sentenceFinder find: prefix.
	
	self assert: resultsCollection isEmpty.
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


!classDefinition: #Prefix category: 'Stack-Exercise'!
Object subclass: #Prefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Prefix class' category: 'Stack-Exercise'!
Prefix class
	instanceVariableNames: ''!

!Prefix class methodsFor: 'as yet unclassified' stamp: 'FV 6/9/2021 15:31:55'!
newWith: aPrefixString! !


!classDefinition: #InvalidPrefix category: 'Stack-Exercise'!
Prefix subclass: #InvalidPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!


!classDefinition: #ValidPrefix category: 'Stack-Exercise'!
Prefix subclass: #ValidPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: 'stack prefix'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'private' stamp: 'FV 6/9/2021 15:25:59'!
charIsSpace: aChar
	^ aChar ~= $ .! !

!SentenceFinderByPrefix methodsFor: 'private' stamp: 'FV 6/9/2021 00:42:32'!
sentenceStartsWithPrefix: aSentence
	|substringSentence|
	aSentence size < prefix size ifTrue: [^ false].
	
	substringSentence := aSentence copyFrom: 1 to: prefix size.
	^ substringSentence = prefix.! !


!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'FV 6/9/2021 15:29:37'!
find: aPrefixString

	|auxiliarStack aCollectionOfValidSentences|
	
	"Estos ifs llevaría a subclasificar la clase String, lo cual no tiene sentido subclasificarse para un caso particular"
	aPrefixString isEmpty ifTrue: [^self error:  self class emptyPrefixError].
	
	(aPrefixString allSatisfy: [:aChar| self charIsSpace: aChar ]) ifFalse: [^self error: self class prefixHasSpaceError].
	
	
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

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'Errors' stamp: 'JP 6/9/2021 14:37:28'!
emptyPrefixError

	^ 'The prefix cannot be Empty'! !

!SentenceFinderByPrefix class methodsFor: 'Errors' stamp: 'FV 6/8/2021 23:41:37'!
prefixHasSpaceError
	^ 'The prefix cannot have any spaces'! !


!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'FV 6/8/2021 23:26:20'!
newWith: aStack
	^self new initializeWith: aStack.! !
