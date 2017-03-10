accessing - no auto
isStartOfPacket
	"Start of Packet (STP) indicates that this is the first buffer used by the
	PCnet-PCI II controller for this frame. If STP and ENP are both
	set to ONE, the frame fits into a single buffer. Otherwise, the
	frame is spread over more than one buffer. When LAPPEN
	(CSR3, bit 5) is cleared to ZERO, STP is set by the PCnet-PCI II
	controller and cleared by the host. When LAPPEN is set to
	ONE, STP must be set by the host."
	^ self flagsBit: 1