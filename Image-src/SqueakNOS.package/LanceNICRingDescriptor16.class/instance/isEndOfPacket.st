accessing - no auto
isEndOfPacket
	"End of Packet (ENP) indicates that this is the last buffer used by the
	PCnet-PCI II controller for this frame. It is used for data chaining
	buffers. If both STP and ENP are set, the frame fits into one buffer
	and there is no data chaining. ENP is set by the PCnet-PCI II controller
	and cleared by the host."
	^ self flagsBit: 0