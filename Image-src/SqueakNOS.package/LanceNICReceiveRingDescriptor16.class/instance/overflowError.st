accessing
overflowError
	"Overflow error indicates that the receiver has lost all or part of the
	incoming frame, due to an inability to move data from the receive
	FIFO into a memory buffer before the internal FIFO overflowed.
	OFLO is valid only when ENP is not set. OFLO is set by the PC-
	net-PCI II controller and cleared by the host."
	^ self flagsBit: 4