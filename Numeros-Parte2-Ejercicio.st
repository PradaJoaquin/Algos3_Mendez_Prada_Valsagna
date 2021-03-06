!classDefinition: #NumeroTest category: 'Numeros-Parte2-Ejercicio'!
TestCase subclass: #NumeroTest
	instanceVariableNames: 'zero one two four oneFifth oneHalf five twoFifth twoTwentyfifth fiveHalfs three eight negativeOne negativeTwo'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!NumeroTest methodsFor: 'tests' stamp: 'LL 9/13/2020 16:17:50'!
test01isZeroReturnsTrueWhenAskToZero

	self assert: zero isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'LL 9/13/2020 16:17:58'!
test02isZeroReturnsFalseWhenAskToOthersButZero

	self deny: one isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test03isOneReturnsTrueWhenAskToOne

	self assert: one isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test04isOneReturnsFalseWhenAskToOtherThanOne

	self deny: zero isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:14'!
test05EnteroAddsWithEnteroCorrectly

	self assert: one + one equals: two! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:18'!
test06EnteroMultipliesWithEnteroCorrectly

	self assert: two * two equals: four! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:20'!
test07EnteroDividesEnteroCorrectly

	self assert: two / two equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:38'!
test08FraccionAddsWithFraccionCorrectly
"
    La suma de fracciones es:
	 
	a/b + c/d = (a.d + c.b) / (b.d)
	 
	SI ESTAN PENSANDO EN LA REDUCCION DE FRACCIONES NO SE PREOCUPEN!!
	TODAVIA NO SE ESTA TESTEANDO ESE CASO
"
	| sevenTenths |

	sevenTenths := (Entero with: 7) / (Entero with: 10).

	self assert: oneFifth + oneHalf equals: sevenTenths! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:52'!
test09FraccionMultipliesWithFraccionCorrectly
"
    La multiplicacion de fracciones es:
	 
	(a/b) * (c/d) = (a.c) / (b.d)
"

	self assert: oneFifth * twoFifth equals: twoTwentyfifth! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:56'!
test10FraccionDividesFraccionCorrectly
"
    La division de fracciones es:
	 
	(a/b) / (c/d) = (a.d) / (b.c)
"

	self assert: oneHalf / oneFifth equals: fiveHalfs! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:07'!
test11EnteroAddsFraccionCorrectly
"
	Ahora empieza la diversion!!
"

	self assert: one + oneFifth equals: (Entero with: 6) / (Entero with: 5)! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:07'!
test12FraccionAddsEnteroCorrectly

	self assert: oneFifth + one equals: (Entero with: 6) / (Entero with: 5)! !

!NumeroTest methodsFor: 'tests' stamp: 'JP 5/29/2021 21:16:58'!
test13EnteroMultipliesFraccionCorrectly

	self assert: two * oneFifth equals: twoFifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:52'!
test14FraccionMultipliesEnteroCorrectly

	self assert: oneFifth * two equals: twoFifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'JP 5/29/2021 21:16:36'!
test15EnteroDividesFraccionCorrectly

	self assert: one / twoFifth equals: fiveHalfs  ! !

!NumeroTest methodsFor: 'tests' stamp: 'JP 5/29/2021 21:17:04'!
test16FraccionDividesEnteroCorrectly

	self assert: twoFifth / five equals: twoTwentyfifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'JP 5/29/2021 21:17:09'!
test17AFraccionCanBeEqualToAnEntero

	self assert: two equals: four / two! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:39'!
test18AparentFraccionesAreEqual

	self assert: oneHalf equals: two / four! !

!NumeroTest methodsFor: 'tests' stamp: 'JP 5/29/2021 21:17:13'!
test19AddingFraccionesCanReturnAnEntero

	self assert: oneHalf + oneHalf equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:42'!
test20MultiplyingFraccionesCanReturnAnEntero

	self assert: (two/five) * (five/two) equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:42'!
test21DividingFraccionesCanReturnAnEntero

	self assert: oneHalf / oneHalf equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:43'!
