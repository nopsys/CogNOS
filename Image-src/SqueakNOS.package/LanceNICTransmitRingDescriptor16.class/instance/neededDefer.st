accessing
neededDefer
	"bit 2 - DEF
	Deferred indicates that the PCnet-PCI II controller had to defer
	while trying to transmit a frame. This condition occurs if the channel
	is busy when the PCnet-PCI II controller is ready to transmit.
	DEF is set by the PCnet-PCI II controller and cleared by the host."
	^ self flagsBit: 2