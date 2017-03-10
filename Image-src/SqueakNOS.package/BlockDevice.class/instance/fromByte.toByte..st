as yet unclassified
fromByte: firstByte toByte: lastByte
	
	| data firstBlock lastBlock firstBlockBytesOffset |
	firstBlock := self blockNumberFromByteOffset: firstByte.
	lastBlock := self blockNumberFromByteOffset: lastByte.
	
	data := self from: firstBlock to: lastBlock.
		
	firstBlockBytesOffset := self positionInBlockOf: firstByte.
	^ data copyFrom: firstBlockBytesOffset to: firstBlockBytesOffset + lastByte - firstByte.
