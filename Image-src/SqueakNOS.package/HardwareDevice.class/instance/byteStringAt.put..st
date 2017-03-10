I/O
byteStringAt: index put: aString
	^ resource unsignedByteStringAt: index + 1 put: aString