as yet unclassified
newInstance
	| stream |
	stream := Computer isSqueakNOS 
		ifTrue: [ CheapHardDiskStream on: ATAController primary master ] 
		ifFalse: [CheapHardDiskStream on: (BlockDeviceOnStream on: (StandardFileStream fileNamed: './testdata/ExampleFAT32.raw') blockSize: 512)].
	stream readWrite.
	^FAT32FileSystem of: stream partition: 1.