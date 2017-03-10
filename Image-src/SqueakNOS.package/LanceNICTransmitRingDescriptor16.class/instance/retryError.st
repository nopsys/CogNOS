accessing
retryError
	" bit 10 - RTRY
	Retry error indicates that the transmitter has failed after 16
	attempts to successfully transmit a message, due to repeated
	collisions on the medium. If DRTY is set to ONE in the MODE
	register, RTRY will set after 1 failed transmission attempt.
	RTRY is set by the PCnet-PCI II controller and cleared by the host."
	^ self mcnttdrBit: 10