controller commands
controllerCommand: cmd data: aByte
	self controllerCommand: cmd.
	self safeDelay.
	self dataPort: aByte