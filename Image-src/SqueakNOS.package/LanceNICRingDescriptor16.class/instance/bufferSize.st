accessing - no auto
bufferSize
	"BCNT Buffer Byte Count is the length of the buffer pointed to
	by this de scriptor, expressed as the two's complement of the
	length of the buffer. This field is written by the host and
	unchanged by the PCnet-PCI II controller."
	^ 16r10000 - self bcnt