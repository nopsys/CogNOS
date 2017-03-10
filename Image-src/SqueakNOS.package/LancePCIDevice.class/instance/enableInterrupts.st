accessing - status
enableInterrupts
	"bit 6 - IENA
	Interrupt Enable allows INTA to be active if the Interrupt Flag is
	set. If IENA is cleared to ZERO, INTA will be disabled regardless
	of the state of INTR.
	Read/Write accessible always. IENA is set by writing a ONE and
	cleared by writing a ZERO. IENA is cleared by H_RESET,
	S_RESET or by setting the STOP bit."
	^ self statusBitSet: 6