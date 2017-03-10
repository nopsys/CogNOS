translation
translate: anAddress
	| directoryIndex tableIndex offset table address |
	directoryIndex := self pageDirectoryIndexFor: anAddress.
	tableIndex := self pageTableIndexFor: anAddress.
	offset := self offsetFor: anAddress.
	table := directory pageTableAtIndex: directoryIndex.
	address := table phisicalAddressFor: tableIndex.
	^address + offset