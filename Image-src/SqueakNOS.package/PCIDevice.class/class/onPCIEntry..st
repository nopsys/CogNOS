instance creation
onPCIEntry: aPCIBusEntry
	^self onPort: aPCIBusEntry allIORanges first key
