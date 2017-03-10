as yet unclassified
testPageIndexesPageAligned
	| memory manager addresses |
	memory := Memory new size: 200000000. "100mb"
	manager := PageManager forMemory: memory.
	addresses := manager directory entries collect: [:entry | entry pointedAddress].
	self assert: manager directory externalAddress \\ 4096 = 0;
	assert: (addresses allSatisfy: [:address | address \\ 4096 = 0])