accessing - status
demandTransmition
	"bit 3 - TDMD
	Transmit Demand, when set, causes the buffer management
	unit to access the transmit descriptor ring without waiting for
	the poll-time counter to elapse. If TXON is not enabled, TDMD bit
	will be cleared and no transmit descriptor ring access will occur.
	If the DPOLL bit in CSR4 is set, automatic polling is disabled and
	TDMD can be used to start a transmission.
	Read/Write accessible always. TDMD is set by writing a ONE.
	Writing a ZERO has no effect. TDMD will be cleared by the buffer
	management unit when it polls a transmit descriptor. TDMD is
	cleared by H_RESET, S_RESET or by setting the STOP bit."
	^ self statusBitSet: 3