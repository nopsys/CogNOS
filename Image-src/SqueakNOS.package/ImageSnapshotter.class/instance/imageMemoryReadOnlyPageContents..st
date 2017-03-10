as yet unclassified
imageMemoryReadOnlyPageContents: aNumber	
	| size address contents manager |
	manager := computer memoryManager.
	size := manager pageSize.	
	address := self objectMemoryStartAddress + (aNumber - 1 * size) bitAnd: 16rFFFFF000.	
	^savedPages at: address ifAbsent: [
		(computer kernelPageAt: address) ifNotNilDo: [:page | page contents] ifNil: [
			contents := (Buffer at: address size: 4096) contents. 			
			(manager pageTableEntryFor: address) readWrite.
			contents := (computer kernelPageAt: address) ifNil: [contents].
			contents		
		]
	]