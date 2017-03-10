irq handling
handleIRQ
	self turnOffRTS.
	
	[self readInterruptId.
	self receivedDataPending
		ifTrue: 
			[
			[receivedChars nextPut: (self byteAt: 0).
			self readLineStatus.
			self checkError.
			self dataAvailabelInRDR] whileTrue].
	self interruptPending] whileTrue.
	self turnOnRTS