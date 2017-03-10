controller commands
pulseOutputPortLow: value
	self controllerCommand: 16rF0 + (value bitAnd: 15).