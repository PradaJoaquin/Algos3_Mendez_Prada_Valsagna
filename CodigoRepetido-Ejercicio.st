!classDefinition: #CantSuspend category: 'CodigoRepetido-Ejercicio'!
Error subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #NotFound category: 'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerBookTest category: 'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'mensajes Auxiliares' stamp: 'FV 5/17/2021 14:12:38'!
calcularTiempoDeEjecucionDelBloqueDeCodigo: bloqueDeCodigoAEvaluarDuracion
	| millisecondsBeforeRunning millisecondsAfterRunning |
	millisecondsBeforeRunning := Time millisecondClockValue * millisecond.
	bloqueDeCodigoAEvaluarDuracion value.
	millisecondsAfterRunning := Time millisecondClockValue * millisecond.
	
	^millisecondsAfterRunning-millisecondsBeforeRunning! !

!CustomerBookTest methodsFor: 'mensajes Auxiliares' stamp: 'FV 5/16/2021 01:25:12'!
crearUnCustomerBookYAgregarA: personaAAgregar
	| customerBook |
	customerBook := CustomerBook new.
	customerBook addCustomerNamed: personaAAgregar.
	^customerBook.! !

!CustomerBookTest methodsFor: 'mensajes Auxiliares' stamp: 'FV 5/17/2021 14:09:34'!
verificarEnElCustomerBook: customerBookAVerificar cantidadMiembrosActivos: cantidadEsperadaDeMiembrosActivos cantidadMiembrosSuspendidos: cantidadEsperadaDeMiembrosSuspendidos cantidadNumeroCustomers: cantidadEsperadaDeNumeroCustomers
	self assert: cantidadEsperadaDeMiembrosActivos equals: customerBookAVerificar numberOfActiveCustomers.
	self assert: cantidadEsperadaDeMiembrosSuspendidos equals: customerBookAVerificar numberOfSuspendedCustomers.
	self assert: cantidadEsperadaDeNumeroCustomers equals: customerBookAVerificar numberOfCustomers.! !

!CustomerBookTest methodsFor: 'mensajes Auxiliares' stamp: 'FV 5/17/2021 14:11:52'!
verificarQueElBloqueDeCodigo: bloqueDeCodigoAEvaluarDuracion
	| millisecondsBeforeRunning millisecondsAfterRunning |
	millisecondsBeforeRunning := Time millisecondClockValue * millisecond.
	bloqueDeCodigoAEvaluarDuracion value.
	millisecondsAfterRunning := Time millisecondClockValue * millisecond.
	
	^millisecondsAfterRunning-millisecondsBeforeRunning! !

!CustomerBookTest methodsFor: 'mensajes Auxiliares' stamp: 'FV 5/17/2021 14:39:28'!
verificarQueSoloEsteLennonSiNoSePudoSuspenderDelCustormerBook: customerBook aLaPersona: personaASuspender
	
	[ customerBook suspendCustomerNamed: personaASuspender.
	self fail ]
		on: CantSuspend 
		do: [ :anError | 
			self verificarSiSoloEstaLennonEnElCustomerBook: customerBook]! !

!CustomerBookTest methodsFor: 'mensajes Auxiliares' stamp: 'FV 5/16/2021 02:27:01'!
verificarSiSoloEstaLennonEnElCustomerBook: customerBook
 
	self assert: customerBook numberOfCustomers = 1.
	self assert: (customerBook includesCustomerNamed: 'John Lennon').! !


!CustomerBookTest methodsFor: 'tests' stamp: 'FV 5/17/2021 14:16:10'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	| customerBook tiempoDeEjecucionDelAgregadoDeCustomer|
	
	customerBook := CustomerBook new.
	
	
	tiempoDeEjecucionDelAgregadoDeCustomer := self calcularTiempoDeEjecucionDelBloqueDeCodigo: [customerBook addCustomerNamed: 'John Lennon'.].
	
	
	self assert: tiempoDeEjecucionDelAgregadoDeCustomer  < (50 * millisecond).! !

!CustomerBookTest methodsFor: 'tests' stamp: 'FV 5/17/2021 14:19:31'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| customerBook paulMcCartney tiempoDeEjecucionDelBorradoDeCustomer|
	
	paulMcCartney := 'Paul McCartney'.
	customerBook := self crearUnCustomerBookYAgregarA: paulMcCartney.
	
	tiempoDeEjecucionDelBorradoDeCustomer := self calcularTiempoDeEjecucionDelBloqueDeCodigo: [customerBook removeCustomerNamed: paulMcCartney.].
	
	self assert: tiempoDeEjecucionDelBorradoDeCustomer < (100 * millisecond).	
	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/9/2012 18:12'!
test03CanNotAddACustomerWithEmptyName 

	| customerBook |
			
	customerBook := CustomerBook new.

	[ customerBook addCustomerNamed: ''.
	self fail ]
		on: Error 
		do: [ :anError | 
			self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
			self assert: customerBook isEmpty ]! !

