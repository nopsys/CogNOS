keyboard commands
resendKeyboardCommand
	self keyboardCommand: 16rFE.
	^ self readKeyboardData