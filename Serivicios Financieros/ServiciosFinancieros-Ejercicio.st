!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:43'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:20'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 * peso on: account.
		
	self assert: 100 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:24'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	Withdraw register: 50 * peso on: account.
		
	self assert: 50 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:14'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50 * peso.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:22'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	withdraw := Withdraw register: 50 * peso on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:14'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100 * peso.
	withdraw := Withdraw for: 50 * peso.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:23'!
test07AccountKnowsItsTransactions 

	| account deposit |
	
	account := ReceptiveAccount new.
	
	deposit := Deposit register: 50 * peso on: account.
		
	self assert: 1 equals: account transactions size.
	self assert: (account transactions includes: deposit).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'FV 7/4/2021 20:21:18'!
test08TransferIncreasesBalanceOnReceiverAccountAndDecreasesOnSenderAccount
	|accountSender accountReceiver|
	
	accountSender := ReceptiveAccount new.
	Deposit register: 200 * peso on: accountSender.
	accountReceiver := ReceptiveAccount new.
	
	Transfer register: 50 * peso from: accountSender to: accountReceiver.
	
	self assert: 150 * peso equals: accountSender balance.
	self assert: 50 * peso equals: accountReceiver balance.
	! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'FV 7/4/2021 20:22:23'!
test09BothAccountsRegisterTheirPartOfTransfer
	
	|accountSender accountReceiver aTransfer|
	
	accountSender := ReceptiveAccount new.
	Deposit register: 200 * peso on: accountSender.
	accountReceiver := ReceptiveAccount new.
	
	aTransfer := Transfer register: 50 * peso from: accountSender to: accountReceiver.
	
	self assert: (accountSender hasRegistered: aTransfer withdrawPart).
	self assert: (accountReceiver hasRegistered: aTransfer depositPart).! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'FV 7/4/2021 20:22:58'!
test10ATransferKnowsItsValue
	
	|accountSender accountReceiver aTransfer|
	
	accountSender := ReceptiveAccount new.
	Deposit register: 200 * peso on: accountSender.
	accountReceiver := ReceptiveAccount new.
	
	aTransfer := Transfer register: 50 * peso from: accountSender to: accountReceiver.
	
	self assert: 50 * peso equals: aTransfer value.! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'FV 7/4/2021 20:23:28'!
test11BothTransferPartsKnowTheirCounterpart
	
	|accountSender accountReceiver withdrawPartOfTransfer depositPartOfTransfer|
	
	accountSender := ReceptiveAccount new.
	Deposit register: 200 * peso on: accountSender.
	accountReceiver := ReceptiveAccount new.
	
	Transfer register: 50 * peso from: accountSender to: accountReceiver.
	
	
	withdrawPartOfTransfer := accountSender transactions last.
	depositPartOfTransfer := accountReceiver  transactions last.
	
	
	self assert: depositPartOfTransfer equals: withdrawPartOfTransfer counterpart.
	self assert: withdrawPartOfTransfer equals: depositPartOfTransfer counterpart.
	! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'FV 7/4/2021 17:36:30'!
effectOnAccount
	self subclassResponsibility.! !

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'NR 10/17/2019 03:22:00'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'FV 7/4/2021 17:36:30'!
effectOnAccount
	^self value.! !

!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Transfer category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Transfer
	instanceVariableNames: 'value depositPart withdrawPart'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Transfer methodsFor: 'initialization' stamp: 'FV 7/4/2021 20:04:29'!
initializeFor: anAmountOfMoney
	value := anAmountOfMoney.! !

!Transfer methodsFor: 'initialization' stamp: 'FV 7/4/2021 20:05:48'!
setDepositPart: aDepositPartOfTransfer andWithdrawPart: aWithdrawPartOfTransfer
	
	depositPart := aDepositPartOfTransfer.
	withdrawPart := aWithdrawPartOfTransfer.! !



!Transfer methodsFor: 'as yet unclassified' stamp: 'FV 7/4/2021 20:12:44'!
counterpart
	self subclassResponsibility.! !

!Transfer methodsFor: 'as yet unclassified' stamp: 'FV 7/4/2021 20:16:02'!
depositPart
	^depositPart ! !

!Transfer methodsFor: 'as yet unclassified' stamp: 'FV 7/4/2021 19:33:00'!
effectOnAccount
	self subclassResponsibility.! !

!Transfer methodsFor: 'as yet unclassified' stamp: 'FV 7/4/2021 18:36:32'!
value
	^ value.! !

!Transfer methodsFor: 'as yet unclassified' stamp: 'FV 7/4/2021 20:16:31'!
withdrawPart
	^withdrawPart! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: 'ServiciosFinancieros-Ejercicio'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'as yet unclassified' stamp: 'FV 7/4/2021 20:03:50'!
register: anAmountOfMoney from: accountSender to: accountReceiver
	|aWithdrawPartOfTransfer aDepositPartOfTransfer aTransfer|
	
	aTransfer := self new initializeFor: anAmountOfMoney.
	
	
	aWithdrawPartOfTransfer := WithdrawPartOfTransfer new initializeFromTransfer: aTransfer.
	aDepositPartOfTransfer := DepositPartOfTransfer new initializeFromTransfer: aTransfer.
	accountSender register: aWithdrawPartOfTransfer.
	accountReceiver register: aDepositPartOfTransfer.
	
	
	aTransfer setDepositPart: aDepositPartOfTransfer andWithdrawPart: aWithdrawPartOfTransfer.
	^aTransfer! !


!classDefinition: #DepositPartOfTransfer category: 'ServiciosFinancieros-Ejercicio'!
Transfer subclass: #DepositPartOfTransfer
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!DepositPartOfTransfer methodsFor: 'as yet unclassified' stamp: 'FV 7/4/2021 20:16:31'!
counterpart
	^ transfer withdrawPart.! !

!DepositPartOfTransfer methodsFor: 'as yet unclassified' stamp: 'FV 7/4/2021 20:11:37'!
effectOnAccount

	^transfer value! !

!DepositPartOfTransfer methodsFor: 'as yet unclassified' stamp: 'FV 7/4/2021 20:06:44'!
initializeFromTransfer: aTransfer
	transfer := aTransfer! !


!classDefinition: #WithdrawPartOfTransfer category: 'ServiciosFinancieros-Ejercicio'!
Transfer subclass: #WithdrawPartOfTransfer
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!WithdrawPartOfTransfer methodsFor: 'as yet unclassified' stamp: 'FV 7/4/2021 20:16:02'!
counterpart
	^transfer depositPart.! !

!WithdrawPartOfTransfer methodsFor: 'as yet unclassified' stamp: 'FV 7/4/2021 20:11:30'!
effectOnAccount

	^transfer value negated.! !

!WithdrawPartOfTransfer methodsFor: 'as yet unclassified' stamp: 'FV 7/4/2021 20:06:54'!
initializeFromTransfer: aTransfer
	transfer := aTransfer.! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'FV 7/4/2021 17:36:30'!
effectOnAccount
	^self value negated.! !

!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'FV 7/4/2021 17:19:39'!
for: aValue

	^ self new initializeFor: aValue. ! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'NR 10/17/2019 15:06:56'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'FV 7/4/2021 17:36:30'!
balance

	^transactions sum: [ :aTransaction | aTransaction effectOnAccount.] ifEmpty: [ 0 ].! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'NR 10/17/2019 03:28:43'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !
