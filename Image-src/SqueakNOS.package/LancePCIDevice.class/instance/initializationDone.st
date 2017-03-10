accessing - status
initializationDone
	"bit 8 - IDON
	Initialization Done is set by the PCnet-PCI II controller after the
	initialization sequence has completed. When IDON is set, the
	PCnet-PCI II controller has read the initialization block from mem-
	ory.
	When IDON is set, INTA is asserted if IENA is ONE and the
	mask bit IDONM (CSR3, bit 8) is ZERO.
	Read/Write accessible always. IDON is cleared by the host by
	writing a ONE. Writing a ZERO has no effect. IDON is cleared by
	H_RESET, S_RESET or by setting the STOP bit."
	^ self statusBit: 8