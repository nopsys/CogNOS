low level protocol
keyboardCommand: cmd
	self waitToWrite ifFalse: [^false].
	self dataPort: cmd.
	^true