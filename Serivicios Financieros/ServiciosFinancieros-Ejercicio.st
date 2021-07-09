!classDefinition: #PortfolioTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!PortfolioTest methodsFor: 'tests' stamp: 'FV 7/8/2021 15:26:04'!
test01TheBalanceOfAnEmptyPortfolioIs0
	|aPortfolio|
	
	aPortfolio := Portfolio new.

	self thePortfolio: aPortfolio balanceIs: 0 * peso.
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'FV 7/8/2021 15:26:23'!
test02APortfolioCanCalculateBalanceOfItsAccounts
	|aPortfolio anotherPortfolio anAccount anotherAccount|
	
	anAccount := ReceptiveAccount new.
	anotherAccount := ReceptiveAccount new.
	aPortfolio := Portfolio new.
	anotherPortfolio := Portfolio new.
	aPortfolio add: anAccount.
	aPortfolio add: anotherPortfolio.
	anotherPortfolio add: anotherAccount.

	Deposit register: 100 * peso on: anAccount.
	Deposit register: 150 * peso on: anotherAccount.
	
	self thePortfolio: aPortfolio balanceIs: 250 * peso.! !

!PortfolioTest methodsFor: 'tests' stamp: 'FV 7/7/2021 17:11:52'!
test03APortfolioDoesNotRegisterTransaccionsOutsideOfIt
	|aPortfolio anAccountNotInPortfolio aTransactionNotInPortfolio |
	
	anAccountNotInPortfolio := ReceptiveAccount new.
	aPortfolio := Portfolio new.

	aTransactionNotInPortfolio := Deposit register: 100 * peso on: anAccountNotInPortfolio .

	
	self deny: (aPortfolio hasRegistered: aTransactionNotInPortfolio).! !

!PortfolioTest methodsFor: 'tests' stamp: 'FV 7/7/2021 17:11:59'!
test04APortfolioCanRegisterTransactionsOfItsAccounts
	|aPortfolio anAccount aTransaction |
	
	anAccount := ReceptiveAccount new.
	aPortfolio := Portfolio new.
	aPortfolio add: anAccount.

	aTransaction := Deposit register: 100 * peso on: anAccount.

	
	self assert: (aPortfolio hasRegistered: aTransaction).! !

!PortfolioTest methodsFor: 'tests' stamp: 'FV 7/7/2021 17:12:07'!
test05APortfolioCanShowAllOfItsTransactions
| aPortfolio anotherPortfolio listOfAllTransactions anAccount anotherAccount|
	
	anAccount := ReceptiveAccount new.
	anotherAccount := ReceptiveAccount new.
	aPortfolio := Portfolio new.
	anotherPortfolio := Portfolio new.
	aPortfolio add: anAccount.
	aPortfolio add: anotherPortfolio.
	anotherPortfolio add: anotherAccount.
	
	Deposit register: 100 * peso on: anAccount.
	Withdraw register: 25 * peso on: anAccount.
	Deposit register: 500 * peso on: anotherAccount.

	listOfAllTransactions := anAccount transactions.
	listOfAllTransactions addAll: (anotherAccount transactions).
	
	self assert: (aPortfolio transactions) equals: listOfAllTransactions.! !

!PortfolioTest methodsFor: 'tests' stamp: 'FV 7/7/2021 17:09:55'!
test06AnEmptyPortfolioTransactionsListIsEmpty
	| aPortfolio |
	
	aPortfolio := Portfolio new.
	
	self assert: aPortfolio transactions size equals: 0.! !


!PortfolioTest methodsFor: 'extra tests' stamp: 'FV 7/8/2021 18:24:20'!
test01CannotAddAccountTwiceToSamePortfolio
	|aPortfolio anAccount|
	
	aPortfolio := Portfolio new.
	
	anAccount := ReceptiveAccount new.
	
	aPortfolio add: anAccount.
	
	self should: [aPortfolio add: anAccount] 
		raise: Error - MessageNotUnderstood 
	withExceptionDo: [:anError | self assert: anError messageText equals: Portfolio accountAlreadyInPortfolioError].! !

!PortfolioTest methodsFor: 'extra tests' stamp: 'FV 7/8/2021 18:25:55'!
test02CannotAddAnAccountAlreadyIncludedOnAnAddedPortfolio
	|aPortfolio anotherPortfolio anAccount|
	
	aPortfolio := Portfolio new.
	anotherPortfolio := Portfolio new.
	anAccount := ReceptiveAccount new.
	
	aPortfolio add: anotherPortfolio.
	anotherPortfolio add: anAccount.
	
	self should: [aPortfolio add: anAccount] 
		raise: Error - MessageNotUnderstood 
	withExceptionDo: [:anError | self assert: anError messageText equals: Portfolio accountAlreadyInPortfolioError].! !

