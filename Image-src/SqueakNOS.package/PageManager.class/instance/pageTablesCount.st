accesing
pageTablesCount 
	| size space |
	"size := self memory size."
	size := 1024 * 1024 * 1024 * 4.
	space := self pageTableMappedSpace.
	^(size / space) ceiling.
	