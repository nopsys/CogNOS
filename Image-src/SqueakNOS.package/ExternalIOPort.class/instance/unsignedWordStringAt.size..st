I/O
unsignedWordStringAt: index size: size
	^ self primInPortWord: address + index stringLength: size

