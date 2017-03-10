as yet unclassified
readInto: byteArray startWritingAtByte: destOffset startReadingAtByte: sourceOffset bytesCount: bytesCount
	
	| data firstBlock lastBlock firstBlockBytesOffset |
	firstBlock := device blockNumberFromByteOffset: sourceOffset.
	lastBlock := device blockNumberFromByteOffset: sourceOffset + bytesCount - 1.
	
	data := device from: firstBlock to: lastBlock.
	
	firstBlockBytesOffset := device positionInBlockOf: sourceOffset.
	byteArray replaceFrom: destOffset to: destOffset + bytesCount - 1 with: data startingAt: firstBlockBytesOffset.
	^bytesCount.
	
