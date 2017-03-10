private
startOfClusterSectors
	^(self offsetToPartition + (self numberOfCopiesOfFAT * self bytesPerFAT) / self bytesPerSector) + self reservedSectors.