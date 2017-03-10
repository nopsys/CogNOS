internal
imagePagesCount
	| image pageSize startAddress rest firstSpace addendum |
	image := self size.
	pageSize := computer memoryManager pageSize. 
	startAddress := self objectMemoryStartAddress.
	addendum := 0.
	startAddress isPageAligned ifFalse: [
		rest := (image \\ pageSize).
		firstSpace := (startAddress bitOr: 16r00000FFF) - startAddress.
		(firstSpace > rest) ifFalse: [addendum := 1].
	].
	^(image / pageSize) ceiling + addendum