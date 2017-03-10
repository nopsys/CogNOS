private
registerSemaphore
	self
		primRegisterSemaphoreIndex: (Smalltalk registerExternalObject: semaphore)
		forIRQ: interruptNumber