keyboard commands
keyboardTypematicRateDelay: value
	self keyboardCommand: 16rF3.
	self waitKeyboardAck.
	self keyboardCommand: value.
	^self waitKeyboardAck