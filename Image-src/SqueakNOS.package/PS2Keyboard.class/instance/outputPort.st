controller commands
outputPort
	self controllerCommand: 16rDO.
	^ self readKeyboardData.