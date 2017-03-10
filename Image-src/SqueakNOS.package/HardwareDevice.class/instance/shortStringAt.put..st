I/O
shortStringAt: index put: aString
	^ resource unsignedShortStringAt: index + 1 put: aString