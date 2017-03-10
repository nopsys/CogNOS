accessing
crcError
	"CRC indicates that the receiver has detected a CRC (FCS) error
	on the incoming frame. CRC is valid only when ENP is set and
	OFLO is not. CRC is set by the PCnet-PCI II controller and
	cleared by the host."
	^ self flagsBit: 3