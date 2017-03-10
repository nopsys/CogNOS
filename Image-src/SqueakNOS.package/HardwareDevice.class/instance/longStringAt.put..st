I/O
longStringAt: index put: aString
	^ resource unsignedLongStringAt: index + 1 put: aString