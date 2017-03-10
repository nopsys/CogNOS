as yet unclassified
onPCIEntry: aPCIBusEntry computer: aComputer
	| answer |
	answer := super onPCIEntry: aPCIBusEntry computer: aComputer.
	aComputer defaultNetworkInterface: answer.
	^answer