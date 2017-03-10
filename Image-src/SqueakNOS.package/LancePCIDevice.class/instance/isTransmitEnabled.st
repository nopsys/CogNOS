accessing - status
isTransmitEnabled
	"bit 4 - TXON
	Transmit On indicates that the transmit function is enabled. TXON
	is set to ONE if DTX (CSR15, bit 1) is cleared to ZERO after the
	START bit is set. If INIT and START are set together, TXON
	will not be set until after the initialization block has been read in.
	Read accessible always. TXON is read only. TXON is cleared by
	H_RESET, S_RESET or by setting the STOP bit."
	^ self statusBit: 4