copying
deepCopy
	| pageTables readOnlyTables |
	pageTables := self pageTables.
	readOnlyTables := OrderedCollection new: pageTables size.
	pageTables do: [:table | readOnlyTables add: (PageTable fromTable: table)].
	^self class entriesCount: self entriesCount entrySize: self entrySize pageTables: readOnlyTables