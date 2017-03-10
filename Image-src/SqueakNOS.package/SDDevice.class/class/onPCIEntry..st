instance creation
onPCIEntry: aPCIBusEntry
	^self atMemoryAddress: aPCIBusEntry allMemoryRanges first key.
