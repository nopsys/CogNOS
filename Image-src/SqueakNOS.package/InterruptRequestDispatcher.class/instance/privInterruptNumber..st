private
privInterruptNumber: irqNumber
	interruptNumber
		ifNil: [
			interruptNumber := irqNumber.
			self registerSemaphore]
		ifNotNil: [self error: 'Can''t change the IRQ number for a handler']