as yet unclassified
testBootRecord
	| br |
	br := self newInstance bootRecord.
	self assert: br bytesPerSector = 512;
		assert: br sectorsPerCluster = 1;
		assert: br reservedSectors = 16r20;
		assert: br numberOfCopiesOfFAT = 2;
		assert: br mediaDescriptor = 16rF8;
		assert: br sectorsPerTrack = 16r20;
		assert: br numberOfHeads = 4;
"		assert: br numberOfHiddenSectors = 16r20;"
"		assert: br numberOfSectorsInPartition = 16r0107E0;"
"		assert: br sectorsPerFAT = 16r020C;"
		assert: br flags = 0;
		assert: br versionOfFAT32Drive = 0;
		assert: br clusterNumberOfStartOfRootDir = 2;
		assert: br sectorNumberOfFSInformationSector = 1;
		assert: br logicalDriveNumberOfPartition = 16r80;
		assert: br extendedSignature = 16r29;assert: br volumeNameOfPartition = 'NO NAME    ';
		assert: br fatName = 'FAT32   ';
		"assert: br executableCode = ;"
		assert: br bootRecordSignature = 16rAA55.
		