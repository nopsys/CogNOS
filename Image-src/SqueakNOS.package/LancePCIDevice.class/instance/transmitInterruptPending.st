accessing - status
transmitInterruptPending
	"bit 9 - TINT
	Transmit Interrupt is set by the PCnet-PCI II controller after the
	OWN bit in the last descriptor of a transmit frame has been cleared
	to indicate the frame has been sent or an error occurred in the
	transmission. When TINT is set, INTA is asserted if IENA is ONE
	and the mask bit TINTM (CSR3,bit 9) is ZERO."
	^ self statusBit: 9