collection
do: aBlock
	| memoryAddress entry |
	memoryAddress := self address.
		[memoryAddress - self address > self size] 
	whileFalse:
		[entry := MultiBootMemoryMapEntry fromHandle: (ExternalAddress fromInteger: memoryAddress).
		aBlock value: entry.
		memoryAddress := memoryAddress + entry size]