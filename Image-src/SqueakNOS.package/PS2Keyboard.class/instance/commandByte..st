controller commands
commandByte: value
	self controllerCommand: 16r60.
	self keyboardCommand: value.