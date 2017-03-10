keyboard commands
keyboardLeds: value
	self keyboardCommand: 16rED.
	self waitKeyboardAck.
	self keyboardCommand: value.
	^self waitKeyboardAck.
