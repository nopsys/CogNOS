accessing
bufferError
	"Buffer error is set any time the PCnet-PCI II controller does not
	own the next buffer while data chaining a received frame. This
	can occur in either of two ways:
		1. The OWN bit of the next buffer is ZERO.
		2. FIFO overflow occurred before the PCnet-PCI II controller
		was able to read the OWNbit of the next descriptor.
	If a Buffer Error occurs, an Overflow Error may also occur
	internally in the FIFO, but will not be reported in the descriptor status
	entry unless both BUFF and OFLO errors occur at the same
	time. BUFF is set by the PCnet-PCI II controller and cleared
	by the host."
	^ self flagsBit: 2