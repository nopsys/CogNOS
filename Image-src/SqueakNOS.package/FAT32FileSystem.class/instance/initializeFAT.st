initialize-release
initializeFAT
	| strm |
	strm := StreamOnStream on: stream offset: self fatBeginLBA size: self clustersCount * 4.
	fat := FAT32FileAllocationTable contents: strm