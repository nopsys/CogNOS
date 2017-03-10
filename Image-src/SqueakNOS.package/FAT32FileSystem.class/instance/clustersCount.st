private
clustersCount
	^(bootRecord numberOfSectorsInPartition - (self numberOfCopiesOfFAT * self bytesPerFAT / self bytesPerSector + self reservedSectors)) / self sectorsPerCluster.