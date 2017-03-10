instance creation
onPCIEntry: aPCIBusEntry computer: aComputer
	| answer |
	answer := self onPCIEntry: aPCIBusEntry.

	aPCIBusEntry
		enableBusMastering;
		enableIO.

	" copyed from GRUB, not sure if needed or not:"
	aPCIBusEntry latencyTimer < 32 ifTrue: [aPCIBusEntry latencyTimer: 32].

	aComputer interruptController
		addHandler: answer
		forIRQ: aPCIBusEntry interruptLine.

	^ answer