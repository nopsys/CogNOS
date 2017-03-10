accessing - status
start
	" bit 1 - STRT
	STRT assertion enables the PCnet-PCI II controller to send and
	receive frames and perform buffer management operations. Set-
	ting STRT clears the STOP bit. If STRT and INIT are set together,
	the PCnet-PCI II controller initialization will be performed first.
	Read/Write accessible always. STRT is set by writing a ONE.
	Writing a ZERO has no effect. STRT is cleared by H_RESET,
	S_RESET or by setting the STOP bit."

	^ self statusBitSet: 2