!PortfolioTest methodsFor: 'extra tests' stamp: 'FV 7/8/2021 18:26:58'!
test03APortfolioCannotContainItself
	|aPortfolio |
	
	aPortfolio := Portfolio new.
	
	self should: [aPortfolio add: aPortfolio.] 
		raise: Error - MessageNotUnderstood 
	withExceptionDo: [:anError | self assert: anError messageText equals: Portfolio portfolioCannotContainItselfError].! !

!PortfolioTest methodsFor: 'extra tests' stamp: 'FV 7/8/2021 18:29:25'!
test04CannotAddAnAccountIfItsChildFromAFatherPortfolio
	|aPortfolioA aPortfolioB anAccount|
	
	aPortfolioA := Portfolio new.
	aPortfolioB := Portfolio new.
	anAccount  := ReceptiveAccount new.
	
	aPortfolioA add: aPortfolioB.
	aPortfolioA add: anAccount.
	
	
	
	self should: [aPortfolioB add: anAccount] 
		raise: Error - MessageNotUnderstood 
	withExceptionDo: [:anError | self assert: anError messageText equals: AccountType accountAlreadyInPortfolioError.].! !

!PortfolioTest methodsFor: 'extra tests' stamp: 'FV 7/8/2021 18:29:50'!
test05CannotAddAnAccountIfItsChildFromAFatherPortfolioWhenPortfolioHaveMultipleFathers
	|aPortfolioA aPortfolioB aPortfolioC  anAccount|
	
	aPortfolioA := Portfolio new.
	aPortfolioB := Portfolio new.
	aPortfolioC := Portfolio new.
	anAccount  := ReceptiveAccount new.
	
	aPortfolioA add: aPortfolioB.
	aPortfolioC add: aPortfolioB.
	aPortfolioA add: anAccount.
	
	
	
	self should: [aPortfolioB add: anAccount] 
		raise: Error - MessageNotUnderstood 
	withExceptionDo: [:anError | 
		self assert: anError messageText equals: AccountType accountAlreadyInPortfolioError.
		aPortfolioC add: anAccount.
		self assert: aPortfolioC includes: anAccount.
		].! !

!PortfolioTest methodsFor: 'extra tests' stamp: 'FV 7/8/2021 18:30:28'!
test06CannotAddAPortfolioToAnotherOneIfTheyShareAccounts
	|aPortfolio anotherPortfolio anAccountA anAccountB anAccountC|
	
	aPortfolio := Portfolio new.
	anotherPortfolio := Portfolio new.
	anAccountA := ReceptiveAccount new.
	anAccountB := ReceptiveAccount new.
	anAccountC := ReceptiveAccount new.
	
	aPortfolio add: anAccountA.
	aPortfolio add: anAccountB.
	
	anotherPortfolio add: anAccountB.
	anotherPortfolio add: anAccountC.
	
	
	
	self should: [aPortfolio add: anotherPortfolio] 
		raise: Error - MessageNotUnderstood 
	withExceptionDo: [:anError | self assert: anError messageText equals: Portfolio accountAlreadyInPortfolioError].! !


!PortfolioTest methodsFor: 'private' stamp: 'FV 7/8/2021 15:25:26'!
thePortfolio: aPortfolio balanceIs: anExpectedBalance
	self assert: aPortfolio balance equals: anExpectedBalance.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PortfolioTest class' category: 'ServiciosFinancieros-Ejercicio'!
PortfolioTest class
	instanceVariableNames: ''!

!PortfolioTest class methodsFor: 'as yet unclassified' stamp: 'FV 7/5/2021 20:59:51'!
new
	^self basicNew initialize.! !


!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'private' stamp: 'FV 7/8/2021 15:19:57'!
theAccount: anAccount balanceIs: anExpectedBalance
	self assert: anAccount balance equals: anExpectedBalance.! !


!ReceptiveAccountTest methodsFor: 'tests' stamp: 'FV 7/8/2021 15:21:25'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self theAccount: account balanceIs: 0 * peso.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'FV 7/8/2021 15:21:38'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 * peso on: account.
		
	self theAccount: account balanceIs: 100 * peso.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'FV 7/8/2021 15:21:47'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	Withdraw register: 50 * peso on: account.
		
	self theAccount: account balanceIs: 50 * peso.
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

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'FV 7/8/2021 15:22:46'!
test08TransferIncreasesBalanceOnReceiverAccountAndDecreasesOnSenderAccount
	|accountSender accountReceiver|
	
	accountSender := ReceptiveAccount new.
	Deposit register: 200 * peso on: accountSender.
	accountReceiver := ReceptiveAccount new.
	
	Transfer register: 50 * peso from: accountSender to: accountReceiver.
	
	self theAccount: accountSender balanceIs: 150 * peso.
	self theAccount: accountReceiver balanceIs: 50 * peso.! !

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


