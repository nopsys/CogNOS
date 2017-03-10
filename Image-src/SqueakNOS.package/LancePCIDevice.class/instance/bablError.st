accessing - status
bablError
	"bit 14 - BABL
	Babble is a transmitter time-out error. BABL is set by the
	PCnet-PCI II controller when the    (CSR112) also increments each
	transmitter has been on the channel longer than the time required
	to send the maximum length frame. BABL will be set if 1519 bytes or
	greater are transmitted.

	When BABL is set, INTA is asserted if IENA is ONE and the
	mask bit BABLM (CSR3, bit 14) is ZERO. BABL assertion will set
	the ERR bit, regardless of the settings of IENA and BABLM.

	Read/Write accessible always. BABL is cleared by the host by
	writing a ONE. Writing a ZERO has no effect. BABL is cleared by
	H_RESET, S_RESET or by setting the STOP bit."

	^ self statusBit: 14