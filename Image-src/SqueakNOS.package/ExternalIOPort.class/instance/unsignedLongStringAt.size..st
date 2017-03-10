I/O
unsignedLongStringAt: index size: size
	^ self primInPortDword: address + index stringLength: size

