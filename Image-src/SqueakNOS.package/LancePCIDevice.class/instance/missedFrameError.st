accessing - status
missedFrameError
	"bit 12 - MISS
	Missed Frame is set by the PCnet-PCI II controller when it
	looses an incoming receive frame because a receive descriptor was
	not available. This bit is the only immediate indication that receive
	data has been lost since there is no current receive descriptor.
	The Missed Frame Counter (CSR112) also increments each
	time a receive frame is missed.
	When MISS is set, INTA is asserted if IENA is ONE and the mask
	bit MISSM (CSR3, bit 12) is ZERO. MISS assertion will set the
	ERR bit, regardless of the settings of IENA and MISSM.
	Read/Write accessible always. MISS is cleared by the host by
	writing a ONE. Writing a ZERO has no effect. MISS is cleared by
	H_RESET, S_RESET or by setting the STOP bit."

	^ self statusBit: 12