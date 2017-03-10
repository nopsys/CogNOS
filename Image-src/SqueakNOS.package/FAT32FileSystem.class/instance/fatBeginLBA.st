private
fatBeginLBA
	^self offsetToPartition + (self reservedSectors * self bytesPerSector)
	
