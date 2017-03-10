services
at: firstSectorNumber count: aNumberOfSectors of: aDeviceNumber 
	| answer remaining alreadyRead nextBlockNumber |
	"The max we can read is 256 sectors (thats an ATA limit). If we want to read more, we do it by grabing chunks of 256 sectors until we finish."
	"Transcript show: 'Reading from: ', firstBlockNumber asString, ' to: ', lastBlockNumber asString, Character cr asString."
	"self halt."
	remaining := aNumberOfSectors .
	alreadyRead := 0.
	
	answer := ByteString new: remaining * self sectorSize.
	nextBlockNumber := firstSectorNumber - 1.

	[ remaining > 0 ] whileTrue: [ | chunkSize | 
		"Transcript show: 'Reading sector ', (nextBlockNumber - 1) asString, Character cr asString."
		chunkSize := remaining min: 256.
		answer 
			replaceFrom: (self byteOffsetOfBlock: alreadyRead + 1)
			to: (self byteOffsetOfBlock: alreadyRead + chunkSize + 1) - 1
			with: (self issueReadFrom: nextBlockNumber count: chunkSize device: aDeviceNumber timeout: self readMillisecondsTimeout)
			startingAt: 1.
		nextBlockNumber := nextBlockNumber + chunkSize.
		alreadyRead := alreadyRead + 256.
		remaining := remaining - 256. 
		].
	"Transcript show: '... done
	'."
	^ answer.