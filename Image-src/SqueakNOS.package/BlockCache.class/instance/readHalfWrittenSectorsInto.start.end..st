as yet unclassified
readHalfWrittenSectorsInto: buffer start: byteStart end: byteEnd

	| firstBlock lastBlock blocksCount firstSectorRead helper |

	helper := BlockArithmetic new blockSize: self blockSize.
	firstSectorRead := false.
	firstBlock := helper blockNumberOf: byteStart.
	lastBlock := helper blockNumberOf: byteEnd.
	blocksCount := lastBlock - firstBlock + 1.

	"If it starts at block boundaries, we don't need to read the block. We'll probably overwrite it entirely"
	(helper positionInBlockOf: byteStart ) ~= 1 ifTrue: [
		firstSectorRead := true.
		buffer replaceFrom: 1 to: self blockSize with: (device at: firstBlock) startingAt: 1.
	].

	"If it ends at block boundaries, we don't need to read the last block. We'll probably overwrite it entirely"
	(helper positionInBlockOf: byteEnd) ~= self blockSize ifTrue: [
		(blocksCount = 1 & firstSectorRead) ifFalse: [
			buffer replaceFrom: 1	to: self blockSize with: (device at: lastBlock) startingAt: 1.
		].
	].
