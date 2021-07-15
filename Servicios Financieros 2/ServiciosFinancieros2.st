!classDefinition: #AccountSummaryTest category: 'ServiciosFinancieros2'!
TestCase subclass: #AccountSummaryTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros2'!

!AccountSummaryTest methodsFor: 'as yet unclassified' stamp: 'JP 7/14/2021 16:11:13'!
test01AccountSummaryBalanceIs0PesosOnEmptyAccount
	
	| anAccount expectedSummary summary |
	
	anAccount := ReceptiveAccount new.
	summary := (SummaryMaker for: anAccount) compute.
	
	expectedSummary := OrderedCollection with: 'Balance = 0 pesos'.
	
	self assert: summary equals: expectedSummary! !

!AccountSummaryTest methodsFor: 'as yet unclassified' stamp: 'JP 7/14/2021 16:10:58'!
test02DepositTransactionShowsOnSummary
	
	| anAccount expectedSummary summary |
	
	anAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: anAccount.
	summary := (SummaryMaker for: anAccount) compute.
	
	expectedSummary := OrderedCollection with: 'Depósito por 10 pesos' with: 'Balance = 10 pesos'.
	
	self assert: summary equals: expectedSummary! !

!AccountSummaryTest methodsFor: 'as yet unclassified' stamp: 'JP 7/14/2021 16:11:24'!
test03MultipleTransactionsShowOnSummary
	
	| anAccount expectedSummary summary |
	
	anAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: anAccount.
	Deposit register: 5 * peso on: anAccount.
	summary := (SummaryMaker for: anAccount) compute.
	
	expectedSummary := OrderedCollection with: 'Depósito por 10 pesos' with: 'Depósito por 5 pesos' with: 'Balance = 15 pesos'.
	
	self assert: summary equals: expectedSummary! !

!AccountSummaryTest methodsFor: 'as yet unclassified' stamp: 'JP 7/14/2021 16:11:33'!
test04WithdrawTransactionShowsOnSummary
	
	| anAccount expectedSummary summary |
	
	anAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: anAccount.
	Withdraw register: 5 * peso on: anAccount.
	summary := (SummaryMaker for: anAccount) compute.
	
	expectedSummary := OrderedCollection with: 'Depósito por 10 pesos' with: 'Extracción por 5 pesos' with: 'Balance = 5 pesos'.
	
	self assert: summary equals: expectedSummary! !

!AccountSummaryTest methodsFor: 'as yet unclassified' stamp: 'JP 7/14/2021 16:12:00'!
test05TransferDepositLegShowsOnSummary
	
	| anAccount anotherAccount expectedSummary summary |
	
	anAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: anAccount.
	
	anotherAccount := ReceptiveAccount new.
	Transfer amount: 5 * peso from: anAccount to: anotherAccount.
	summary := (SummaryMaker for: anotherAccount) compute.
	
	expectedSummary := OrderedCollection with: 'Entrada por transferencia de 5 pesos' with: 'Balance = 5 pesos'.
	
	self assert: summary equals: expectedSummary! !

!AccountSummaryTest methodsFor: 'as yet unclassified' stamp: 'JP 7/14/2021 16:14:12'!
test06TransferWithdrawLegShowsOnSummary
	
	| anAccount anotherAccount expectedSummary summary |
	
	anAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: anAccount.
	
	anotherAccount := ReceptiveAccount new.
	Transfer amount: 5 * peso from: anAccount to: anotherAccount.
	
	summary := (SummaryMaker for: anAccount) compute.
	
	expectedSummary := OrderedCollection with: 'Depósito por 10 pesos' with: 'Salida por transferencia de 5 pesos' with: 'Balance = 5 pesos'.
	 
	self assert: summary equals: expectedSummary! !

!AccountSummaryTest methodsFor: 'as yet unclassified' stamp: 'JP 7/14/2021 16:13:07'!
test07AccountSummaryBalanceIs0PesosOnEmptyPortfolio
	
	| aPortfolio expectedSummary summary |
	
	aPortfolio := Portfolio new.
	summary := (SummaryMaker for: aPortfolio) compute.

	expectedSummary := OrderedCollection with: 'Balance = 0 pesos'.
	 
	self assert: summary equals: expectedSummary! !

!AccountSummaryTest methodsFor: 'as yet unclassified' stamp: 'JP 7/14/2021 16:13:29'!
test08CanShowSummaryWithPortfolioWithASingleAccount
	
	| aPortfolio anAccount expectedSummary summary |
	
	anAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: anAccount.
	
	aPortfolio := Portfolio with: anAccount.
	summary := (SummaryMaker for: aPortfolio) compute.

	expectedSummary := OrderedCollection with: 'Depósito por 10 pesos' with: 'Balance = 10 pesos'.
	 
	self assert: summary equals: expectedSummary! !

!AccountSummaryTest methodsFor: 'as yet unclassified' stamp: 'JP 7/14/2021 16:13:41'!
test09SummaryShowsRecursivelyInPortfolioWithMultipleAccounts
	
	| aPortfolio anAccount anotherPortfolio anotherAccount expectedSummary summary |
	
	anAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: anAccount.
	
	anotherAccount := ReceptiveAccount new.
	Deposit register: 5 * peso on: anotherAccount.
	
	anotherPortfolio := Portfolio with: anotherAccount.
	
	aPortfolio := Portfolio with: anAccount with: anotherPortfolio.
	summary := (SummaryMaker for: aPortfolio) compute.
	
	expectedSummary := OrderedCollection with: 'Depósito por 10 pesos' with: 'Depósito por 5 pesos' with: 'Balance = 15 pesos'.
	 
	self assert: summary equals: expectedSummary! !


!classDefinition: #PortfolioDetailedTreePrinterTest category: 'ServiciosFinancieros2'!
TestCase subclass: #PortfolioDetailedTreePrinterTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros2'!

!PortfolioDetailedTreePrinterTest methodsFor: 'as yet unclassified' stamp: 'JP 7/15/2021 16:11:41'!
test01

	| aPortfolio expectedDetailedTree portfolioDetailedTree |
	
	aPortfolio := Portfolio named: 'Portfolio 1'.
	 
	portfolioDetailedTree := (PortfolioDetailedTreePrinter for: aPortfolio) compute.
	expectedDetailedTree := OrderedCollection with: 'Portfolio 1' with: '	Balance = 0 pesos'.
	
	self assert: portfolioDetailedTree equals: expectedDetailedTree! !