!classDefinition: #AccountType category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #AccountType
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountType methodsFor: 'main protocol' stamp: 'FV 7/8/2021 18:34:12'!
balance
	self subclassResponsibility.! !

!AccountType methodsFor: 'main protocol' stamp: 'FV 7/8/2021 18:34:44'!
hasRegistered: aTransaction
	self subclassResponsibility.! !

!AccountType methodsFor: 'main protocol' stamp: 'FV 7/8/2021 18:34:58'!
transactions
	self subclassResponsibility.! !


!AccountType methodsFor: 'private' stamp: 'FV 7/8/2021 16:18:04'!
includes: aNewAccount
	self subclassResponsibility.! !

!AccountType methodsFor: 'private' stamp: 'FV 7/8/2021 18:11:01'!
listOfAccounts
	self subclassResponsibility.! !

!AccountType methodsFor: 'private' stamp: 'FV 7/8/2021 17:14:54'!
nowBelongsTo: aFatherPortfolio
	^self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountType class' category: 'ServiciosFinancieros-Ejercicio'!
AccountType class
	instanceVariableNames: ''!

!AccountType class methodsFor: 'as yet unclassified' stamp: 'FV 7/8/2021 17:24:07'!
accountAlreadyInPortfolioError
	^ 'The account is already in the portfolio.'! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Ejercicio'!
AccountType subclass: #Portfolio
	instanceVariableNames: 'listOfAccounts fatherPortfolios'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Portfolio methodsFor: 'initialization' stamp: 'FV 7/8/2021 17:54:37'!
initialize
	
	listOfAccounts := OrderedCollection new.
	fatherPortfolios := OrderedCollection new.! !


!Portfolio methodsFor: 'private' stamp: 'FV 7/8/2021 18:05:00'!
accounts
	^listOfAccounts copy.! !

!Portfolio methodsFor: 'private' stamp: 'FV 7/8/2021 17:57:40'!
belongsToAPortfolio
	^ (fatherPortfolios size = 0) not.! !

!Portfolio methodsFor: 'private' stamp: 'FV 7/8/2021 18:32:17'!
fatherIncludes: aNewAccount	
	(self belongsToAPortfolio) ifFalse: [^self includes: aNewAccount ].
	^(fatherPortfolios anySatisfy: [:aFatherPortfolio | aFatherPortfolio fatherIncludes: aNewAccount]).
	! !

!Portfolio methodsFor: 'private' stamp: 'FV 7/8/2021 17:28:31'!
includes: aNewAccount	
	^ listOfAccounts anySatisfy: [:anAccount| anAccount includes: aNewAccount]! !

!Portfolio methodsFor: 'private' stamp: 'FV 7/8/2021 18:10:34'!
listOfAccounts
	^listOfAccounts copy.! !

!Portfolio methodsFor: 'private' stamp: 'FV 7/8/2021 17:54:19'!
nowBelongsTo: aFatherPortfolio
	fatherPortfolios add: aFatherPortfolio.! !


!Portfolio methodsFor: 'main protocol' stamp: 'FV 7/8/2021 18:09:19'!
add: aNewAccount
	
	(self = aNewAccount) ifTrue: [^self error: self class portfolioCannotContainItselfError ].
	((aNewAccount listOfAccounts) anySatisfy: [ :anAccount | (self fatherIncludes: anAccount) ]) ifTrue: [^self error: self class accountAlreadyInPortfolioError].
	
	
	
	listOfAccounts add: aNewAccount.
	aNewAccount nowBelongsTo: self.! !

!Portfolio methodsFor: 'main protocol' stamp: 'FV 7/5/2021 21:04:19'!
balance
	^ listOfAccounts sum: [:anAccount | anAccount balance] ifEmpty: [^0 * peso].
! !

!Portfolio methodsFor: 'main protocol' stamp: 'FV 7/5/2021 21:27:15'!
hasRegistered: aTransaction
	listOfAccounts detect: [:anAccount | anAccount hasRegistered: aTransaction] ifNone: [^false].
	^true.! !

!Portfolio methodsFor: 'main protocol' stamp: 'FV 7/7/2021 16:37:26'!
transactions
	|allTheTransactions|
	allTheTransactions := OrderedCollection new.
	listOfAccounts do: [:anAccount| allTheTransactions addAll: anAccount transactions].
	^allTheTransactions.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'ServiciosFinancieros-Ejercicio'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'Errors' stamp: 'FV 7/8/2021 16:26:55'!
