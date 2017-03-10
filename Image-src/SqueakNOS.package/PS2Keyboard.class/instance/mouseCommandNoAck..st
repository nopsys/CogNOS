mouse commands
mouseCommandNoAck: value
	self controllerCommand: 16rD4.
	self keyboardCommand: value.