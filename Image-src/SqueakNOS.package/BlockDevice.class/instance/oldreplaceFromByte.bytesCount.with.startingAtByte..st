as yet unclassified
oldreplaceFromByte: destOffset bytesCount: bytesCount with: source startingAtByte: sourceOffset
	"Write count bytes from source starting at startIndex bytes. We handle half sector
	 overwriting."
	| data firstBlock lastBlock blocksCount firstBlockBytesOffset lastBlockBytesCount blockData firstSectorRead |
	
	firstBlock := self blockNumberFromByteOffset: destOffset.
	lastBlock := self blockNumberFromByteOffset: destOffset + bytesCount - 1.
	blocksCount := lastBlock - firstBlock + 1.
	
	firstSectorRead := false.
	
	data := ByteArray new: blocksCount * self blockSize.
	
	cache := Array new: 3.
	
	"If it starts at block boundaries, we don't need to read the block. We'll probably overwrite it entirely"
	firstBlockBytesOffset := self positionInBlockOf: destOffset.
	firstBlockBytesOffset ~= 1 ifTrue: [
		firstSectorRead := true.
		blockData := self at: firstBlock.
		data replaceFrom: 1	to: self blockSize with: blockData startingAt: 1.
	].
	
	"If it ends at block boundaries, we don't need to read the last block. We'll probably overwrite it entirely"
	lastBlockBytesCount := self positionInBlockOf: destOffset + bytesCount - 1.
	lastBlockBytesCount ~= self blockSize ifTrue: [
		(blocksCount = 1 & firstSectorRead) ifFalse: [
			blockData := self at: lastBlock.
			data replaceFrom: 1	to: self blockSize with: blockData startingAt: 1.
		].
	].

	data
		replaceFrom: firstBlockBytesOffset to: (firstBlockBytesOffset + bytesCount - 1)
		with: source startingAt: sourceOffset.
	
	self at: firstBlock writeArray: data.
	