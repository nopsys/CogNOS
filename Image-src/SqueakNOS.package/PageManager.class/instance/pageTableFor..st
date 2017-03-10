accesing
pageTableFor: anAddress
	| directoryIndex tableIndex |
	directoryIndex := self pageDirectoryIndexFor: anAddress.
	^directory pageTableAtIndex: directoryIndex.
	