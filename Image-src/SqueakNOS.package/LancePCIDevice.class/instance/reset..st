accessing - basic
reset: byte
	^ self byteAt: 16r14 put: byte