mouse commands
testMouseInterface
	self controllerCommand: 16rA9.
	^ self readKeyboardData isZero
