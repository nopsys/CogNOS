keyboard commands
keyboardScanCodeSet: value
	value == 1
		ifTrue: [self setCommandBit: 6]
		ifFalse: [self clearCommandBit: 6].
"	self keyboardCommand: 16rF0.
	self waitKeyboardAck.
	self keyboardCommand: value.
	^self waitKeyboardAck.
"