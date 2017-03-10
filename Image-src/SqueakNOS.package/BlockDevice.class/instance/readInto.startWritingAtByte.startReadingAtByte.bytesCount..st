as yet unclassified
readInto: byteArray startWritingAtByte: destOffset startReadingAtByte: sourceOffset bytesCount: bytesCount
	
	| firstBlock lastBlock firstBlockBytesOffset |
	firstBlock := self blockNumberFromByteOffset: sourceOffset.
	lastBlock := self blockNumberFromByteOffset: sourceOffset + bytesCount - 1.
	
	firstBlockBytesOffset := self positionInBlockOf: sourceOffset.
	byteArray replaceFrom: destOffset to: destOffset + bytesCount - 1 with: (cache from: firstBlock to: lastBlock) startingAt: firstBlockBytesOffset.
	^bytesCount.
	
	
