mouse commands
mouseCommand: value
	self controllerCommand: 16rD4.
	self keyboardCommand: value.
	^ self waitMouseAck.