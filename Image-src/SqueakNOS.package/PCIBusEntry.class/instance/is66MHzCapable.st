accessing - status
is66MHzCapable
	" bit 5 - This optional read-only bit indicates whether or not this device is
	capable of running at 66 MHz as defined in Chapter 7 of PCI Local Bus Spec.
	A value of zero indicates 33 MHz. A value of 1 indicates that the device is 66 MHz
	capable."

	^ self statusBit: 5