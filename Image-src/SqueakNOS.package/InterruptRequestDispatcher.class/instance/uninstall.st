initialization
uninstall
	Computer current interruptController disableIRQ: interruptNumber.
	self primRegisterSemaphoreIndex: 0 forIRQ: interruptNumber.
	Computer current interruptController removeDispatcher: self.

	" the next is forked so it doesn't kill the process calling.
	  Of utter importance if called from within handleIRQ:
	  as otherwise the interrupt end will not be signaled.
	  The current process is running at hiIOPriority, so the
	  new one won't be executed until the current is idle"
	[process terminate] forkAt: Processor lowIOPriority.
