accessing - status
collisionError
	"bit 13 - CERR
	Collision Error is set by the PC=net-PCI II controller when the
	device operates in half-duplex mode and the collision inputs to
	the AUI port failed to activate within 20 network bit times after
	the chip terminated transmission (SQE Test). This feature is a
	transceiver test feature. CERR reporting is disabled when the
	AUI interface is active and the PCnet-PCI II controller operates in
	full-duplex mode.
	In 10BASE-T mode, for both half-duplex and full-duplex operation,
	CERR will be set after a transmission if the T-MAU is in Link Fail state.
	CERR assertion will not result in an interrupt being generated.
	CERR assertion will set the ERR bit.
	Read/Write accessible always. CERR is cleared by the host by
	writing a ONE. Writing a ZERO has no effect. CERR is cleared by
	H_RESET, S_RESET or by setting the STOP bit."

	^ self statusBit: 13