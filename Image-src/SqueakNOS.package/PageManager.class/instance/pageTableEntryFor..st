accesing
pageTableEntryFor: anAddress
	| table index |
	table := self pageTableFor: anAddress.
	index := self pageTableIndexFor: anAddress.
	^table entryFor: index 