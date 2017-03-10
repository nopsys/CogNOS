commands
reset
	"Reset: Setting to 1 forces the RTL8139C(L) to a software reset state
	which disables the transmitter and receiver, reinitializes the FIFOs,
	resets the system buffer pointer to the initial value (Tx buffer is at
	TSAD0, Rx buffer is empty). The values of IDR0-5 and MAR0-7 and
	PCI configuration space will have no changes. This bit is 1 during the
	reset operation, and is cleared to 0 by the RTL8139C(L) when the reset
	operation is complete."

	self command: 128.
	[self command anyMask: 128] whileTrue.