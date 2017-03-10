accessing - status
interruptPending
	"bit 7 - INTR
	Interrupt Flag indicates that one or more following interrupt
	causing conditions has occurred: BABL, EXDINT, IDON, JAB,
	MERR, MISS, MFCO, MPINT, RVCC, RINT, SINT, SLPINT, TINT,
	TXSTRT or UINT and the associated mask or enable bit is
	programmed to allow the event to cause an interrupt. If IENA is set
	to ONE and INTR is set, INTA will be active. When INTR is set by
	SINT or SLPINT, INTA will be active independent of the state of
	INEA.
	Read accessible always. INTR is read only. INTR is cleared by
	clearing all of the active individual interrupt bits that have not been
	masked out."
	^ self statusBit: 7