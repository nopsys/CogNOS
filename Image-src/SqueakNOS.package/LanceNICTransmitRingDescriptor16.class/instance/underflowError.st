accessing
underflowError
	" bit 14 - UFLO
	Underflow error indicates that the transmitter has truncated a
	message because it could not read data from memory fast enough.
	UFLO indicates that the FIFO has emptied before the end of the
	frame was reached. When DXSUFLO (CSR3, bit 6) is cleared to
	ZERO, the transmitter is turned off when an UFLO error
	occurs (CSR0, TXON = 0). When DXSUFLO is set to ONE
	the PCnet-PCI II controller grace fully recovers from an UFLO
	error. It scans the transmit descriptor ring until it finds the
	start of a new frame and starts a new transmission.
	UFLO is set by the PCnet-PCI II controller and cleared by the
	host."
	^ self mcnttdrBit: 14