I/O
unsignedByteStringAt: index put: string
	^ self primOutPort: address + index byteString: string