!PortfolioDetailedTreePrinterTest methodsFor: 'as yet unclassified' stamp: 'JP 7/15/2021 16:11:25'!
test02

	| aPortfolio expectedDetailedTree portfolioDetailedTree anAccount |
	
	anAccount := ReceptiveAccount named: 'Cuenta de Lucho'. 
	aPortfolio := Portfolio named: 'Portfolio 1' with: anAccount.
	
	
	portfolioDetailedTree := (PortfolioDetailedTreePrinter for: aPortfolio) compute.
	expectedDetailedTree := OrderedCollection with: 'Portfolio 1' with: '	Cuenta de Lucho' with: '		Balance = 0 pesos' with: '	Balance = 0 pesos'.
	
	self assert: portfolioDetailedTree equals: expectedDetailedTree! !

!PortfolioDetailedTreePrinterTest methodsFor: 'as yet unclassified' stamp: 'JP 7/15/2021 16:12:34'!
test03

	| aPortfolio expectedDetailedTree portfolioDetailedTree anAccount |
	
	anAccount := ReceptiveAccount named: 'Cuenta de Lucho'. 
	aPortfolio := Portfolio named: 'Portfolio de Algo3' with: anAccount.
	
	Deposit register: 10 * peso on: anAccount.
	
	portfolioDetailedTree := (PortfolioDetailedTreePrinter for: aPortfolio) compute.
	expectedDetailedTree := OrderedCollection with: 'Portfolio de Algo3' with: '	Cuenta de Lucho' with: '		Depósito por 10 pesos' with: '		Balance = 10 pesos' with: '	Balance = 10 pesos'.
	
	self assert: portfolioDetailedTree equals: expectedDetailedTree! !

!PortfolioDetailedTreePrinterTest methodsFor: 'as yet unclassified' stamp: 'JP 7/15/2021 16:22:21'!
test04

	| aPortfolio expectedDetailedTree portfolioDetailedTree anAccount anotherAccount |
	
	anAccount := ReceptiveAccount named: 'Cuenta de Lucho'. 
	anotherAccount := ReceptiveAccount named: 'Cuenta de Juan'. 
	aPortfolio := Portfolio named: 'Portfolio de Algo3' with: anAccount with: anotherAccount.
	
	Deposit register: 10 * peso on: anAccount.
	Transfer amount: 5 * peso from: anAccount to: anotherAccount.
	
	portfolioDetailedTree := (PortfolioDetailedTreePrinter for: aPortfolio) compute.
	expectedDetailedTree := OrderedCollection new.
	
	expectedDetailedTree add: 'Portfolio de Algo3'.
	expectedDetailedTree add: '	Cuenta de Lucho'.
	expectedDetailedTree add: '		Depósito por 10 pesos'.
	expectedDetailedTree add: '		Salida por transferencia de 5 pesos'.
	expectedDetailedTree add: '		Balance = 5 pesos'.
	expectedDetailedTree add: '	Cuenta de Juan'.
	expectedDetailedTree add: '		Entrada por transferencia de 5 pesos'.
	expectedDetailedTree add: '		Balance = 5 pesos'.
	expectedDetailedTree add: '	Balance = 10 pesos'.
	
	self assert: portfolioDetailedTree equals: expectedDetailedTree! !

!PortfolioDetailedTreePrinterTest methodsFor: 'as yet unclassified' stamp: 'JP 7/15/2021 16:32:12'!
test05

	| aPortfolio expectedDetailedTree portfolioDetailedTree anAccount anotherAccount anotherPortfolio |
	
	anAccount := ReceptiveAccount named: 'Cuenta de Lucho'. 
	anotherAccount := ReceptiveAccount named: 'Cuenta de Juan'.
	anotherPortfolio := Portfolio named: 'Portfolio de Juan' with: anotherAccount.
	
	aPortfolio := Portfolio named: 'Portfolio de Algo3' with: anAccount with: anotherPortfolio.
	
	Deposit register: 10 * peso on: anAccount.
	Transfer amount: 5 * peso from: anAccount to: anotherAccount.
	
	portfolioDetailedTree := (PortfolioDetailedTreePrinter for: aPortfolio) compute.
	expectedDetailedTree := OrderedCollection new.
	
	expectedDetailedTree add: 'Portfolio de Algo3'.
	expectedDetailedTree add: '	Cuenta de Lucho'.
	expectedDetailedTree add: '		Depósito por 10 pesos'.
	expectedDetailedTree add: '		Salida por transferencia de 5 pesos'.
	expectedDetailedTree add: '		Balance = 5 pesos'.
	expectedDetailedTree add: '	Portfolio de Juan'.
	expectedDetailedTree add: '		Cuenta de Juan'.
	expectedDetailedTree add: '			Entrada por transferencia de 5 pesos'.
	expectedDetailedTree add: '			Balance = 5 pesos'.
	expectedDetailedTree add: '		Balance = 5 pesos'.
	expectedDetailedTree add: '	Balance = 10 pesos'.
	
	self assert: portfolioDetailedTree equals: expectedDetailedTree! !


!classDefinition: #PortfolioTest category: 'ServiciosFinancieros2'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros2'!

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:16:26'!
test01BalanceOfPortfolioWithoutAccountsIsZero

	self assert: 0 equals: Portfolio new balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'JP 7/9/2021 19:00:18'!
test02BalanceOfPortfolioWithOneAccountIsAccountBalance

	| account portfolio |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	portfolio := Portfolio with: account.
	
	self assert: account balance equals: portfolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:06'!
test03BalanceOfPortfolioIsCalculatedRecursivelyOnPortfolios

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortofolio |
	
	simplePortfolioAccount := ReceptiveAccount new.
	Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortofolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolioAccount balance + simplePortfolio balance) equals: composedPortofolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:12'!
test04PortfolioWithoutAccountsHasNoRegisteredTransaction

	self deny: (Portfolio new hasRegistered: (Deposit for: 100 * peso))! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:18'!
