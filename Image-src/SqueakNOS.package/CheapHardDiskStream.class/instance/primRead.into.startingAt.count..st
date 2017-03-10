primitives
primRead: aDriveNumber into: byteArray startingAt: startIndex count: count

	fileID
		readInto: byteArray
		startWritingAtByte: startIndex
		startReadingAtByte: offset + 1
		bytesCount: count.
	
	offset := offset + count.
	^count
