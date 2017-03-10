irq handling
handleIRQ
	self report: 'IRQ'.
	self handleKbdEvent.
