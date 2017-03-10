private
writeAllAvailable: aByteArray
	self groupsOf: 512 atATimeIn: aByteArray do: [ :sectorContents |
		self waitUntilDataTransferIsReady.
		self atDataPortRegWrite: sectorContents.
	].
