accessing
frameError
	"Framing error indicates that the incoming frame contains a
	non-integer multiple of eight bits and there was an FCS error. If
	there was no FCS error on the in coming frame, then FRAM will
	not be set even if there was a non-integer multiple of eight bits
	in the frame. FRAM is not valid in internal loopback mode. FRAM is
	valid only when ENP is set and OFLO is not. FRAM is set by the
	PCnet-PCI II controller and cleared by the host."

	^ self flagsBit: 5