as yet unclassified
testCopyOnWriteHandling
	| memory manager directory pte pageTable pageTableAfterFault pteAfterFault |
	memory := Memory new size: 1048576. "1mb"
	manager := PageManager forMemory: memory.
	manager from: 0 to: 8192 useHandler: #copyOnWrite.
	directory := manager directory.
	pageTable := manager pageTableFor: 5000.
	pte := manager pageTableEntryFor: 5000.
	pte readOnly.
	manager resolvePageFaultOn: 5000.
	pageTableAfterFault := manager pageTableFor: 5000.
	pteAfterFault := manager pageTableEntryFor: 5000.	
	self deny: pageTable externalAddress = pageTableAfterFault externalAddress;
		 assert: (pageTable contentsFrom: 1 to: 4) = (pageTableAfterFault contentsFrom: 1 to: 4);
		assert: (pageTable contentsFrom: 9 to: 4096) = (pageTableAfterFault contentsFrom: 9 to: 4096);
		assert: pteAfterFault isPresentAndAllowed