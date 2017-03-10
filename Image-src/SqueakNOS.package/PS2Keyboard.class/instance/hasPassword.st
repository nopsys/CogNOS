controller commands
hasPassword
	self controllerCommand: 16rA4.
	^ self readKeyboardData == 16rFA