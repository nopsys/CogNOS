enabling interrupts
enableInterrupts
	self enableCardRemovalInterrupt; 
		enableCardInsertionInterrupt; 
		enableCommandCompleteInterrupt;
		enableErrorInterrupt