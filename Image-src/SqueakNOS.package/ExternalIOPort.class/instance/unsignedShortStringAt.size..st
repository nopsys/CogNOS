I/O
unsignedShortStringAt: index size: size
	^ self primInPortWord: address + index stringLength: size

