controller commands
testController
	self controllerCommand: 16rAA.
	^ self readKeyboardData == 16r55
