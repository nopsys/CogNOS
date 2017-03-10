accessing - status
isFastBackToBackCapable
	" bit 7 - This optional read-only bit indicates whether or not the target is
	capable of accepting fast back-to-back transactions when the
	transactions are not to the same agent. This bit can be set to 1 if the
	device can accept these transactions and must be set to 0 otherwise.
	Refer to Section 3.4.2. of PCI Local Bus Spec for a complete description
	of requirements for setting this bit."

	^ self statusBit: 7