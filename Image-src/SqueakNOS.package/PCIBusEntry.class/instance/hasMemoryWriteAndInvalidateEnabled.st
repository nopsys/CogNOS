accessing - command register
hasMemoryWriteAndInvalidateEnabled
	"bit 4 - This is an enable bit for using the Memory Write and Invalidate
	command. When this bit is 1, masters may generate the command.
	When it is 0, Memory Write must be used instead. State after RST# is
	0. This bit must be implemented by master devices that can generate
	the Memory Write and Invalidate command."

	^ self testCommandBit: 4