accessing - status
stop
	" bit 2 - STOP
	STOP assertion disables the chip from all DMA and network activi	ty.
	The chip remains inactive until 	either STRT or INIT are set. If STOP,
	STRT and INIT are all set together, STOP will override STRT and INIT.
	Read/Write accessible always. STOP is set by writing a ONE, by
	H_RESET or S_RESET. Writing a ZERO has no effect. STOP is
	cleared by setting either STRT or INIT."

	^ self status: 4