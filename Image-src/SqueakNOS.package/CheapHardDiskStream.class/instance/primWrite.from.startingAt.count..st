primitives
primWrite: aDriveNumber from: stringOrByteArray startingAt: startIndex count: count
	"remember that fileID isn't an ID but actually an ATA Device."
	| pos |
	pos := self primGetPosition: fileID.
	fileID replaceFromByte: offset + 1 bytesCount: count 
		  with: stringOrByteArray startingAtByte: startIndex.
	fileSize := fileSize max: pos + count.
	self primSetPosition: fileID to: pos + count.
	^count
