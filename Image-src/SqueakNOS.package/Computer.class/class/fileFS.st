filesystem
fileFS
	| diskStream |
	diskStream := StandardFileStream fileNamed: './testdata/ExampleFAT32.raw'.
	^FAT32FileSystem of: diskStream partition: 1