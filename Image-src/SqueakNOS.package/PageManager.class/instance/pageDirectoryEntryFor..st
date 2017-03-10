accesing
pageDirectoryEntryFor: anAddress
	| index |
	index := self pageDirectoryIndexFor: anAddress.
	^directory entryFor: index 