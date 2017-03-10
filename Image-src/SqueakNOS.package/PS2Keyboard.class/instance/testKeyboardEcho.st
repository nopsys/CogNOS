keyboard commands
testKeyboardEcho
	self keyboardCommand: 16rEE.
	^ self readKeyboardData == 16rEE