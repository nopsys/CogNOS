commands
sendCommand: c with: arg
	self
		waitForCommandSendAllowed;
		waitForDATCommandAllowed;
		longAt: 16r08 put: arg;
		shortAt: 16r0E put: (c bitShift: 8);
		waitForCommandComplete;
		readResponse