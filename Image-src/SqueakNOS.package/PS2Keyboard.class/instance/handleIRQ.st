irq handling
handleIRQ
	[self keyboardOutputBufferFull] whileTrue: [
		self mouseOutputBufferFull
			ifTrue: [self handleMouseIRQ]
			ifFalse: [self handleKeyboardIRQ]]

