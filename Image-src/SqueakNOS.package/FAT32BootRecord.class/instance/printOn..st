as yet unclassified
printOn: out

	out nextPutAll: 'Boot sector named ', self volumeNameOfPartition; cr.
	out nextPutAll: 'Bytes per sector: ', self bytesPerSector; cr.
	out nextPutAll: 'Sectors per cluster: ', self sectorsPerCluster; cr.
	out nextPutAll: 'Cluster number of start of root dir: ', self clusterNumberOfStartOfRootDir; cr.
	out nextPutAll: 'Sectors per FAT: ', self sectorsPerFAT; cr.
	out nextPutAll: 'Sectors per track: ', self sectorsPerTrack; cr.
	out nextPutAll: 'Number of sectors in partition: ', self numberOfSectorsInPartition; cr.
	out nextPutAll: 'Number of copies of FAT: ', self numberOfCopiesOfFAT; cr.
	out nextPutAll: 'Reserved sectors: ', self reservedSectors.
	