keyboard commands
testKeyboardInterface
	self controllerCommand: 16rAB.
	^ self readKeyboardData isZero
