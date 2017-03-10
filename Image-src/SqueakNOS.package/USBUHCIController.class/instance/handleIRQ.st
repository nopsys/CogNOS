irq handling
handleIRQ
	self report: 'Command: ', self command hex, ' Status: ', self status hex.
	self resetStatus.
