as yet unclassified
fromByte: sourceOffset bytesCount: bytesCount
	
	| data firstBlock lastBlock firstBlockBytesOffset |
	firstBlock := self blockNumberFromByteOffset: sourceOffset.
	lastBlock := self blockNumberFromByteOffset: sourceOffset + bytesCount - 1.
	
	data := self from: firstBlock to: lastBlock.
		
	firstBlockBytesOffset := sourceOffset - 1 \\ 512 + 1.
	^ data copyFrom: firstBlockBytesOffset to: firstBlockBytesOffset + bytesCount - 1.
