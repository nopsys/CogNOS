I/O
unsignedShortAt: index put: value
	^ self primOutPort: address + index word: value