test05PortfolioHasRegisteredItsAccountsTransactions

	| account portfolio deposit |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	portfolio := Portfolio with: account.
	
	self assert: (portfolio hasRegistered: deposit)! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:26'!
test06PortfolioLooksForRegisteredTransactionsRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolio hasRegistered: simplePortfolioAccountDeposit).
	self assert: (composedPortfolio hasRegistered: composedPortfolioAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:10'!
test07PortfolioHasNoTransactionWhenHasNoAccounts

	self assert: Portfolio new transactions isEmpty! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:28:08'!
test08PortfolioTransactionsIncludesAllItsAccountsTransactions

	| account portfolio accountDeposit portfolioTransactions anotherAccountWithdraw |
	
	account := ReceptiveAccount new.
	accountDeposit := Deposit register: 100 * peso on: account.
	anotherAccountWithdraw := Withdraw register: 100 * peso on: account.
	portfolio := Portfolio with: account.
	
	portfolioTransactions := portfolio transactions.
	
	self assert: 2 equals: portfolioTransactions size.
	self assert: (portfolioTransactions includes: accountDeposit).
	self assert: (portfolioTransactions includes: anotherAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:28:20'!
test09PortfolioTransactionsAreCalculatedRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit composedPortfolioTransactions |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	composedPortfolioTransactions := composedPortfolio transactions.
	self assert: 2 equals: composedPortfolioTransactions size.
	self assert: (composedPortfolioTransactions includes: simplePortfolioAccountDeposit).
	self assert: (composedPortfolioTransactions includes: composedPortfolioAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:24'!
test10PortfolioCanNotIncludeTheSameAccountMoreThanOnce

	| account portfolio |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio with: account.
	
	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: portfolio accountsSize.
			self assert: (portfolio accountsIncludes: account) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:28'!
test11PortfolioCanNotIncludeAccountOfItsPortfolios

	| account simplePortfolio composedPortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio with: account.
	composedPortfolio := Portfolio with: simplePortfolio.
	
	self 
		should: [ composedPortfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: composedPortfolio accountsSize.
			self assert: (composedPortfolio accountsIncludes: simplePortfolio) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:32'!
test12PortfolioCanNotIncludeItself

	| account simplePortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio with: account.
	
	self 
		should: [ simplePortfolio add: simplePortfolio ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: simplePortfolio accountsSize.
			self assert: (simplePortfolio accountsIncludes: account) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 12:01:51'!
test13ComposedPortfolioCanNotHaveParentPortfolioAccount

	| account simplePortfolio composedPortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio new.
	composedPortfolio := Portfolio with: simplePortfolio.
	composedPortfolio add: account.
	
	self 
		should: [ simplePortfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: simplePortfolio accountsIsEmpty ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 12:12:16'!
test14ComposedPortfolioCanNotHaveAccountOfAnyRootParentRecursively

	| account leftParentPortfolio leftRootParentPortfolio portfolio rightParentPortfolio rightRootParentPortfolio |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio new.
	leftParentPortfolio := Portfolio with: portfolio .
	leftRootParentPortfolio := Portfolio with: leftParentPortfolio.
	leftRootParentPortfolio add: account.
	
	rightParentPortfolio := Portfolio with: portfolio .
	rightRootParentPortfolio := Portfolio with: rightParentPortfolio.
	rightRootParentPortfolio add: account.

	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: portfolio accountsIsEmpty ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/29/2019 16:31:18'!
test15PortfolioCanNotIncludeAnyOfTheComposedAccountOfPortfolioToAdd

	| portfolioToAdd portfolioToModify rootPortfolio sharedAccount |
	
	sharedAccount := ReceptiveAccount new.
	portfolioToModify := Portfolio new.
	rootPortfolio := Portfolio with: sharedAccount with: portfolioToModify.
	portfolioToAdd := Portfolio with: sharedAccount.
	
	self 
		should: [ portfolioToModify add: portfolioToAdd ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | 
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: portfolioToModify accountsIsEmpty ]! !


!classDefinition: #PortfolioTreePrinterTest category: 'ServiciosFinancieros2'!
TestCase subclass: #PortfolioTreePrinterTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros2'!

!PortfolioTreePrinterTest methodsFor: 'as yet unclassified' stamp: 'JP 7/15/2021 14:53:08'!
test01PortfolioTreeOfAnEmptyPortfolioOnlyShowsItsName

	| aPortfolio expectedTree portfolioTree |
	
	aPortfolio := Portfolio named: 'Portfolio 1'.
	 
	portfolioTree := (PortfolioTreePrinter for: aPortfolio) compute.
	expectedTree := OrderedCollection with: 'Portfolio 1'.
	
	self assert: portfolioTree equals: expectedTree! !

!PortfolioTreePrinterTest methodsFor: 'as yet unclassified' stamp: 'JP 7/15/2021 14:53:46'!
test02PortfolioTreeCanShowTreeOfPortfolioWithOneAccount

	| aPortfolio anAccount expectedTree portfolioTree |
	
	anAccount := ReceptiveAccount named: 'Cuenta de Lucho'.
	aPortfolio := Portfolio named: 'Portfolio 1' with: anAccount.
	
	portfolioTree := (PortfolioTreePrinter for: aPortfolio) compute.
	
	expectedTree := OrderedCollection with: 'Portfolio 1' with: '	Cuenta de Lucho'.
	
	self assert: portfolioTree equals: expectedTree! !

!PortfolioTreePrinterTest methodsFor: 'as yet unclassified' stamp: 'JP 7/15/2021 14:55:14'!
test03PortfolioTreeShowsTreeRecursivelyOfPortfolioWithMultipleAccounts

	| aPortfolio anotherPortfolio anAccount anotherAccount aThirdAccount expectedTree portfolioTree |
	
	anAccount := ReceptiveAccount named: 'Cuenta de Lucho'.
	anotherAccount := ReceptiveAccount named: 'Cuenta de Juan'.
	aThirdAccount := ReceptiveAccount named: 'Cuenta de Serge'.
	
	anotherPortfolio := Portfolio named: 'Portfolio de Ayudantes' with: anotherAccount with: aThirdAccount.
	
	aPortfolio := Portfolio named: 'Portfolio de Algo3' with: anAccount with: anotherPortfolio.
	
	portfolioTree := (PortfolioTreePrinter for: aPortfolio) compute.
	
	expectedTree := OrderedCollection with: 'Portfolio de Algo3' with: '	Cuenta de Lucho' with: '	Portfolio de Ayudantes' with: '		Cuenta de Juan' with: '		Cuenta de Serge'.
	
	self assert: portfolioTree equals: expectedTree! !

!PortfolioTreePrinterTest methodsFor: 'as yet unclassified' stamp: 'JP 7/15/2021 14:56:12'!
test04MultipleCallsOnPortfolioTreePrinterReturnsTheSameReport

	| aPortfolio anotherPortfolio anAccount anotherAccount aThirdAccount expectedTree portfolioTree portfolioTreePrinter|
	
	anAccount := ReceptiveAccount named: 'Cuenta de Lucho'.
	anotherAccount := ReceptiveAccount named: 'Cuenta de Juan'.
	aThirdAccount := ReceptiveAccount named: 'Cuenta de Serge'.
	
	anotherPortfolio := Portfolio named: 'Portfolio de Ayudantes' with: anotherAccount with: aThirdAccount.
	
	aPortfolio := Portfolio named: 'Portfolio de Algo3' with: anAccount with: anotherPortfolio.
	
	portfolioTreePrinter := (PortfolioTreePrinter for: aPortfolio).
	
	expectedTree := OrderedCollection with: 'Portfolio de Algo3' with: '	Cuenta de Lucho' with: '	Portfolio de Ayudantes' with: '		Cuenta de Juan' with: '		Cuenta de Serge'.
	
	portfolioTree := portfolioTreePrinter compute.
	portfolioTree := portfolioTreePrinter compute.
	
	self assert: portfolioTree equals: expectedTree! !


!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros2'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros2'!

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

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'JP 7/9/2021 19:08:23'!
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


!classDefinition: #TransferNetTest category: 'ServiciosFinancieros2'!
TestCase subclass: #TransferNetTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros2'!

!TransferNetTest methodsFor: 'as yet unclassified' stamp: 'JP 7/14/2021 16:15:43'!
test01AccountSummaryTransferNetIs0PesosOnEmptyAccount

	| anAccount transferNet |
	anAccount := ReceptiveAccount new.
	transferNet := (TransferNetCalculator for: anAccount) compute.
	
	self assert: transferNet equals: 0 * peso.! !

!TransferNetTest methodsFor: 'as yet unclassified' stamp: 'JP 7/14/2021 16:16:46'!
test02BothAccountsOfTransferHaveOppositeTransferNet

	| anAccount anotherAccount transferNetAnAccount transferNetAnotherAccount |
	anAccount := ReceptiveAccount new.
	
	anotherAccount := ReceptiveAccount new.
	
	Transfer amount: 5 * peso from: anotherAccount to: anAccount.
	
	transferNetAnAccount := (TransferNetCalculator for: anAccount) compute.
	transferNetAnotherAccount := (TransferNetCalculator for: anotherAccount) compute.
	
	self assert: transferNetAnAccount equals: 5 * peso.
	self assert: transferNetAnotherAccount equals: -5 * peso.! !

!TransferNetTest methodsFor: 'as yet unclassified' stamp: 'JP 7/14/2021 16:17:31'!
test03TransferNetIgnoresAnyNonTransferTransactions

	| anAccount anotherAccount transferNetAnAccount transferNetAnotherAccount |
	anAccount := ReceptiveAccount new.
	Deposit register: 5 * peso on: anAccount.
	
	anotherAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: anotherAccount.
	Withdraw register: 2 * peso on: anotherAccount.
	
	Transfer amount: 5 * peso from: anotherAccount to: anAccount.
	Transfer amount: 2 * peso from: anAccount to: anotherAccount.
	
	transferNetAnAccount := (TransferNetCalculator for: anAccount) compute.
	transferNetAnotherAccount := (TransferNetCalculator for: anotherAccount) compute.
	
	self assert: transferNetAnAccount equals: 3 * peso.
	self assert: transferNetAnotherAccount equals: -3 * peso.! !

!TransferNetTest methodsFor: 'as yet unclassified' stamp: 'JP 7/14/2021 16:17:47'!
test04EmptyPortfolioTransferNetIs0Peso

	| aPortfolio  transferNet |
	
	aPortfolio := Portfolio new.
	 
	transferNet := (TransferNetCalculator for: aPortfolio) compute.
	
	self assert: transferNet equals: 0 * peso
	! !

!TransferNetTest methodsFor: 'as yet unclassified' stamp: 'JP 7/14/2021 16:18:00'!
test05CanShowTransferNetWithPortfolioWithASingleAccount

	| aPortfolio anAccount anotherAccount transferNet |
	
	anAccount := ReceptiveAccount new.
	anotherAccount := ReceptiveAccount new.
	
	aPortfolio := Portfolio with: anAccount.
	
	Transfer amount: 10 * peso from: anotherAccount to: anAccount.
	
	transferNet := (TransferNetCalculator for: aPortfolio) compute.
	
	self assert: transferNet equals: 10 * peso.! !

!TransferNetTest methodsFor: 'as yet unclassified' stamp: 'JP 7/14/2021 16:18:19'!
test06TransferNetCalculatesRecursivelyInPortfolioWithMultipleAccounts

	| aPortfolio anAccount anotherPortfolio anotherAccount outsidePortfolioAccount transferNet |
	
	anAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: anAccount.
	
	anotherAccount := ReceptiveAccount new.
	Deposit register: 5 * peso on: anotherAccount.
	
	anotherPortfolio := Portfolio with: anotherAccount.
	
	aPortfolio := Portfolio with: anAccount with: anotherPortfolio.
	
	outsidePortfolioAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: anAccount.
	
	Transfer amount: 5 * peso from: anAccount to: anotherAccount.
	Transfer amount: 2 * peso from: outsidePortfolioAccount to: anotherAccount.
	transferNet := (TransferNetCalculator for: aPortfolio) compute.
	 
	self assert: transferNet equals: 2 * peso.! !


!classDefinition: #TransferTest category: 'ServiciosFinancieros2'!
TestCase subclass: #TransferTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros2'!

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 21:07:03'!
test01ATransferDecreasesBalanceFromOriginAccountAndIncreasesItForDestinationAccount

	| destinationAccount originAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: 8 * peso equals: originAccount balance.
	self assert: 12 * peso equals: destinationAccount balance.! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 21:12:28'!
test02ATransferKnowsItsValue

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: 2 * peso equals: transfer value.! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 23:01:44'!
test03DepositLegKnowsItsWithdrawCounterpart

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: transfer withdrawLeg equals: transfer depositLeg withdrawLeg! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 23:01:51'!
test04WithdrawLegKnowsItsDepositCounterpart

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: transfer depositLeg equals: transfer withdrawLeg depositLeg! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 23:02:36'!
test05OriginAndDestinationAccountsCannotBeTheSame

	| originAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	self should: [ Transfer amount: 2 * peso from: originAccount to: originAccount ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Transfer cannotTransferToOriginErrorDescription equals: anError messageText.
			self assert: 10 * peso equals: originAccount balance.
		]
! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 23:02:44'!
test06CannotTransferAZeroAmount

	| originAccount destinationAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 5 * peso on: destinationAccount.
	
	self should: [ Transfer amount: 0 from: originAccount to: destinationAccount ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Transfer cannotTransferZeroErrorDescription equals: anError messageText.
			self assert: 10 * peso equals: originAccount balance.
		]
! !


!classDefinition: #Account category: 'ServiciosFinancieros2'!
Object subclass: #Account
	instanceVariableNames: 'name'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros2'!

!Account methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 12:23:40'!
balance

	self subclassResponsibility ! !

!Account methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 12:23:47'!
hasRegistered: aTransaction

	self subclassResponsibility ! !

!Account methodsFor: 'main protocol' stamp: 'JP 7/14/2021 17:42:05'!
name

	^name! !

!Account methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 12:23:15'!
transactions

	self subclassResponsibility ! !


!Account methodsFor: 'composition' stamp: 'LL 7/8/2021 21:45:50'!
addedTo: aPortfolio

	self subclassResponsibility! !

!Account methodsFor: 'composition' stamp: 'LL 7/8/2021 21:46:48'!
isComposedBy: anAccount

	self subclassResponsibility! !


!Account methodsFor: 'private' stamp: 'HAW 5/25/2019 12:23:27'!
addTransactionsTo: aCollectionOfTransactions

	self subclassResponsibility ! !

!Account methodsFor: 'private' stamp: 'JP 7/15/2021 15:09:50'!
beAddedTo: aReport

	self subclassResponsibility ! !


!Account methodsFor: 'initialization' stamp: 'JP 7/14/2021 17:02:54'!
initializeWithName: aName

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Account class' category: 'ServiciosFinancieros2'!
Account class
	instanceVariableNames: ''!

!Account class methodsFor: 'as yet unclassified' stamp: 'JP 7/14/2021 17:07:58'!
named: aName
	
	"Si bien ambos accounts responden este mismo mensaje igual, creemos que subirlo a esta clase seria dañino para la legibilidad del codigo, ya que account es una clase abstracta de la cual no se deberia poder instanciar directamente"
	
	self subclassResponsibility! !

!Account class methodsFor: 'as yet unclassified' stamp: 'JP 7/14/2021 17:04:23'!
new

	self subclassResponsibility! !

!Account class methodsFor: 'as yet unclassified' stamp: 'JP 7/14/2021 16:51:56'!
noNameAccount

	^'Nameless Account'! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros2'!
Account subclass: #Portfolio
	instanceVariableNames: 'accounts parents'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros2'!

!Portfolio methodsFor: 'initialization' stamp: 'JP 7/14/2021 16:47:15'!
initializeWithName: aName

	accounts := OrderedCollection new.
	parents := OrderedCollection new.
	name := aName! !


!Portfolio methodsFor: 'main protocol' stamp: 'JP 7/9/2021 20:07:57'!
balance
	
	^accounts sum: [ :anAccount | anAccount balance ] ifEmpty: [ 0 * peso]! !

!Portfolio methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 11:28:29'!
hasRegistered: aTransaction

	^accounts anySatisfy: [ :anAccount | anAccount hasRegistered: aTransaction ]! !

!Portfolio methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 11:38:32'!
transactions
	
	| transactions |
	
	transactions := OrderedCollection new.
	accounts do: [ :anAccount | anAccount addTransactionsTo: transactions ].
	
	^transactions ! !


!Portfolio methodsFor: 'accounts management' stamp: 'JP 7/14/2021 17:31:17'!
accounts

	^accounts copy! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 11:49:20'!
accountsIncludes: anAccount

	^accounts includes: anAccount ! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:05:04'!
accountsIsEmpty
	
	^accounts isEmpty ! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 11:49:06'!
accountsSize
	
	^accounts size! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:19:20'!
add: accountToAdd

	self assertCanAdd: accountToAdd.
		
	accounts add: accountToAdd.
	accountToAdd addedTo: self 
	! !


!Portfolio methodsFor: 'private' stamp: 'HAW 5/25/2019 11:42:55'!
addTransactionsTo: aCollectionOfTransactions

	accounts do: [ :anAccount | anAccount addTransactionsTo: aCollectionOfTransactions ]! !

!Portfolio methodsFor: 'private' stamp: 'JP 7/15/2021 15:12:08'!
beAddedTo: aReport

	aReport addPortfolio: self.! !


!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:17:31'!
addRootParentsTo: rootParents

	parents 
		ifEmpty: [ rootParents add: self ] 
		ifNotEmpty: [ parents do: [ :aParent | aParent addRootParentsTo: rootParents ]]! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:02:59'!
addedTo: aPortfolio 
	
	parents add: aPortfolio ! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:20:56'!
anyRootParentIsComposedBy: accountToAdd

	^self rootParents anySatisfy: [ :aParent | aParent isComposedBy: accountToAdd]! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:20:36'!
assertCanAdd: accountToAdd

	(self anyRootParentIsComposedBy: accountToAdd) ifTrue: [ self signalCanNotAddAccount ].
! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/29/2019 16:24:54'!
isComposedBy: anAccount

	^ self = anAccount or: [ accounts anySatisfy: [ :composedAccount | (composedAccount isComposedBy: anAccount) or: [ anAccount isComposedBy: composedAccount ]]]! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:17:31'!
rootParents
	
	| rootParents |
	
	rootParents := Set new.
	self addRootParentsTo: rootParents.
	
	^ rootParents! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 11:48:34'!
signalCanNotAddAccount
	
	self error: self class canNotAddAccountErrorMessage! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'ServiciosFinancieros2'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'HAW 5/25/2019 11:48:55'!
canNotAddAccountErrorMessage
	
	^'Can not add repeated account to a portfolio'! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'JP 7/14/2021 17:04:05'!
named: aName

	^self new initializeWithName: aName! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'JP 7/14/2021 17:09:37'!
named: aName with: anAccount

	^(self named: aName) 
		add: anAccount;
		yourself! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'JP 7/14/2021 17:40:06'!
named: aName with: anAccount with: anotherAccount

	^(self named: aName)
		add: anAccount;
		add: anotherAccount;
		yourself! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'JP 7/14/2021 16:53:50'!
new 

	^self basicNew initializeWithName: self noNameAccount! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'HAW 5/25/2019 11:18:21'!
with: anAccount

	^self new 
		add: anAccount;
		yourself! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'HAW 5/25/2019 11:23:59'!
with: anAccount with: anotherAccount

	^self new 
		add: anAccount;
		add: anotherAccount;
		yourself! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros2'!
Account subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros2'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'JP 7/14/2021 16:49:49'!
initializeWithName: aName

	transactions := OrderedCollection new.
	name := aName ! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'JP 7/9/2021 19:22:18'!
balance

	^transactions 
		inject: 0 * peso
		into: [ :currentBalance :transaction | transaction affectBalance: currentBalance ]! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'NR 10/21/2019 18:55:56'!
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


!ReceptiveAccount methodsFor: 'private' stamp: 'HAW 5/25/2019 11:38:52'!
addTransactionsTo: aCollectionOfTransactions

	aCollectionOfTransactions addAll: transactions ! !

!ReceptiveAccount methodsFor: 'private' stamp: 'JP 7/15/2021 15:12:18'!
beAddedTo: aReport

	aReport addReceptiveAccount: self.! !


!ReceptiveAccount methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:03:32'!
addedTo: aPortfolio 
	
	! !

!ReceptiveAccount methodsFor: 'composition' stamp: 'HAW 5/25/2019 11:54:51'!
isComposedBy: anAccount

	^self = anAccount ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ReceptiveAccount class' category: 'ServiciosFinancieros2'!
ReceptiveAccount class
	instanceVariableNames: ''!

!ReceptiveAccount class methodsFor: 'as yet unclassified' stamp: 'JP 7/14/2021 17:04:09'!
named: aName

	^self new initializeWithName: aName! !

!ReceptiveAccount class methodsFor: 'as yet unclassified' stamp: 'JP 7/14/2021 16:52:13'!
new

	^(self basicNew) initializeWithName: self noNameAccount! !


!classDefinition: #AccountReport category: 'ServiciosFinancieros2'!
Object subclass: #AccountReport
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros2'!

!AccountReport methodsFor: 'initialization' stamp: 'JP 7/15/2021 17:10:05'!
initializeFor: anAccount

	self subclassResponsibility ! !


!AccountReport methodsFor: 'Public' stamp: 'JP 7/15/2021 17:29:50'!
compute 

	self subclassResponsibility ! !


!AccountReport methodsFor: 'Private' stamp: 'JP 7/15/2021 17:08:16'!
addPortfolio: aPortfolio

	self subclassResponsibility ! !

!AccountReport methodsFor: 'Private' stamp: 'JP 7/15/2021 17:08:04'!
addReceptiveAccount: aReceptiveAccount

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountReport class' category: 'ServiciosFinancieros2'!
AccountReport class
	instanceVariableNames: ''!

!AccountReport class methodsFor: 'as yet unclassified' stamp: 'JP 7/15/2021 17:10:25'!
for: anAccount
	^self new initializeFor: anAccount! !


!classDefinition: #PortfolioTreeReport category: 'ServiciosFinancieros2'!
AccountReport subclass: #PortfolioTreeReport
	instanceVariableNames: 'portfolio report currentIndentation'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros2'!

!PortfolioTreeReport methodsFor: 'initialization' stamp: 'JP 7/15/2021 17:28:08'!
initializeFor: anAccount
	
	portfolio := anAccount.
	report := OrderedCollection new.
	currentIndentation := ''! !


!PortfolioTreeReport methodsFor: 'Public' stamp: 'JP 7/15/2021 17:27:59'!
compute
	
	report := OrderedCollection new.
	currentIndentation := ''.
	
	self addPortfolio: portfolio.
	^report copy! !


!PortfolioTreeReport methodsFor: 'Private' stamp: 'JP 7/15/2021 17:27:51'!
addIndentation

	currentIndentation := currentIndentation , '	'.! !

!PortfolioTreeReport methodsFor: 'Private' stamp: 'JP 7/15/2021 17:27:33'!
addPortfolio: aPortfolio

	self subclassResponsibility ! !

!PortfolioTreeReport methodsFor: 'Private' stamp: 'JP 7/15/2021 17:27:43'!
addReceptiveAccount: aReceptiveAccount

	self subclassResponsibility ! !

!PortfolioTreeReport methodsFor: 'Private' stamp: 'JP 7/15/2021 17:41:19'!
addSentenceToReport: aSentence

	report add: (currentIndentation , aSentence).! !

!PortfolioTreeReport methodsFor: 'Private' stamp: 'JP 7/15/2021 17:28:17'!
revertIndentation
	
	currentIndentation := currentIndentation copyFrom: 1 to: (currentIndentation size - 1).! !


!classDefinition: #PortfolioDetailedTreePrinter category: 'ServiciosFinancieros2'!
PortfolioTreeReport subclass: #PortfolioDetailedTreePrinter
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros2'!

!PortfolioDetailedTreePrinter methodsFor: 'Private' stamp: 'JP 7/15/2021 17:42:13'!
addPortfolio: aPortfolio
	
	self addSentenceToReport: aPortfolio name.

	self addIndentation.
	
	aPortfolio accounts do: [:anAccount | anAccount beAddedTo: self.].
	
	self addSentenceToReport: 'Balance = ' , aPortfolio balance asString.
	
	self revertIndentation.! !

!PortfolioDetailedTreePrinter methodsFor: 'Private' stamp: 'JP 7/15/2021 17:44:45'!
addReceptiveAccount: aReceptiveAccount

	self addSentenceToReport: aReceptiveAccount name.
	
	self addIndentation.
	
	self addSummaryToReportFrom: aReceptiveAccount.
	
	self revertIndentation.! !

!PortfolioDetailedTreePrinter methodsFor: 'Private' stamp: 'JP 7/15/2021 17:44:27'!
addSummaryToReportFrom: anAccount

	| summary |
	summary := (SummaryMaker for: anAccount) compute.
	report addAll: (summary collect: [:aTransactionSentence | currentIndentation , aTransactionSentence]).! !


!classDefinition: #PortfolioTreePrinter category: 'ServiciosFinancieros2'!
PortfolioTreeReport subclass: #PortfolioTreePrinter
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros2'!

!PortfolioTreePrinter methodsFor: 'Private' stamp: 'JP 7/15/2021 17:45:14'!
addPortfolio: aPortfolio
	
	self addSentenceToReport: aPortfolio name.
	
	self addIndentation.
	
	aPortfolio accounts do: [:anAccount | anAccount beAddedTo: self.].
	
	self revertIndentation.! !

!PortfolioTreePrinter methodsFor: 'Private' stamp: 'JP 7/15/2021 17:45:31'!
addReceptiveAccount: aReceptiveAccount
	
	self addSentenceToReport: aReceptiveAccount name.! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros2'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros2'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:39'!
affectBalance: aBalance

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'Private' stamp: 'JP 7/12/2021 21:00:44'!
beAddedTo: aReport

	self subclassResponsibility ! !


!classDefinition: #Deposit category: 'ServiciosFinancieros2'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros2'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !


!Deposit methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:02'!
affectBalance: aBalance

	^aBalance + value ! !


!Deposit methodsFor: 'Private' stamp: 'JP 7/12/2021 21:14:31'!
beAddedTo: aReport

	^aReport addDeposit: self! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros2'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!Deposit class methodsFor: 'as yet unclassified' stamp: 'LL 7/8/2021 21:45:00'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #TransferLeg category: 'ServiciosFinancieros2'!
AccountTransaction subclass: #TransferLeg
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros2'!

!TransferLeg methodsFor: 'value' stamp: 'LL 9/20/2020 22:27:32'!
value

	^transfer value! !


!TransferLeg methodsFor: 'initialization' stamp: 'LL 9/20/2020 22:28:14'!
initializeWith: aTransfer

	transfer := aTransfer! !


!TransferLeg methodsFor: 'Private' stamp: 'JP 7/12/2021 21:00:43'!
beAddedTo: aReport

	self subclassResponsibility ! !


!TransferLeg methodsFor: 'balance' stamp: 'JP 7/12/2021 21:28:19'!
affectBalance: aBalance

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferLeg class' category: 'ServiciosFinancieros2'!
TransferLeg class
	instanceVariableNames: ''!

!TransferLeg class methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 22:45:01'!
of: aTransfer on: anAccount

	| transaction |
	
	transaction := self new initializeWith: 	aTransfer.
	anAccount register: transaction.	
	
	^transaction! !


!classDefinition: #TransferDepositLeg category: 'ServiciosFinancieros2'!
TransferLeg subclass: #TransferDepositLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros2'!

!TransferDepositLeg methodsFor: 'accessing' stamp: 'LL 9/20/2020 22:26:10'!
withdrawLeg

	^transfer withdrawLeg! !


!TransferDepositLeg methodsFor: 'balance' stamp: 'LL 9/20/2020 22:27:49'!
affectBalance: aBalance

	^aBalance + self value! !


!TransferDepositLeg methodsFor: 'Private' stamp: 'JP 7/12/2021 21:14:37'!
beAddedTo: aReport

	^aReport addTransferDepositLeg: self! !


!classDefinition: #TransferWithdrawLeg category: 'ServiciosFinancieros2'!
TransferLeg subclass: #TransferWithdrawLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros2'!

!TransferWithdrawLeg methodsFor: 'accessing' stamp: 'LL 9/20/2020 22:25:47'!
depositLeg

	^transfer depositLeg! !


!TransferWithdrawLeg methodsFor: 'balance' stamp: 'LL 9/20/2020 22:27:55'!
affectBalance: aBalance

	^aBalance - self value! !


!TransferWithdrawLeg methodsFor: 'Private' stamp: 'JP 7/12/2021 21:14:41'!
beAddedTo: aReport

	^aReport addTransferWithdrawLeg: self! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros2'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros2'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !


!Withdraw methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:15'!
affectBalance: aBalance

	^aBalance - value! !


!Withdraw methodsFor: 'Private' stamp: 'JP 7/12/2021 21:14:44'!
beAddedTo: aReport

	^aReport addWithdraw: self! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros2'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!Withdraw class methodsFor: 'as yet unclassified' stamp: 'LL 7/8/2021 21:45:05'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #TransactionReport category: 'ServiciosFinancieros2'!
Object subclass: #TransactionReport
	instanceVariableNames: 'account'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros2'!

!TransactionReport methodsFor: 'Public' stamp: 'JP 7/12/2021 21:32:45'!
compute

	self subclassResponsibility ! !


!TransactionReport methodsFor: 'initialization' stamp: 'JP 7/14/2021 16:21:20'!
initializeFor: anAccount

	account := anAccount.! !


!TransactionReport methodsFor: 'add' stamp: 'JP 7/12/2021 21:33:47'!
addDeposit: aDeposit

	self subclassResponsibility ! !

!TransactionReport methodsFor: 'add' stamp: 'JP 7/12/2021 21:34:35'!
addTransferDepositLeg: aTransferDepositLeg

	self subclassResponsibility ! !

!TransactionReport methodsFor: 'add' stamp: 'JP 7/12/2021 21:34:28'!
addTransferWithdrawLeg: aTransferWithdrawLeg

	self subclassResponsibility ! !

!TransactionReport methodsFor: 'add' stamp: 'JP 7/12/2021 21:33:57'!
addWithdraw: aWithdraw

	self subclassResponsibility ! !


!classDefinition: #SummaryMaker category: 'ServiciosFinancieros2'!
TransactionReport subclass: #SummaryMaker
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros2'!


!SummaryMaker methodsFor: 'evaluating' stamp: 'JP 7/12/2021 21:12:54'!
compute
	
	| summary |
	summary := OrderedCollection new.
	
	account transactions do: [:aTransaction | summary add: (aTransaction beAddedTo: self)].
	
	summary add: 'Balance = ', account balance asString.
	^summary ! !


!SummaryMaker methodsFor: 'add' stamp: 'JP 7/12/2021 21:10:26'!
addDeposit: aDeposit
	
	^'Depósito por ' , aDeposit value asString
	! !

!SummaryMaker methodsFor: 'add' stamp: 'JP 7/12/2021 21:10:15'!
addTransferDepositLeg: aTransferDepositLeg
	
	^'Entrada por transferencia de '  , aTransferDepositLeg value asString
	! !

!SummaryMaker methodsFor: 'add' stamp: 'JP 7/12/2021 21:08:58'!
addTransferWithdrawLeg: aTransferWithdrawLeg
	
	^'Salida por transferencia de ' , aTransferWithdrawLeg value asString
	! !

!SummaryMaker methodsFor: 'add' stamp: 'JP 7/12/2021 21:08:03'!
addWithdraw: aWithdraw
	
	^'Extracción por ' , aWithdraw value asString
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SummaryMaker class' category: 'ServiciosFinancieros2'!
SummaryMaker class
	instanceVariableNames: ''!

!SummaryMaker class methodsFor: 'instance creation' stamp: 'JP 7/12/2021 20:50:40'!
for: anAccount
	^self new initializeFor: anAccount! !


!classDefinition: #TransferNetCalculator category: 'ServiciosFinancieros2'!
TransactionReport subclass: #TransferNetCalculator
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros2'!


!TransferNetCalculator methodsFor: 'evaluating' stamp: 'JP 7/12/2021 21:27:38'!
compute

	^account transactions sum: [:transaction | transaction beAddedTo: self] ifEmpty: [^ 0 * peso]! !


!TransferNetCalculator methodsFor: 'add' stamp: 'JP 7/12/2021 21:25:37'!
addDeposit: aDeposit

	^0 * peso! !

!TransferNetCalculator methodsFor: 'add' stamp: 'JP 7/12/2021 21:26:39'!
addTransferDepositLeg: aTransferDepositLeg

	^aTransferDepositLeg value ! !

!TransferNetCalculator methodsFor: 'add' stamp: 'JP 7/12/2021 21:26:10'!
addTransferWithdrawLeg: aTransferWithdrawLeg

	^aTransferWithdrawLeg value negated ! !

!TransferNetCalculator methodsFor: 'add' stamp: 'JP 7/12/2021 21:26:27'!
addWithdraw: aWithdraw

	^0 * peso! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferNetCalculator class' category: 'ServiciosFinancieros2'!
TransferNetCalculator class
	instanceVariableNames: ''!

!TransferNetCalculator class methodsFor: 'instance creation' stamp: 'JP 7/12/2021 20:45:40'!
for: anAccount
	^self new initializeFor: anAccount! !


!classDefinition: #Transfer category: 'ServiciosFinancieros2'!
Object subclass: #Transfer
	instanceVariableNames: 'value withdrawLeg depositLeg'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros2'!

!Transfer methodsFor: 'value' stamp: 'LL 9/20/2020 21:13:00'!
value

	^value! !


!Transfer methodsFor: 'accessing' stamp: 'LL 9/20/2020 22:39:46'!
depositLeg

	^depositLeg! !

!Transfer methodsFor: 'accessing' stamp: 'LL 9/20/2020 21:25:56'!
withdrawLeg
	
	^withdrawLeg! !


!Transfer methodsFor: 'initialization' stamp: 'LL 9/20/2020 21:25:21'!
initializeWith: aValue withdrawLeg: aWithdraw depositLeg: aDeposit

	value := aValue.
	withdrawLeg := aWithdraw.
	depositLeg := aDeposit! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: 'ServiciosFinancieros2'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 22:57:30'!
cannotTransferToOriginErrorDescription
	
	^'Transfer destionation cannot be the origin account'! !

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 23:00:53'!
cannotTransferZeroErrorDescription

	^'Transfer amount should be positive'! !

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 22:56:35'!
signalCannotTransferToOrigin
	
	self error: self cannotTransferToOriginErrorDescription! !

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 23:06:17'!
signalCannotTransferZero

	self error: self cannotTransferZeroErrorDescription! !


!Transfer class methodsFor: 'assertions' stamp: 'LL 9/20/2020 23:05:22'!
assert: anAmountOfMoney canBeTransferedTo: destinationAccount from: originAccount

	self assertCanTransferTo: destinationAccount from: originAccount.
	self assertCanTransfer: anAmountOfMoney! !

!Transfer class methodsFor: 'assertions' stamp: 'LL 9/20/2020 23:11:50'!
assertCanTransfer: anAmountOfMoney

	^ anAmountOfMoney isZero ifTrue: [ self signalCannotTransferZero ]! !

!Transfer class methodsFor: 'assertions' stamp: 'LL 9/20/2020 23:04:58'!
assertCanTransferTo: destinationAccount from: originAccount

	^ originAccount = destinationAccount ifTrue: [ self signalCannotTransferToOrigin ]! !


!Transfer class methodsFor: 'instance creation' stamp: 'LL 9/20/2020 23:11:34'!
amount: anAmountOfMoney from: originAccount to: destinationAccount 
	
	| transfer depositLeg withdrawLeg |
	
	self assert: anAmountOfMoney canBeTransferedTo: destinationAccount from: originAccount.
	
	transfer := self new.
	
	withdrawLeg := TransferWithdrawLeg of: transfer on: originAccount.
	depositLeg := TransferDepositLeg of: transfer on: destinationAccount.
	
	^transfer initializeWith: anAmountOfMoney withdrawLeg: withdrawLeg depositLeg: depositLeg
	
	
	! !
