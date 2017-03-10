accessing - status
isReceiveEnabled
	"bit 5 - RXON
	Receive On indicates that the receive function is enabled. RXON
	is set to ONE if DRX (CSR15, bit 0) is cleared to ZERO after the
	START bit is set. If INIT and START are set together, RXON
	will not be set until after the initialization block has been read in.
	Read accessible always. RXON is read only. RXON is cleared by
	H_RESET, S_RESET or by setting the STOP bit."
	^ self statusBit: 5