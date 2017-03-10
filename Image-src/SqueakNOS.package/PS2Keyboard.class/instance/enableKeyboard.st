keyboard commands
enableKeyboard
	self keyboardCommand: 16rF4.
	^ self waitKeyboardAck