!CustomerBookTest methodsFor: 'tests' stamp: 'FV 5/16/2021 02:22:59'!
test04CanNotRemoveAnInvalidCustomer
	
	| customerBook johnLennon |
			
	johnLennon := 'John Lennon'.
	customerBook := self crearUnCustomerBookYAgregarA: johnLennon.
	
	[ customerBook removeCustomerNamed: 'Paul McCartney'.
	self fail ]
		on: NotFound 
		do: [ :anError | 
			self verificarSiSoloEstaLennonEnElCustomerBook: customerBook]
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'FV 5/17/2021 14:09:34'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	paulMcCartney := 'Paul McCartney'.
	
	customerBook := self crearUnCustomerBookYAgregarA: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	
	
	self verificarEnElCustomerBook: customerBook cantidadMiembrosActivos: 0 cantidadMiembrosSuspendidos: 1 cantidadNumeroCustomers: 1. 
	self assert: (customerBook includesCustomerNamed: paulMcCartney).
	

	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'FV 5/17/2021 14:09:34'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	paulMcCartney := 'Paul McCartney'.
	customerBook := self crearUnCustomerBookYAgregarA: paulMcCartney.
	
	customerBook suspendCustomerNamed: paulMcCartney.
	customerBook removeCustomerNamed: paulMcCartney.
	
	
	self verificarEnElCustomerBook: customerBook cantidadMiembrosActivos: 0 cantidadMiembrosSuspendidos: 0 cantidadNumeroCustomers: 0.
	self deny: (customerBook includesCustomerNamed: paulMcCartney).


	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'FV 5/17/2021 14:39:28'!
test07CanNotSuspendAnInvalidCustomer
	
	| customerBook johnLennon |
			
	johnLennon := 'John Lennon'.
	customerBook := self crearUnCustomerBookYAgregarA: johnLennon.
	
	self verificarQueSoloEsteLennonSiNoSePudoSuspenderDelCustormerBook: customerBook aLaPersona: 'Ringo Starr'.
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'FV 5/17/2021 14:39:28'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| customerBook johnLennon |
			
	johnLennon := 'John Lennon'.
	customerBook := self crearUnCustomerBookYAgregarA: johnLennon.
	customerBook suspendCustomerNamed: johnLennon.
	
	self verificarQueSoloEsteLennonSiNoSePudoSuspenderDelCustormerBook: customerBook aLaPersona: johnLennon.! !


!classDefinition: #CustomerBook category: 'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'initialization' stamp: 'LL 10/30/2020 12:22:04'!
initialize

	active := OrderedCollection new.
	suspended:= OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	((active includes: aName) or: [suspended includes: aName]) ifTrue: [ self signalCustomerAlreadyExists ].
	
	active add: aName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'FV 5/17/2021 15:00:55'!
removeCustomerNamed: aName 
 	|removerUsuarioDeLaLista|
	
	removerUsuarioDeLaLista := [:listaDeUsuarios |1 to: listaDeUsuarios size do: 
	[ :index |
		aName = (listaDeUsuarios at: index)
			ifTrue: [
				listaDeUsuarios removeAt: index.
				^ aName
			] 
	].].

	
	removerUsuarioDeLaLista value: active.
	removerUsuarioDeLaLista value: suspended.	
	^ NotFound signal.
! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
suspendCustomerNamed: aName 
	
	(active includes: aName) ifFalse: [^CantSuspend signal].
	
	active remove: aName.
	
	suspended add: aName
! !


!CustomerBook methodsFor: 'accessing' stamp: 'NR 4/3/2019 10:14:26'!
numberOfActiveCustomers
	
	^active size! !

!CustomerBook methodsFor: 'accessing' stamp: 'NR 4/3/2019 10:14:26'!
numberOfCustomers
	
	^active size + suspended size! !

!CustomerBook methodsFor: 'accessing' stamp: 'NR 9/19/2018 17:36:09'!
numberOfSuspendedCustomers
	
	^suspended size! !


!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
includesCustomerNamed: aName

	^(active includes: aName) or: [ suspended includes: aName ]! !

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
isEmpty
	
	^active isEmpty and: [ suspended isEmpty ]! !


!CustomerBook methodsFor: 'signal errors' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'signal errors' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !


!CustomerBook methodsFor: 'private' stamp: 'FV 5/16/2021 02:41:54'!
eliminarDeLaLista: listaDeUsuarios aLaSiguientePersona: personaAEliminar

1 to: listaDeUsuarios size do: 
	[ :index |
		personaAEliminar = (listaDeUsuarios at: index)
			ifTrue: [
				listaDeUsuarios removeAt: index.
				^ personaAEliminar
			] 
	].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: 'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:18'!
customerAlreadyExistsErrorMessage

	^'Customer Already Exists'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:25'!
customerCanNotBeEmptyErrorMessage

	^'Customer Name Cannot Be Empty'! !
