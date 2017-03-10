accessing - command register
hasBusMasteringEnabled
	"bit 2 - Controls a device's ability to act as a master on the PCI bus. A value
	of 0 disables the device from generating PCI accesses. A value of 1
	allows the device to behave as a bus master. State after RST# is 0."

	^ self testCommandBit: 2