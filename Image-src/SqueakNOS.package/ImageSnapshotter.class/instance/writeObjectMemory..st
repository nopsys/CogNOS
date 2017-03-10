as yet unclassified
writeObjectMemory: aStream
	| startAddress firstPageOffset pages lastAddress lastPageLimit |
	pages := self imagePagesCount.
	startAddress := self objectMemoryStartAddress.
	firstPageOffset := startAddress - (startAddress bitAnd: 16rFFFFF000).
	aStream nextPutAll: ((self imageMemoryReadOnlyPageContents: 1) allButFirst: firstPageOffset).
	2 to: pages - 1 do: [:index | | memory |
		index \\ 1000 = 0  ifTrue: [Computer current primPushDebugString: 'Writing page number ', index asString, String cr].
		aStream nextPutAll: (self imageMemoryReadOnlyPageContents: index)
	].
	lastAddress := startAddress + self size.
	lastPageLimit := lastAddress - (lastAddress bitAnd: 16rFFFFF000).
	aStream nextPutAll: ((self imageMemoryReadOnlyPageContents: pages) first: lastPageLimit)