portfolioCannotContainItselfError
	^'A portfolio cannot contain itself'.! !

!Portfolio class methodsFor: 'Errors' stamp: 'FV 7/8/2021 17:46:35'!
portfoliosCannotShareAccountsError
	^'There are accounts shared between the portfolios'! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio'!
AccountType subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'NR 10/17/2019 15:06:56'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'private' stamp: 'FV 7/8/2021 16:23:35'!
includes: aNewAccount
	^ self = aNewAccount.
	! !

!ReceptiveAccount methodsFor: 'private' stamp: 'FV 7/8/2021 18:12:07'!
listOfAccounts
	^OrderedCollection with: self.
! !

!ReceptiveAccount methodsFor: 'private' stamp: 'FV 7/8/2021 17:16:33'!
nowBelongsTo: aFatherPortfolio! !


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


!classDefinition: #Transfer category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Transfer
	instanceVariableNames: 'value depositPart withdrawPart'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Transfer methodsFor: 'as yet unclassified' stamp: 'FV 7/4/2021 20:16:02'!
depositPart
	^depositPart ! !

!Transfer methodsFor: 'as yet unclassified' stamp: 'FV 7/4/2021 18:36:32'!
value
	^ value.! !

!Transfer methodsFor: 'as yet unclassified' stamp: 'FV 7/4/2021 20:16:31'!
withdrawPart
	^withdrawPart! !


!Transfer methodsFor: 'initialization' stamp: 'FV 7/8/2021 15:11:35'!
initializeWith: anAmountOfMoney from: accountSender to: accountReceiver
	
	| aDepositPartOfTransfer  aWithdrawPartOfTransfer |
	
	
	aWithdrawPartOfTransfer := WithdrawPartOfTransfer newFromTransfer: self.
	aDepositPartOfTransfer := DepositPartOfTransfer newFromTransfer: self.
	accountSender register: aWithdrawPartOfTransfer.
	accountReceiver register: aDepositPartOfTransfer.
	
	value := anAmountOfMoney.
	depositPart := aDepositPartOfTransfer.
	withdrawPart := aWithdrawPartOfTransfer.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: 'ServiciosFinancieros-Ejercicio'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'as yet unclassified' stamp: 'FV 7/7/2021 17:43:14'!
register: anAmountOfMoney from: accountSender to: accountReceiver
	
	^self new initializeWith: anAmountOfMoney from: accountSender to: accountReceiver
	
	! !


!classDefinition: #TransferPart category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #TransferPart
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferPart methodsFor: 'as yet unclassified' stamp: 'FV 7/7/2021 17:31:32'!
counterpart
	self subclassResponsibility.! !

!TransferPart methodsFor: 'as yet unclassified' stamp: 'FV 7/7/2021 17:32:00'!
effectOnAccount
	self subclassResponsibility.! !

!TransferPart methodsFor: 'as yet unclassified' stamp: 'FV 7/7/2021 17:31:08'!
initializeFromTransfer: aTransfer
	transfer := aTransfer! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferPart class' category: 'ServiciosFinancieros-Ejercicio'!
TransferPart class
	instanceVariableNames: ''!

!TransferPart class methodsFor: 'as yet unclassified' stamp: 'FV 7/7/2021 17:33:05'!
newFromTransfer: aTransfer
	^self new initializeFromTransfer: aTransfer.! !


!classDefinition: #DepositPartOfTransfer category: 'ServiciosFinancieros-Ejercicio'!
TransferPart subclass: #DepositPartOfTransfer
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!DepositPartOfTransfer methodsFor: 'as yet unclassified' stamp: 'FV 7/4/2021 20:16:31'!
counterpart
	^ transfer withdrawPart.! !

!DepositPartOfTransfer methodsFor: 'as yet unclassified' stamp: 'FV 7/8/2021 15:11:54'!
effectOnAccount

	^transfer value! !


!classDefinition: #WithdrawPartOfTransfer category: 'ServiciosFinancieros-Ejercicio'!
TransferPart subclass: #WithdrawPartOfTransfer
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!WithdrawPartOfTransfer methodsFor: 'as yet unclassified' stamp: 'FV 7/4/2021 20:16:02'!
counterpart
	^transfer depositPart.! !

!WithdrawPartOfTransfer methodsFor: 'as yet unclassified' stamp: 'FV 7/4/2021 20:11:30'!
effectOnAccount

	^transfer value negated.! !
