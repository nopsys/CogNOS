debugging
primitiveShutdownComputer
	self primitive: 'primitiveShutdownComputer'
		parameters: #().

	self cCode: 'shutdownComputer()'.

