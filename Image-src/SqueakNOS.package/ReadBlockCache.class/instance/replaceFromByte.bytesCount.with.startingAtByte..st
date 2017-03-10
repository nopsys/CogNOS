as yet unclassified
replaceFromByte: destOffset bytesCount: bytesCount with: source startingAtByte: sourceOffset
	"Write count bytes from source starting at startIndex bytes. We handle half sector
	 overwriting."
	| data firstBlock lastBlock blocksCount firstBlockBytesOffset lastBlockBytesCount blockData firstSectorRead |
	
	firstBlock := device blockNumberFromByteOffset: destOffset.
	lastBlock := device blockNumberFromByteOffset: destOffset + bytesCount - 1.
	blocksCount := lastBlock - firstBlock + 1.
	
	firstSectorRead := false.
	
	data := ByteArray new: blocksCount * device blockSize.
	cache := Array with: nil with: nil with: nil.
	"If it starts at block boundaries, we don't need to read the block. We'll probably overwrite it entirely"
	firstBlockBytesOffset := device positionInBlockOf: destOffset.
	firstBlockBytesOffset ~= 1 ifTrue: [
		firstSectorRead := true.
		blockData := device at: firstBlock.
		data replaceFrom: 1	to: device blockSize with: blockData startingAt: 1.
	].
	
	"If it ends at block boundaries, we don't need to read the last block. We'll probably overwrite it entirely"
	lastBlockBytesCount := device positionInBlockOf: destOffset + bytesCount - 1.
	lastBlockBytesCount ~= device blockSize ifTrue: [
		(blocksCount = 1 & firstSectorRead) ifFalse: [
			blockData := device at: lastBlock.
			data replaceFrom: 1	to: device blockSize with: blockData startingAt: 1.
		].
	].

	data
		replaceFrom: firstBlockBytesOffset to: (firstBlockBytesOffset + bytesCount - 1)
		with: source startingAt: sourceOffset.
	
	count > 10000 ifTrue: [ count := 0.
		"Transcript show: 'Writing ', blocksCount asString, ' sectors starting at ', firstBlock asString, '
'."
	].
	count := count + bytesCount.
	
	device at: firstBlock writeArray: data.
	
