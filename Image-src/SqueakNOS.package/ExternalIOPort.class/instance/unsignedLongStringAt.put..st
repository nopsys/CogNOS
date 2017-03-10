I/O
unsignedLongStringAt: index put: string
	^ self primOutPort: address + index dwordString: string

