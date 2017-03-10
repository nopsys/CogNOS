keyboard commands
disableKeyboard
	self keyboardCommand: 16rF5.
	^ self waitKeyboardAck