test22DividingEnterosCanReturnAFraccion

	self assert: two / four equals: oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:46'!
test23CanNotDivideEnteroByZero

	self 
		should: [ one / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Numero canNotDivideByZeroErrorDescription ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:46'!
test24CanNotDivideFraccionByZero

	self 
		should: [ oneHalf / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Numero canNotDivideByZeroErrorDescription ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test25AFraccionCanNotBeZero

	self deny: oneHalf isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test26AFraccionCanNotBeOne

	self deny: oneHalf isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 5/7/2020 17:46:14'!
test27EnteroSubstractsEnteroCorrectly

	self assert: three - one equals: two! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:47:41'!
test28FraccionSubstractsFraccionCorrectly
	
	self assert: twoFifth - oneFifth equals: oneFifth.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:48:00'!
test29EnteroSubstractsFraccionCorrectly

	self assert: one - oneHalf equals: oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 9/24/2018 08:48:05'!
test30FraccionSubstractsEnteroCorrectly

	| sixFifth |
	
	sixFifth := (Entero with: 6) / (Entero with: 5).
	
	self assert: sixFifth - one equals: oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 9/24/2018 08:48:08'!
test31SubstractingFraccionesCanReturnAnEntero

	| threeHalfs |
	
	threeHalfs := (Entero with: 3) / (Entero with: 2).
	
	self assert: threeHalfs - oneHalf equals: one.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:48:48'!
test32SubstractingSameEnterosReturnsZero

	self assert: one - one equals: zero.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:01'!
test33SubstractingSameFraccionesReturnsZero

	self assert: oneHalf - oneHalf equals: zero.! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 9/24/2018 08:48:14'!
test34SubstractingAHigherValueToANumberReturnsANegativeNumber

	| negativeThreeHalfs |
	
	negativeThreeHalfs := (Entero with: -3) / (Entero with: 2).	

	self assert: one - fiveHalfs equals: negativeThreeHalfs.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:23'!
test35FibonacciZeroIsOne

	self assert: zero fibonacci equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:32'!
test36FibonacciOneIsOne

	self assert: one fibonacci equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:39'!
test37FibonacciEnteroReturnsAddingPreviousTwoFibonacciEnteros

	self assert: four fibonacci equals: five.
	self assert: three fibonacci equals: three. 
	self assert: five fibonacci equals: four fibonacci + three fibonacci.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:47'!
test38FibonacciNotDefinedForNegativeNumbers

	self 
		should: [negativeOne fibonacci]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Entero negativeFibonacciErrorDescription ].! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:55'!
test39NegationOfEnteroIsCorrect

	self assert: two negated equals: negativeTwo.
		! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:03'!
test40NegationOfFraccionIsCorrect

	self assert: oneHalf negated equals: negativeOne / two.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:11'!
test41SignIsCorrectlyAssignedToFractionWithTwoNegatives

	self assert: oneHalf equals: (negativeOne / negativeTwo)! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:17'!
test42SignIsCorrectlyAssignedToFractionWithNegativeDivisor

	self assert: oneHalf negated equals: (one / negativeTwo)! !


!NumeroTest methodsFor: 'setup' stamp: 'JP 5/30/2021 22:36:12'!
setUp

	zero := Entero with: 0.
	one := Entero with: 1.
	two := Entero with: 2.
	three:= Entero with: 3.
	four := Entero with: 4.
	five := Entero with: 5.
	eight := Entero with: 8.
	negativeOne := Entero with: -1.
	negativeTwo := Entero with: -2.
	
	oneHalf := one / two.
	oneFifth := one / five.
	twoFifth := two / five.
	twoTwentyfifth := two / (Entero with: 25).
	fiveHalfs := five / two.
	! !


!classDefinition: #Numero category: 'Numeros-Parte2-Ejercicio'!
Object subclass: #Numero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:48'!
* aMultiplier

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:49'!
+ anAdder

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'NR 9/23/2018 22:21:28'!
- aSubtrahend

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:49'!
/ aDivisor

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'NR 9/23/2018 23:37:13'!
negated
	
	^self * (Entero with: -1)! !


!Numero methodsFor: 'testing' stamp: 'NR 9/23/2018 23:36:49'!
isNegative

	self subclassResponsibility ! !

!Numero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:49'!
isOne

	self subclassResponsibility ! !

!Numero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:49'!
isZero

	self subclassResponsibility ! !


!Numero methodsFor: 'private' stamp: 'HernanWilkinson 5/7/2016 22:48'!
invalidNumberType

	self error: self class invalidNumberTypeErrorDescription! !


!Numero methodsFor: 'as yet unclassified' stamp: 'JP 5/30/2021 18:52:58'!
beAddedToEntero: anEntero

	self subclassResponsibility! !

!Numero methodsFor: 'as yet unclassified' stamp: 'JP 5/30/2021 18:53:10'!
beAddedToFraccion: aFraccion

	self subclassResponsibility! !

!Numero methodsFor: 'as yet unclassified' stamp: 'JP 5/30/2021 18:53:22'!
beMultipliedToEntero: anEnteroMultiplier

	self subclassResponsibility! !

!Numero methodsFor: 'as yet unclassified' stamp: 'JP 5/30/2021 18:53:36'!
beMultipliedToFraccion: aFraccionMultiplier

	self subclassResponsibility! !

!Numero methodsFor: 'as yet unclassified' stamp: 'JP 5/30/2021 18:53:49'!
beSubstactedFromEntero: anEnteroMinuend

	self subclassResponsibility! !

!Numero methodsFor: 'as yet unclassified' stamp: 'JP 5/30/2021 18:54:06'!
beSubstactedFromFraccion: aFraccionMinuend

	self subclassResponsibility! !

!Numero methodsFor: 'as yet unclassified' stamp: 'JP 5/30/2021 20:39:33'!
divideEntero: anEnteroDividend

	self subclassResponsibility! !

!Numero methodsFor: 'as yet unclassified' stamp: 'JP 5/30/2021 20:39:58'!
divideFraccion: aFraccionDividend

	self subclassResponsibility! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Numero class' category: 'Numeros-Parte2-Ejercicio'!
Numero class
	instanceVariableNames: ''!

!Numero class methodsFor: 'error descriptions' stamp: 'NR 5/7/2020 17:47:38'!
canNotDivideByZeroErrorDescription

	^'No se puede Dividir por Cero'! !

!Numero class methodsFor: 'error descriptions' stamp: 'NR 5/7/2020 17:46:56'!
invalidNumberTypeErrorDescription
	^ 'Tipo de N�mero Inv�lido'! !


!classDefinition: #Entero category: 'Numeros-Parte2-Ejercicio'!
Numero subclass: #Entero
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Entero methodsFor: 'private' stamp: 'JP 5/29/2021 18:37:01'!
beAddedToEntero: anEntero

	^self class with: value + anEntero integerValue.
	! !

!Entero methodsFor: 'private' stamp: 'JP 5/29/2021 19:49:21'!
beAddedToFraccion: aFraccion

	|numerator denominator |
	
	numerator := aFraccion denominator * self + aFraccion numerator.
	denominator := aFraccion denominator.
	^numerator / denominator
	! !

!Entero methodsFor: 'private' stamp: 'JP 5/29/2021 19:25:46'!
beMultipliedToEntero: anEnteroMultiplier

	^self class with: anEnteroMultiplier integerValue * value! !

!Entero methodsFor: 'private' stamp: 'JP 5/29/2021 19:47:39'!
beMultipliedToFraccion: aFraccionMultiplier

	^aFraccionMultiplier numerator * self / aFraccionMultiplier denominator! !

!Entero methodsFor: 'private' stamp: 'JP 5/29/2021 19:30:15'!
beSubstactedFromEntero: anEnteroMinuend

	^self class with: anEnteroMinuend integerValue - value! !

!Entero methodsFor: 'private' stamp: 'JP 5/29/2021 19:59:05'!
beSubstactedFromFraccion: aFraccionMinuend

	^aFraccionMinuend numerator - (self * aFraccionMinuend denominator) / aFraccionMinuend denominator
! !

!Entero methodsFor: 'private' stamp: 'JP 5/31/2021 14:44:37'!
divideEntero: anEnteroDividend
	
	self subclassResponsibility! !

!Entero methodsFor: 'private' stamp: 'JP 5/30/2021 20:39:57'!
divideFraccion: aFraccionDividend

	^aFraccionDividend numerator / (aFraccionDividend denominator * self)! !


!Entero methodsFor: 'arithmetic operations' stamp: 'JP 5/29/2021 19:06:51'!
* aMultiplier 
	
	^aMultiplier beMultipliedToEntero: self
	! !

!Entero methodsFor: 'arithmetic operations' stamp: 'JP 5/29/2021 19:06:32'!
+ anAdder 

	^anAdder beAddedToEntero: self.! !

!Entero methodsFor: 'arithmetic operations' stamp: 'JP 5/29/2021 19:30:16'!
- aSubtrahend 

	^aSubtrahend beSubstactedFromEntero: self! !

!Entero methodsFor: 'arithmetic operations' stamp: 'JP 5/30/2021 20:39:33'!
/ aDivisor 

	^aDivisor divideEntero: self! !

!Entero methodsFor: 'arithmetic operations' stamp: 'JP 5/31/2021 02:19:00'!
fibonacci

	self subclassResponsibility ! !


!Entero methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 21:01'!
= anObject

	^(anObject isKindOf: self class) and: [ value = anObject integerValue ]! !

!Entero methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:17'!
hash

	^value hash! !


!Entero methodsFor: 'initialization' stamp: 'JP 5/30/2021 19:11:06'!
initalizeWith: aValue 
	
	value := aValue! !


!Entero methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:02'!
integerValue

	"Usamos integerValue en vez de value para que no haya problemas con el mensaje value implementado en Object - Hernan"
	
	^value! !


!Entero methodsFor: 'printing' stamp: 'HAW 9/24/2018 08:53:19'!
printOn: aStream

	aStream print: value ! !


!Entero methodsFor: 'testing' stamp: 'NR 9/23/2018 22:17:55'!
isNegative
	
	^value < 0! !

!Entero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 20:14'!
isOne
	
	^value = 1! !

!Entero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 20:12'!
isZero
	
	^value = 0! !


!Entero methodsFor: 'arithmetic operations - private' stamp: 'JP 5/30/2021 23:32:40'!
// aDivisor 

	^self class with: value // aDivisor integerValue! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'JP 5/31/2021 15:34:57'!
greatestCommonDivisorWith: anEntero 
	
	^Entero with: (value gcd: anEntero integerValue)! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Entero class' category: 'Numeros-Parte2-Ejercicio'!
Entero class
	instanceVariableNames: ''!

!Entero class methodsFor: 'instance creation' stamp: 'NR 4/8/2019 02:57:57'!
negativeFibonacciErrorDescription
	^ ' Fibonacci no est� definido aqu� para Enteros Negativos'! !

!Entero class methodsFor: 'instance creation' stamp: 'JP 5/31/2021 15:38:04'!
with: aValue 
	
	"Esta verificacion esta puesta por si se equivocan y quieren crear un Entero pasando otra cosa que un Integer - Hernan"
	| validNumericClass |
	aValue isInteger ifFalse: [  self error: 'aValue debe ser anInteger' ].
	
	validNumericClass := Entero allSubclasses detect: [:class| class isAValidValue: aValue ].
	^validNumericClass new initalizeWith: aValue! !


!classDefinition: #Cero category: 'Numeros-Parte2-Ejercicio'!
Entero subclass: #Cero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Cero methodsFor: 'as yet unclassified' stamp: 'JP 5/30/2021 23:29:49'!
/ aDivisor

	^self! !

!Cero methodsFor: 'as yet unclassified' stamp: 'JP 5/30/2021 22:42:04'!
divideEntero: anEnteroDividend

	Fraccion error: Fraccion canNotDivideByZeroErrorDescription! !

!Cero methodsFor: 'as yet unclassified' stamp: 'JP 5/31/2021 03:30:59'!
fibonacci

	^Entero with: 1! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cero class' category: 'Numeros-Parte2-Ejercicio'!
Cero class
	instanceVariableNames: ''!

!Cero class methodsFor: 'as yet unclassified' stamp: 'JP 5/31/2021 15:23:49'!
isAValidValue: aValue

	^aValue = 0! !


!classDefinition: #Negativo category: 'Numeros-Parte2-Ejercicio'!
Entero subclass: #Negativo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Negativo methodsFor: 'as yet unclassified' stamp: 'JP 5/30/2021 22:42:49'!
divideEntero: anEnteroDividend

	^anEnteroDividend negated / self negated! !

!Negativo methodsFor: 'as yet unclassified' stamp: 'JP 5/31/2021 02:11:18'!
fibonacci

	self error: Entero negativeFibonacciErrorDescription! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Negativo class' category: 'Numeros-Parte2-Ejercicio'!
Negativo class
	instanceVariableNames: ''!

!Negativo class methodsFor: 'as yet unclassified' stamp: 'JP 5/31/2021 15:24:12'!
isAValidValue: aValue

	^aValue < 0! !


!classDefinition: #PositivoGreaterThanOne category: 'Numeros-Parte2-Ejercicio'!
Entero subclass: #PositivoGreaterThanOne
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!PositivoGreaterThanOne methodsFor: 'as yet unclassified' stamp: 'JP 5/31/2021 15:02:20'!
/ aDivisor 
	
	| greatestCommonDivisor numerator denominator |
	
	greatestCommonDivisor := self greatestCommonDivisorWith: aDivisor. 
	numerator := self // greatestCommonDivisor.
	denominator := aDivisor // greatestCommonDivisor.
	
	^denominator divideEntero: numerator! !

!PositivoGreaterThanOne methodsFor: 'as yet unclassified' stamp: 'JP 5/31/2021 15:03:03'!
divideEntero: anEnteroDividend
	
	^Fraccion with: anEnteroDividend over: self! !

!PositivoGreaterThanOne methodsFor: 'as yet unclassified' stamp: 'JP 5/31/2021 02:19:05'!
fibonacci

	| one two |
	
	one := Entero with: 1.
	two := Entero with: 2.
	
	^ (self - one) fibonacci + (self - two) fibonacci! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PositivoGreaterThanOne class' category: 'Numeros-Parte2-Ejercicio'!
PositivoGreaterThanOne class
	instanceVariableNames: ''!

!PositivoGreaterThanOne class methodsFor: 'as yet unclassified' stamp: 'JP 5/31/2021 15:24:34'!
isAValidValue: aValue

	^aValue > 1! !


!classDefinition: #Uno category: 'Numeros-Parte2-Ejercicio'!
Entero subclass: #Uno
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Uno methodsFor: 'as yet unclassified' stamp: 'JP 5/31/2021 02:28:42'!
divideEntero: anEnteroDividend

	^anEnteroDividend! !

!Uno methodsFor: 'as yet unclassified' stamp: 'JP 5/31/2021 02:31:01'!
fibonacci

	^Entero with: 1.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Uno class' category: 'Numeros-Parte2-Ejercicio'!
Uno class
	instanceVariableNames: ''!

!Uno class methodsFor: 'as yet unclassified' stamp: 'JP 5/31/2021 15:25:24'!
isAValidValue: aValue

	^aValue = 1! !


!classDefinition: #Fraccion category: 'Numeros-Parte2-Ejercicio'!
Numero subclass: #Fraccion
	instanceVariableNames: 'numerator denominator'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Fraccion methodsFor: 'arithmetic operations' stamp: 'JP 5/29/2021 20:21:01'!
* aMultiplier 
	
	^aMultiplier beMultipliedToFraccion: self
	! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'JP 5/29/2021 20:20:58'!
+ anAdder 

	^anAdder beAddedToFraccion: self ! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'JP 5/29/2021 20:25:30'!
- aSubtrahend 
	
	^aSubtrahend beSubstactedFromFraccion: self
! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'JP 5/30/2021 20:39:58'!
/ aDivisor 
	
	^aDivisor divideFraccion: self! !


!Fraccion methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:42'!
= anObject

	^(anObject isKindOf: self class) and: [ (numerator * anObject denominator) = (denominator * anObject numerator) ]! !

!Fraccion methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:50'!
hash

	^(numerator hash / denominator hash) hash! !


!Fraccion methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:56'!
denominator

	^ denominator! !

!Fraccion methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:56'!
numerator

	^ numerator! !


!Fraccion methodsFor: 'initialization' stamp: 'JP 5/31/2021 15:41:16'!
initializeWith: aNumerator over: aDenominator

	"Estas precondiciones estan por si se comenten errores en la implementacion - Hernan"
	aNumerator isZero ifTrue: [ self error: 'una fraccion no puede ser cero' ].
	aDenominator isOne ifTrue: [ self error: 'una fraccion no puede tener denominador 1 porque sino es un entero' ].
	"La palabra de Hernan no se toca, por eso dejamos estos ifs ;) - Joaquin Prada, Federico Valsagna"
	
	numerator := aNumerator.
	denominator := aDenominator ! !


!Fraccion methodsFor: 'testing' stamp: 'NR 9/23/2018 23:41:38'!
isNegative
	
	^numerator < 0! !

!Fraccion methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:51'!
isOne
	
	^false! !

!Fraccion methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:51'!
isZero
	
	^false! !


!Fraccion methodsFor: 'printing' stamp: 'HAW 9/24/2018 08:54:46'!
printOn: aStream

	aStream 
		print: numerator;
		nextPut: $/;
		print: denominator ! !


!Fraccion methodsFor: 'private' stamp: 'JP 5/30/2021 18:44:57'!
beAddedToEntero: anEntero

		^self + anEntero.
		! !

!Fraccion methodsFor: 'private' stamp: 'JP 5/29/2021 21:11:41'!
beAddedToFraccion: aFraccion

	| newNumerator newDenominator |

	newNumerator := (aFraccion denominator * numerator) + (aFraccion numerator * denominator).
	newDenominator := aFraccion denominator * denominator.
	
	^newNumerator / newDenominator! !

!Fraccion methodsFor: 'private' stamp: 'JP 5/30/2021 18:45:41'!
beMultipliedToEntero: anEnteroMultiplier

	^self * anEnteroMultiplier.! !

!Fraccion methodsFor: 'private' stamp: 'JP 5/29/2021 20:43:59'!
beMultipliedToFraccion: aFraccionMultiplier

	^(aFraccionMultiplier numerator * numerator ) / (aFraccionMultiplier denominator * denominator)
! !

!Fraccion methodsFor: 'private' stamp: 'JP 5/29/2021 19:30:15'!
beSubstactedFromEntero: anEnteroMinuend

	^(anEnteroMinuend * denominator) - numerator / denominator! !

!Fraccion methodsFor: 'private' stamp: 'JP 5/29/2021 20:06:37'!
beSubstactedFromFraccion: aFraccionMinuend

	|newNumerator newDenominator |
	newNumerator := ( aFraccionMinuend numerator * denominator) - (aFraccionMinuend denominator * numerator).
	newDenominator := aFraccionMinuend denominator * denominator.
	
	^newNumerator / newDenominator
! !

!Fraccion methodsFor: 'private' stamp: 'JP 5/30/2021 20:39:33'!
divideEntero: anEnteroDividend

	^(anEnteroDividend * denominator) / numerator 
! !

!Fraccion methodsFor: 'private' stamp: 'JP 5/30/2021 20:39:58'!
divideFraccion: aFraccionDividend

	^aFraccionDividend numerator * denominator / (aFraccionDividend denominator * numerator)
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Fraccion class' category: 'Numeros-Parte2-Ejercicio'!
Fraccion class
	instanceVariableNames: ''!

!Fraccion class methodsFor: 'intance creation' stamp: 'JP 5/31/2021 14:46:31'!
with: aDividend over: aDivisor

	^self new initializeWith: aDividend over: aDivisor
	! !
