as yet unclassified
onPCIEntry: aPCIBusEntry
	^self atMemoryAddress: aPCIBusEntry allMemoryRanges first key.
