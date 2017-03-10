controller commands
testPort
	self controllerCommand: 16rE0.
	^ self readKeyboardData