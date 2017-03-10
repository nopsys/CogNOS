accessing - command register
hasMemoryEnabled
	"bit 1 - Controls a device's response to Memory Space accesses. A value of
	0 disables the device response. A value of 1 allows the device to
	respond to Memory Space accesses. State after RST# is 0."

	^ self testCommandBit: 1