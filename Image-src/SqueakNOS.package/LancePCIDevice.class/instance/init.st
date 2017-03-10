accessing - status
init
	" bit 0 - INIT
	INIT assertion enables the PCnet-PCI II controller to begin the
	initialization procedure which reads the initialization block from
	memory. Setting INIT clears the STOP bit. If STRT and INIT are
	set together, the PCnet-PCI II controller initialization will be
	performed first. INIT is not cleared. If when the initialization
	sequence has completed.
	Read/Write accessible always. INIT is set by writing a ONE.
	Writing a ZERO has no effect. INIT is cleared by H_RESET, S_RESET
	or by setting the STOP bit."

	^ self status: 1