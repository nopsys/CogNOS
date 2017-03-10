low level protocol
controllerCommand: cmd
	self waitToWrite ifFalse: [^false].
	self controllerPort: cmd.
	^true