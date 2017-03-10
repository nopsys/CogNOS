filesystem
blankDiskOnFileForTest
	^BlockDeviceOnStream on: (StandardFileStream fileNamed: './testdata/blank') blockSize: 512.