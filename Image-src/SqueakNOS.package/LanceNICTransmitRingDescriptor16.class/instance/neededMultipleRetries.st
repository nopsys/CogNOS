accessing
neededMultipleRetries
	"bit 4 - MORE/LTINT
	MORE indicates that more than one retry was needed to transmit
	a frame. The value of MORE is written by the PCnet-PCI II controller.
	This bit has meaning only if the ENP bit is set."
	^ self flagsBit: 4