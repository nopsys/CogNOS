initialize-release
identityMapping 
	| tables space count |
	space := self pageTableMappedSpace.
	count := self pageTablesCount.
	tables := OrderedCollection new: count.
	1 to: count do: [:i | 
		| table | table := PageTable entriesCount: self pageTableEntriesCount entrySize: self pageTableEntrySize. 
						 table identityMappingStartingAt: (i - 1) * space pageSize: self pageSize.
						 tables add: table.
	].
	directory := PageDirectory entriesCount: count entrySize: 4 pageTables: tables.
