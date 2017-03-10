accessing
neededOneRetry
	"bit 3 - ONE
	ONE indicates that exactly one retry was needed to transmit a
	frame. ONE flag is not valid when LCOL is set. The value of the
	ONE bit is written by the PCnet-PCI II controller. This bit has
	meaning only if the ENP bit is set."
	^ self flagsBit: 3