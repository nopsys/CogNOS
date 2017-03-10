I/O
unsignedShortStringAt: index put: string
	^ self primOutPort: address + index wordString: string

