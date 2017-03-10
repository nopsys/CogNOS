controller commands
commandByte
	self controllerCommand: 16r20.
	^ self readKeyboardData.