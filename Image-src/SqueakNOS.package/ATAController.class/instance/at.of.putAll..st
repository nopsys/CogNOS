services
at: firstSectorNumber of: aDeviceNumber putAll: aByteArray
	| nextSectorNumber |
	nextSectorNumber := firstSectorNumber - 1. "Decrement 1 because block num comes 1-based and LBA indexes are 0-based"
	self groupsOfMax: 256 * 512 atATimeIn: aByteArray do: [ :sectorContents |
		self
			issueWrite: sectorContents
			at: nextSectorNumber
			device: aDeviceNumber
			timeout: self writeMillisecondsTimeout.
			nextSectorNumber := nextSectorNumber + 256.
	].


	
