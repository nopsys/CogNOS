controller commands
keyboardSelfTest
	self controllerCommand: 16rAB.
	^ self waitData = 0