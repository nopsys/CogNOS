accessing
writeDataOld: source fromByte: sourceOffset atByteOffset: destOffset bytesCount: count on: aDriveNumber
	"Write count bytes from source starting at startIndex bytes. We handle half sector
	 overwriting. Should be optimized so it doesn't write intermediate sectors (which will
	 be completely overwritten)."
	| data sector sectorCount startOffset |
	sector := self offsetToSector: destOffset.
	sectorCount := (self offsetToSector: count) + 1.
	data := self
		sectorCount: sectorCount;
		selectSector: sector ofDrive: aDriveNumber;
		cmdReadSectorsWithRetry;
		readAllAvailable.
	startOffset := destOffset \\ 512 + 1.
	data
		replaceFrom: startOffset
		to: startOffset + count - 1
		with: source
		startingAt: sourceOffset.
		
	self
		sectorCount: sectorCount;
		selectSector: sector ofDrive: aDriveNumber;
		cmdWriteSectorsWithRetry;
		atDataPortRegWrite: data.
		
	^count.