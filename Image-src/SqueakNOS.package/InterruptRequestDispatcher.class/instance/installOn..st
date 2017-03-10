initialization
installOn: aComputer
	self registerSemaphore.
	process := [
		[
			semaphore wait.
			self handleOn: aComputer.
			aComputer interruptController signalEndOfInterrupt: interruptNumber
		] repeat.
	] forkAt: Processor highIOPriority.
	process name: 'Iterrupt Dispatcher for IRQ#:', interruptNumber printString.
	aComputer interruptController enableIRQ: interruptNumber
