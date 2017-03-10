accessing - status
receiveInterruptPending
	"bit 10 - RINT
	Receive Interrupt is set by the PCnet-PCI II controller after the
	last descriptor of a receive frame has been updated by writing a
	ZERO to the OWN bit. RINT may also be set when the first descriptor
	of a receive frame has been updated by writing a ZERO to the
	OWN bit if the LAPPEN bit of CSR3 has been set to ONE.
	When RINT is set, INTA is asserted if IENA is ONE and the mask
	bit RINTM (CSR3, bit 10) is ZERO.
	Read/Write accessible always. RINT is cleared by the host by
	writing a ONE. Writing a ZERO has no effect. RINT is cleared by
	H_RESET, S_RESET or by setting the STOP bit."
	^ self statusBit: 10