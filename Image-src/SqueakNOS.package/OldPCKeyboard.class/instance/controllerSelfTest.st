controller commands
controllerSelfTest
	self controllerCommand: 16rAA.
	^ self waitData = 16r55 