I/O
unsignedByteAt: index put: value
	^ self primOutPort: address + index byte: value

