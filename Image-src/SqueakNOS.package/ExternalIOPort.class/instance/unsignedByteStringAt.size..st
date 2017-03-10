I/O
unsignedByteStringAt: index size: size
	^ self primInPortByte: address + index stringLength: size

