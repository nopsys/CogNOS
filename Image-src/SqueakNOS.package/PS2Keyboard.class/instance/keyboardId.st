keyboard commands
keyboardId
	self keyboardCommand: 16rF2.
	self waitKeyboardAck.
	^(self readKeyboardData bitShift: 8) bitOr: self keyboardData.