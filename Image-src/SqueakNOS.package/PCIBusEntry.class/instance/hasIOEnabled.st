accessing - command register
hasIOEnabled
	"bit 0 - Controls a device\u2019s response to I/O Space accesses. A value of 0
	disables the device response. A value of 1 allows the device to
	respond to I/O Space accesses. State after RST# is 0."

	^ self testCommandBit: 0